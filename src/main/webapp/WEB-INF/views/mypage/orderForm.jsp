<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<%@ include file="sub_image_menu.jsp" %>
	<article>
		<form name="cartFrm" method="post">
			<h2>Order Form</h2>
					<div class="tb">
						<div class="row">
							<div class="col" style="flex:1">주문자성명</div>
							<div class="col" style="flex:3;justify-content: flex-start;">${loginUser.name}</div>
						</div>
						<div class="row">
							<div class="col" style="flex:1">주문자 전화번호</div>
							<div class="col" style="flex:3; justify-content: flex-start;">${loginUser.phone}</div>
						</div>


						<div class="row">
							<div class="col" style="flex:1">우편번호</div>
							<div class="col" style="flex:3; justify-content: flex-start;">
								<input type="text" name="zip_num" size="25"   id="sample6_postcode"  readonly/>
								<input type="button" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
							</div>
						</div>
						<div class="row">
							<div class="col" style="flex:1">주소</div>
							<div class="col"  style="flex:3; justify-content: flex-start;">
								<input type="text" name="address1" size="45"     id="sample6_address" readonly/>
							</div>
						</div>
						<div class="row">
							<div class="col" style="flex:1">상세 주소</div>
							<div class="col" style="flex:3; justify-content: flex-start;">
								<input type="text" name="address2"  size="45"      id="sample6_detailAddress" />
							</div>
						</div>
						<div class="row">
							<div class="col" style="flex:1">Zip Code</div>
							<div class="col" style="flex:3; justify-content: flex-start;">
								<input type="text" name="address3"  size="45"    id="sample6_extraAddress"/>
							</div>
						</div>




						<!-- 다음 카카오 도로명 주소 검색을 위한 자바스크립트 코드들 -->
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode( {
									oncomplete: function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if(data.userSelectedType === 'R'){
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if(data.buildingName !== '' && data.apartment === 'Y'){
												extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if(extraAddr !== ''){
												extraAddr = ' (' + extraAddr + ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document.getElementById("sample6_extraAddress").value = extraAddr;

										} else {
											document.getElementById("sample6_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document.getElementById('sample6_postcode').value = data.zonecode;
										document.getElementById("sample6_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById("sample6_extraAddress").focus();
									}
								}).open();
							}
						</script><br>


						<div class="row">
							<div class="col" style="flex:1; justify-content: flex-start;">
								<c:if test="${not empty loginUser.zip_num}">
									<input type="checkbox" name="address" 
									onClick="loadAddress('${loginUser.zip_num}', '${loginUser.address1}', '${loginUser.address2}')"> 
									로그인유저와 주소가 동일합니다
								</c:if>
							</div>
						</div>
						
						<div class="row">
							<div class="coltitle">상품명</div>
							<div class="coltitle">수량</div>
							<div class="coltitle">가격</div>
							<div class="coltitle">주문일</div>
						</div>
						<c:forEach items="${cartList}" var="cartVO" >
							<div class="row">
								<div class="col">${cartVO.pname}</div>
								<div class="col">${cartVO.quantity}</div>
								<div class="col"><fmt:formatNumber value="${cartVO.price2}" 	type="currency" /></div>
								<div class="col">
									<fmt:formatDate value="${cartVO.indate}" type="date"/>
									<input type="hidden" name="cseq" value="${cartVO.cseq}" />
								</div>
							</div>
						</c:forEach>
						<div class="row">
							<div class="col"> 총금액 </div>
							<div class="col"><fmt:formatNumber value="${totalPrice}" type="currency"/></div>
						</div>
					</div>
				
			<div class="btn">
				<input type="button" value="뒤로"  onclick="history.go(-1)">
				<input type="button" value="주문하기"   onclick="go_order()">
			</div>
		</form>
	</article>
</section>

<%@ include file="../footer.jsp" %>