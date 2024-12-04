<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<article>
<form method="get" name="frm">
	<div class="tb">
		<div class="row">
			<div class="col" style="display:flex; align-items: center">
					주문 상품명 &nbsp; <input type="text" name="key" value="${key}" />&nbsp;&nbsp;&nbsp;
					<input class="btn" type="button" name="btn_search" value="검색"
						onClick="go_search( 'adminOrderList' )" />&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="row">
			<div class="coltitle" style="flex:2">주문번호(처리)</div>
			<div class="coltitle" style="flex:1">주문자</div>
			<div class="coltitle" style="flex:1">상품명</div>
			<div class="coltitle" style="flex:1">수량</div>
			<div class="coltitle" style="flex:1">우편번호</div>
			<div class="coltitle" style="flex:4">주소</div>
			<div class="coltitle" style="flex:2">주문일</div>
		</div>	
		<c:forEach items="${orderList}" var="orderVO">
			<div class="row">
				<div class="col" style="flex:2">
					${orderVO.oseq}
					<c:if test="${orderVO.result==1}" >
						(<input type="checkbox" name="result" value="${orderVO.odseq}"> 주문완료)
					</c:if>
					<c:if test="${orderVO.result==2}" >
						(<input type="checkbox" name="result" value="${orderVO.odseq}">배송중)
					</c:if>
					<c:if test="${orderVO.result==3}" >
						(<span style="font-weight: bold; color: blue">배송완료</span>)
					</c:if>
					<c:if test="${orderVO.result==4}" >
						(<span style="font-weight: bold; color: red">구매확정</span>)
					</c:if>
				</div>
				
				<div class="col" style="flex:1">${orderVO.mname}</div>
				<div class="col" style="flex:1">${orderVO.pname}</div>
				<div class="col" style="flex:1">${orderVO.quantity}</div>
				<div class="col" style="flex:1">${orderVO.zip_num}</div>
				<div class="col" style="flex:4">${orderVO.address1} ${orderVO.address2}</div>
				<div class="col" style="flex:2"><fmt:formatDate value="${orderVO.indate}" /></div>
			</div>	
		</c:forEach>
		
		
		<div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminOrderList?page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				
				
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminOrderList?page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>
								
				
				<c:if test="${paging.next}" >
					<a href="adminOrderList?page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
		
		
		<div class="btn">
			<input type="button" style="width: 200px" value="다음단계로" onClick="go_order_next()">
		</div>
	</div>
	
<form>
</article>


<%@ include file="../footer.jsp"%>