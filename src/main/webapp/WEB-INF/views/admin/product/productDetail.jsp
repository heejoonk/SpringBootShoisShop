<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<form>
			<h2> Product Detail View </h2>
			<div class="field" style="border-top:2px solid blueviolet;">
					<label>상품분류</label><div>${category}</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
					<label>상품명</label><div>${productVO.name}</div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
					<label>원가</label><div><fmt:formatNumber value="${productVO.price1}"/></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
					<label>판매가</label><div><fmt:formatNumber value="${productVO.price2}"/></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
					<label>마진</label><div><fmt:formatNumber value="${productVO.price3}"/></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet;">
					<label>상세설명</label><div><pre>${productVO.content}</pre></div>
			</div>
			<div class="field" style="border-top:1px dotted blueviolet; border-bottom:2px solid blueviolet;">
					<label>상품이미지</label>
					<div><img src="product_images/${productVO.savefilename}" width="300"></div>
			</div>
			<div class="btn">
				<input  type="button" value="수정" onClick="go_mod('${productVO.pseq}')">
				<input  type="button" value="삭제" onClick="deleteProduct('${productVO.pseq}')">
				<input  type="button" value="목록" 
					onClick="location.href='adminProductList'">
			</div>
			
	 
</article>

<%@ include file="../footer.jsp"%>