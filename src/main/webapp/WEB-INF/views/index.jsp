<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- index.jsp 의 내용 -->
<div id="main_img">
	<img src="/images/main_img.jpg"  />
</div>

<!-- 신상품 -->
<div id="BestItem">
	<h2>Best Item</h2>   
	<div class="products">
		<c:forEach items="${bestList}" var="pvo" >
			<div class="item" onClick="location.href='productDetail?pseq=${pvo.pseq}'" >
					<div><img src="/product_images/${pvo.savefilename}" /></div>
					<div>${pvo.name} 
						- <fmt:formatNumber value="${pvo.price2}" type="currency" /></div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 베스트상품 -->
<div id="NewItem">
	<h2>New Item</h2>   
	<div class="products">
		<c:forEach items="${newList}" var="pvo" >
			<div class="item"  onClick="location.href='productDetail?pseq=${pvo.pseq}'" >
					<div><img src="/product_images/${pvo.savefilename}" /></div>
					<div>${pvo.name} 
						- <fmt:formatNumber value="${pvo.price2}" type="currency" /></div>		
			</div>
		</c:forEach>
	</div>	
</div>

<%@ include file="footer.jsp" %>