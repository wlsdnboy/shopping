package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.domain.BoardAttachVO;
import com.shop.domain.BoardVO;
import com.shop.domain.Criteria;
import com.shop.mapper.BoardAttachMapper;
import com.shop.mapper.BoardMapper;
import com.shop.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j // lombok 로그 이용.
@Service // 이 클래스가 서비스 계층을 맡는다고 알림.
@AllArgsConstructor // 모든 매개변수에 대한 생성자 생성.(생성자 여러개 아님)
public class BoardServiceImp implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);
		mapper.insertSelectKey(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});

	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify......" + board);
		boolean modifyResult = false; // 게시물 수정 성공 여부.
		modifyResult = mapper.update(board) == 1;
		int attachList = 0;// 첨부파일 갯수.
		if (board.getAttachList() != null) {
			attachList = board.getAttachList().size();
		}
		long bno = board.getBno();
		attachMapper.deleteAll(bno);
		if (modifyResult && attachList > 0) {
			// 등록하려는 첨부파일 목록(11,22)
			List<BoardAttachVO> inputList = board.getAttachList();
			// 디비에 등록되어 있는 첨부파일 목록(22,33)
//			// List<BoardAttachVO> dbList =
//			attachMapper.findByBno(board.getBno());
			// 파일은 삭제 했어도, 디비 정보가 남아 있는 부분을 해소.
			for (BoardAttachVO bav : inputList) {
				bav.setBno(bno);
				attachMapper.insert(bav);
			}
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove......" + bno);
		attachMapper.deleteAll(bno);
		replyMapper.deleteAll(bno);

		return (mapper.delete(bno)) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getListWithPaging......");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno: " + bno);
		return attachMapper.findByBno(bno);
	}

}
