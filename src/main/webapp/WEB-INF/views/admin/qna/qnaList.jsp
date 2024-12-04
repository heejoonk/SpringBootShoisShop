<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<article>
<form method="get" name="frm">
	<div class="tb">
		<div class="row">
			<div class="col" style="display:flex; align-items: center">
					제목&nbsp; <input type="text" name="key" value="${key}" />&nbsp;&nbsp;&nbsp;
					<input class="btn" type="button" name="btn_search" value="검색"
						onClick="go_search( 'adminQnaList')" />&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div class="row">
			<div class="coltitle" style="flex:1">번호(답변여부)</div>
			<div class="coltitle" style="flex:3">제목</div>
			<div class="coltitle" style="flex:1">작성자</div>
			<div class="coltitle" style="flex:1">작성일</div>
		</div>	
		<c:forEach items="${qnaList}" var="qnaVO">
			<div class="row">
				<div class="col" style="flex:1">
					${qnaVO.qseq}
					<c:choose>
			      		<c:when test='${empty qnaVO.reply}'>(미처리)</c:when>
				        <c:otherwise>(답변완료)</c:otherwise>
			    	</c:choose>
				</div>				
				<div class="col" style="flex:3">
					<a href="adminQnaDetail?qseq=${qnaVO.qseq}">
						${qnaVO.subject}
					</a>
				</div>
				<div class="col" style="flex:1; text-align: center;">${qnaVO.userid}</div>
				<div class="col" style="flex:1; text-align: center;"><fmt:formatDate value="${qnaVO.indate}" /></div>
			</div>	
		</c:forEach>
		
		<div class="row">  <!-- 페이지의 시작 -->
			<div class="col" style="font-size:120%; font-weight:bold;">
				<c:if test="${paging.prev}" >
					<a href="adminQnaList?page=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				
				
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index!=paging.page}">
						<a href="adminQnaList?page=${index}">${index}</a>&nbsp;
					</c:if>
					<c:if test="${index==paging.page}">
						<span style="color:red">${index}&nbsp;</span>
					</c:if>
				</c:forEach>
								
				
				<c:if test="${paging.next}" >
					<a href="adminQnaList?page=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		</div><!-- 페이지의 끝 -->
	</div>
	
<form>
</article>


<%@ include file="../footer.jsp"%>