<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<div class="sub_img">
				<img src="/images/product/sub_img.jpg" />
	</div>
	<div class="sub_page" >
		<article  style="flex-direction:column">
			<h2>${category}</h2>
			<div class="categoryproducts">
				<c:forEach items="${categoryProduct}"  var="productVO">
					<div class="categoryitem"  
						onClick="location.href='productDetail?pseq=${productVO.pseq}'" >
						<img src="/product_images/${productVO.savefilename}" />
						<div>${productVO.name}-${productVO.price2}</div>
					</div>  
				</c:forEach>
			</div>
		</article>
	</div>
</section>

<%@ include file="../footer.jsp" %>