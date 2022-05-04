<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/navbar.jsp"%>
<!doctype html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/style.css" rel="stylesheet">

<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> -->



<title>Hello, world!</title>



</head>

<body>
	



	<!-- ì¹ ë°°ê²½ íë©´ -->
	<video class="video-container" autoplay muted loop>
		<source src="resources/img/San Francisco, 2019.mp4">
	</video>
	<section>
		<div class="main_container" data-aos="fade-up">

			<img src="resources/img/i4p.jpg" class="imagesection">
			<div class="middle">
				<button class="Book-Button">LOOKBOOK</button>
			</div>
		</div>
		

		<div class="main_container" data-aos="fade-up">
			<img src="resources/img/stussy.webp" class="imagesection_1">
			<div class="middle-text">
				<button class="Book-Button">NEW</button>
			</div>
		</div>
		


		<div class="main_container" data-aos="fade-up">

			<img src="resources/img/stussy_next.webp" class="imagesection_2">
			<div class="middle-text_1">
				<button class="Book-Button">STORY</button>
			</div>
		</div>
		

		<div class="main_container" data-aos="fade-up">
			<img src="resources/img/i4p1.jpg" class="imagesection_3">
			<div class="middle_1">
				<button class="Book-Button">SALE</button>
			</div>
		</div>
		

	</section>








<%@ include file="includes/footer.jsp"%>





	<script>
		AOS.init({
			duration : 1500
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>


</body>


</html>
