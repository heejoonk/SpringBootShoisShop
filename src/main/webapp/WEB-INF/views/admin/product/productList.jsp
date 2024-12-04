<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 <%@ include file="../sub_menu.jsp"%>


<article>
	<form method="get" name="frm">
		<div class="tb">
		<div class="row">
			<div class="col" style="display: flex; align-items: center;">
				상품명 &nbsp; <input type="text" name="key" value="${key}"/>&nbsp;&nbsp;&nbsp;
				<input class="btn" type="button" name="btn_search" value="검색"  
					onClick="go_search('adminProductList')"/>
				&nbsp;&nbsp;&nbsp;
				<input type="button"  style="margin-left:auto" value="상품등록"  onClick="go_write();"/>
			</div>
		</div>
		<div class="row">
			<div class="coltitle">번호</div>
			<div class="coltitle">상품명</div>
			<div class="coltitle">원가</div>
			<div class="coltitle">판매가</div>
			<div class="coltitle">등록일</div>
			<div class="coltitle">사용유무</div>
		</div>	
		<c:forEach items="${productList}" var="productVO" >
			<div class="row">
				<div class="col">${productVO.pseq}</div>
				<div class="col" onClick="go_detail( '${productVO.pseq}' )">${productVO.name}</div>
				<div class="col"><fmt:formatNumber value="${productVO.price1}" /></div>
				<div class="col"><fmt:formatNumber value="${productVO.price2}" /></div>
				<div class="col"><fmt:formatDate value="${productVO.indate}"/></div>
				<div class="col">
					<c:choose>
			      		<c:when test='${productVO.useyn=="N"}'>미사용</c:when>
			   	 		<c:otherwise>사용</c:otherwise> 
					</c:choose>
				</div>
			</div>	
		</c:forEach>
		<div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminProductList?page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				
				
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminProductList?page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>
								
				
				<c:if test="${paging.next}" >
					<a href="adminProductList?page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
	</form>
</article>
<%@ include file="../footer.jsp"%>





