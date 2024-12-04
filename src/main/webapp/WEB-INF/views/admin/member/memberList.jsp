<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<article>
<form method="post" name="frm">
	<div class="tb">
		<div class="row">
			<div class="col" style="display:flex; align-items: center">
					회원 성명&nbsp; <input type="text" name="key" value="${key}" />&nbsp;&nbsp;&nbsp;
					<input class="btn" type="button" name="btn_search" value="검색"
						onClick="go_search( 'adminMemberList')" />&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="row">
			<div class="coltitle" style="flex:2">아이디</div>
			<div class="coltitle" style="flex:1">이름</div>
			<div class="coltitle" style="flex:3">이메일</div>
			<div class="coltitle" style="flex:1">우편번호</div>
			<div class="coltitle" style="flex:4">주소</div>
			<div class="coltitle" style="flex:1">전화</div>
			<div class="coltitle" style="flex:1">가입일</div>
		</div>	
		<c:forEach items="${memberList}" var="memberVO">
			<div class="row">
				<div class="col" style="flex:2; display: flex; justify-content: center; align-items: center">	${memberVO.userid}	</div>
				<div class="col" style="flex:1; display: flex;justify-content: center; align-items: center">${memberVO.name} </div>
				<div class="col" style="flex:3; display: flex;justify-content: center; align-items: center">${memberVO.email} </div>
				<div class="col" style="flex:1; display: flex;justify-content: center; align-items: center">${memberVO.zip_num} </div>
				<div class="col" style="flex:4; display: flex; justify-content: flex-start; align-items: center">${memberVO.address1} ${memberVO.address2}</div>
				<div class="col" style="flex:1">${memberVO.phone} </div>
				<div class="col" style="flex:1"><fmt:formatDate value="${memberVO.indate}" /></div>
			</div>	
		</c:forEach>


        <div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="shop.do?command=adminMemberList&page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				
				
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="shop.do?command=adminMemberList&page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>
								
				
				<c:if test="${paging.next}" >
					<a href="adminMemberList&page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
		
	</div>
	
<form>
</article>


<%@ include file="../footer.jsp"%>