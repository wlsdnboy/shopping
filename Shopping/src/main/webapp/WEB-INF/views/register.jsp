<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>


	<br>
	<br>
	<br>

	<div style="width: 70%; margin: auto;">
		<form method="post" action="/register">

			<div class="mb-3">
				<label class="form-label"> 제목 </label> <input type="text"
					class="form-control" name="title">

			</div>
			<div class="mb-3">
				<label class="form-label"> 작성자 </label> <input type="text"
					class="form-control" name="writer">

			</div>




			<br>
			<textarea name="content" class="form-control"
				style="height: 500px; resize: none;"></textarea>


			<br />
			<button type="submit" class="btn btn-dark" style="float: right;">작성</button>
		</form>
	</div>
	<br />
	<br />
	<div class="row" style="width: 70%; margin: auto;">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="form-group uploadDiv">
						파일 첨부: <input type="file" name="uploadFile" multiple>
					</div>
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br />
	<script>
		$(document)
				.ready(
						function(e) {
							var formObj = $("form[role='form']");
							$("button[type='submit']").on("click", function(e) {
								e.preventDefault();
								console.log("submit clicked");
							});
							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							// 정규표현식. 일부 파일의 업로드 제한.
							//

							// https://regexper.com/
							var maxSize = 5242880; // 5MB
							function checkExtension(fileName, fileSize) {
								if (fileSize >= maxSize) {
									alert("파일 크기 초과");
									return false;
								}
								if (regex.test(fileName)) {
									alert("해당 종류의 파일은 업로드 불가.");
									return false;
								}
								return true;
							}
							$("input[type='file']")
									.change(
											function(e) {
												var formData = new FormData();
												var inputFile = $("input[name='uploadFile']");
												var files = inputFile[0].files;
												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i]);
												}
												$
														.ajax({
															url : '/uploadAjaxAction',
															processData : false,
															contentType : false,
															data : formData,
															type : 'POST',
															dataType : 'json',
															success : function(
																	result) {
																console
																		.log(result);
																showUploadResult(result);
															}
														});
											});
							function showUploadResult(uploadResultArr) {
								if (!uploadResultArr
										|| uploadResultArr.length == 0) {
									// json 처리 결과가 없다면 함수 종료.
									return;
								}
								var uploadUL = $(".uploadResult ul");
								var str = "";

								// each 구문은 전달된 배열의 길이 만큼, 
								// each 이후의 함수를 반복 처리.
								// https://api.jquery.com/jQuery.each/#jQuery-each-array-callback
								$(uploadResultArr)
										.each(
												function(i, obj) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													// encodeURIComponent : 
													// uri 로 전달되는 특수문자의 치환.
													// & ?
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");
													// 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.

													str += "<li data-path='";
					str += obj.uploadPath+"' data-uuid='";
					str += obj.uuid+"' data-filename='";
					str += obj.fileName+"' data-type='";
					str += obj.image+"'><div>";
													str += "<img src='/resources/img/attach.png' width='20' height='20'>";
													str += " <span>"
															+ obj.fileName
															+ "</span> ";
													str += "<b data-file='"+fileCallPath;
					str += "' data-type='file'>[x]</b>";
													str += "</div></li>";
												});
								uploadUL.append(str);
							}// end_showUploadResult
							// 첨부파일 목록 끝.

							// 첨부파일 목록에서 삭제 처리 이벤트 시작.
							$(".uploadResult").on("click", "b", function(e) {
								// 첨부파일 목록에서 삭제[x]을 클릭한다면,
								console.log("delete file");

								var targetFile = $(this).data("file");// data-file
								var type = $(this).data("type");// data-type
								var targetLi = $(this).closest("li");// 선택한 첨부파일

								$.ajax({
									url : '/deleteFile',
									data : {
										fileName : targetFile,
										type : type
									},
									dataType : 'text',
									type : 'POST',

									success : function(result) {
										alert(result);
										targetLi.remove();
									}
								});
							});
							// 첨부파일 목록에서 삭제 처리 이벤트 끝.

						});
	</script>
</body>
<%@ include file="includes/footer.jsp"%>
</html>
