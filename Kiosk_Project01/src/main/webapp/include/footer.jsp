<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" isThreadSafe="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 기존에 이미 생성된 article 요소 -->
    <article class="order-info">
        <!-- 주문 정보가 여기에 동적으로 추가됩니다 -->
    </article>
<section>
	<div>
		<p>남은시간<br>30초</p>
		<p>전체삭제</p>
	</div>
	<button>선택한 상품</button>
	<button class="product_footer">결제하기</button>
</section>
<!-- 모달 창 -->
<div class="modal fade" id="product-modal3" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="productModalLabel">주문리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="footer_modal">
        	<p>주문리스트를 확인해주세요.</p>
        	<ul>
        		<li>메뉴</li>
        		<li>가격</li>
        	</ul>
        	<h3></h3>
        	<h3></h3>
        </div>
        <div class="footer_modal_footer">
	        <button>확인</button>
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
    $(".product_footer").click(function(){
        $("#product-modal3").modal('show');
    });
});
$(document).ready(function(){
    $(".product_footer").click(function(){
        // 주문 정보를 가져와서 모달에 동적으로 할당
        var orderInfo = $(".order-info").html();
        $(".footer_modal ul").html(orderInfo);

        // 총 수량과 총 결제금액도 동적으로 할당
        var totalPrice = 0;
        $(".order-info p").each(function() {
            var priceText = $(this).text().split(' - ')[1]; // 주문 정보에서 가격 부분을 추출
            var price = parseInt(priceText.match(/\d+/)[0]); // 가격에서 숫자 부분만 추출
            totalPrice += price; // 가격을 합산
        });
        
        // 총 결제금액을 할당
        $(".footer_modal h3:eq(1)").text("총 결제금액 " + totalPrice + "원");

        $("#product-modal3").modal('show');
    });
});
</script>