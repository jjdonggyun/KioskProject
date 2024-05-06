<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인화면</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/footer.css">
    <!-- JS 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <!-- prefix js파일 -->
    <script src="./js/prefixfree.min.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- header start -->
		<header>
			<jsp:include page="/include/header.jsp" />
		</header>
		<!-- header finish -->
		<!-- content start -->
		<main>
			<section class="content_main">
				<jsp:include page="/include/content.jsp" />
			</section>
		</main>
		<!-- content finish -->
		<!-- footer start -->
		<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>
		<!-- footer finish -->
	</div>
</body>
</html>