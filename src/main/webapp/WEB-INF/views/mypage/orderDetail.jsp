<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>

	<%@ include file="sub_image_menu.jsp" %>
	<article>
		<form name="cartFrm" method="post">
			<h2>주문자 정보</h2>
			<div class="tb" style="margin-bottom:20px">
				<div class="row">
					<div class="coltitle">주문일자</div>
					<div class="coltitle">주문번호</div>
					<div class="coltitle">주문자성명</div>
					<div class="coltitle">주문총액</div>
				</div>
				<div class="row">
					<div class="col"><fmt:formatDate value="${orderDetail.indate}" type="date"/></div>
					<div class="col">${orderDetail.oseq}</div>
					<div class="col">${orderDetail.mname}</div>
					<div class="col"><fmt:formatNumber type="currency"	value="${totalPrice}" /></div>
				</div>
				<div class="row">
					<div class="coltitle" style="flex:1">배송주소</div>
					<div class="col"  style="flex:4; justify-content: flex-start;">
						${orderDetail.zip_num} ${orderDetail.address1} ${orderDetail.address2} ${orderDetail.address3}
					</div>
				</div>
			</div>
			
			<h3>주문 상품 정보</h3>
				<div class="tb" >
						<div class="row">
							<div class="coltitle">상품명</div>
							<div class="coltitle">상품별 주문번호</div>
							<div class="coltitle">수량</div>
							<div class="coltitle">가격</div>
							<div class="coltitle">주문상태</div>
							<div class="coltitle">&nbsp;</div>
						</div>
						<c:forEach items="${orderList}" var="orderVO">
							<div class="row">
								<div class="col">${orderVO.pname}</div>
								<div class="col">${orderVO.odseq}</div>
								<div class="col">${orderVO.quantity}</div>
								<div class="col">
									<fmt:formatNumber type="currency" value="${orderVO.price2*orderVO.quantity}" />
								</div>
								<div class="col">
									<c:if test="${orderVO.result==1}">주문(결제)완료</c:if>
									<c:if test="${orderVO.result==2}">배송중</c:if>
									<c:if test="${orderVO.result==3}">배송완료</c:if>
									<c:if test="${orderVO.result==4}">구매확정</c:if>
								</div>
								<div class="col">
									<c:if test="${orderVO.result==3}">
										<input type="button" value="구매 확정"  onClick="purchaseOk('${orderVO.odseq}', '${orderVO.oseq}')"/>
									</c:if>
								</div>
							</div>
						</c:forEach>
						
						<div class="btn">
							<input type="button" value="뒤로"  onclick="history.go(-1)">
							<input type="button" value="메인으로"  onclick="location.href='/'">
						</div>
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>