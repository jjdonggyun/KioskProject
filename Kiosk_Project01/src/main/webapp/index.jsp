<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
//한글 처리
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가운데 페이지</title>
</head>
<body>
    <div style="text-align: center; margin-top: 200px;">
        <h1>여기에 아무 글씨나 쓰세요</h1>
    </div>

    <script>
        // 3초 뒤에 plus_product로 이동
        setTimeout(function() {
            window.location.href = "plus_product";
        }, 3000); // 3000 밀리초 = 3초
    </script>
</body>
</html>