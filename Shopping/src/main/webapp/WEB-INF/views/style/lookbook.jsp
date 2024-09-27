<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" name="enrollform" enctype="multipart/form-data"
		action="admin_enroll_product">
		<div class="form-group">
			Main Picture <br> <input class="form-control form-control-user"
				type="file" name="product_image" id="product_image"
				onchange="setThumbnail(event);">
		</div>

		<div class="form-group">
			Detail Picture <br> <input
				class="form-control form-control-user" type="file"
				multiple="multiple" name="product_detail_image"
				id="product_detail_image" onchange="setDetailImage(event);">
		</div>
	</form>


</body>
</html>