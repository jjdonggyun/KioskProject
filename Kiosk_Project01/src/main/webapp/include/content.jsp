<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" isThreadSafe="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//한글 처리
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<ul>
    <c:forEach var="product" items="${products}">
        <li>
            <img src="${product.image_url}" alt="${product.name}" class="product_main">
            <p>${product.name}</p>
            <p>${product.price} 원</p>
        </li>
    </c:forEach>
</ul>

<!-- 모달 창 -->
<div class="modal fade" id="product-modal2" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="main_modal">
            <!-- 수정된 부분: 모달 내에서 상품 이미지, 이름, 가격을 출력 -->
            <img id="modal-product-image" alt="상품">
            <div>
                <p id="modal-product-name"></p>
                <p id="modal-product-price"></p>
            </div>
      	</div>
      	<div class="main_modal_footer">
	        <button>주문담기</button>
	        <button data-dismiss="modal" aria-label="Close">취소</button>
      	</div>
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
    $(".product_main").click(function(){
        // 클릭한 상품의 정보를 가져와서 모달에 설정
        var productImage = $(this).attr('src');
        var productName = $(this).next().text();
        var productPrice = $(this).next().next().text();
        
        $("#modal-product-image").attr('src', productImage);
        $("#modal-product-name").text(productName);
        $("#modal-product-price").text(productPrice);

        $("#product-modal2").modal('show');
    });
    
    $("#product-modal2 .main_modal_footer button:first-child").click(function() {
        var productName = $("#modal-product-name").text();
        var productPriceText = $("#modal-product-price").text();
        // 가격에서 숫자 부분만 추출
        var productPrice = parseInt(productPriceText.replace(/[^\d]/g, ''));
        var orderInfo = '<p>' + productName + ' - 가격: ' + productPrice + '원, 수량: 1개</p>';
        $(".order-info").append(orderInfo);
        $("#product-modal2").modal('hide');
    });
});
</script>