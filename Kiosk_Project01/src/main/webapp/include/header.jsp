<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" isThreadSafe="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//한글 처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<div class="header_top">
    <img src="./images/header_img/homeicon.png" alt="홈아이콘">
    <h1>Easy KIOSK</h1>
    <img src="./images/header_img/plusicon.png" alt="홈아이콘" id="plus-icon">           
</div>
<div class="header_nav">
    <nav>
        <ul>
            <li>시즌메뉴</li>
            <li>커피(HOT)</li>
            <li>커피(ICE)</li>
        </ul>
    </nav>
</div>

<!-- 모달 창 -->
<div class="modal fade" id="product-modal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="productModalLabel">신규 메뉴 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 모달 내용 -->
           <form action="plus_product" method="post">
			    <div class="menu_plus">
			        <div class="menu_plus_header">
			            <h3>새로운 상품을 추가해주세요</h3>
			        </div>
			        <ul>
			            <li>
			                <p>이름</p>
			                <input type="text" name="name" />
			            </li>
			            <li>
			                <p>이미지</p>
			                <input type="text" name="image_url" placeholder="이미지 주소 입력" />
			            </li>
			            <li>
			                <p>상품 가격</p>
			                <input type="text" name="price" placeholder="가격 입력"/>
			            </li>
			            <li>
			                <p>사이즈 업 가격</p>
			                <input type="text" name="size_up_price" placeholder="가격 입력"/>
			            </li>
			            <li>
			                <p>샷 추가 가격</p>
			                <input type="text" name="shot_price" placeholder="가격 입력"/>
			            </li>
			            <li>
			                <p>샷 추가 가능 여부</p>
			                <input type="checkbox" name="shot_available" />
			            </li>
			        </ul>
			        <div>
			            <p><input type="submit" value="저장" class="save-button"/></p>
			            <p><input type="button" value="취소" class="cancel-button" onclick="window.history.back()"/></p>
			        </div>
			    </div>
			</form>
        <!-- 여기에 상품 등록 폼을 추가할 수 있습니다. -->
      </div>
    </div>
  </div>
</div>

<!-- 부트스트랩 JavaScript 파일 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 모달 창을 띄우는 JavaScript 코드 -->
<script>
$(document).ready(function(){
    $("#plus-icon").click(function(){
        $("#product-modal").modal('show');
    });
});
</script>