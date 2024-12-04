<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
<section>
	<%@ include file="sub_image_menu.jsp" %>
	<article>
		<form>
			<h2> Q & A List </h2>
			<div class="tb">
				<div class="row">
					<div class="coltitle">번호</div>
					<div class="coltitle">제목</div>
					<div class="coltitle">작성일</div>
					<div class="coltitle">답변여부</div>
				</div>
				<c:forEach items="${qnaList}" var="qnaVO" >
					<div class="row">
						<div class="col">${qnaVO.qseq}</div>
						<div class="col">
							<c:choose>
									<c:when test="${qnaVO.secret=='Y' }">
										<div onClick="qnaViewWithPass('${qnaVO.pass}', '${qnaVO.qseq}')">${qnaVO.subject}&nbsp;<img src="/images/key.png" style="width:20px;vertical-align: middle"></div>
									</c:when>
									<c:otherwise>
										<div onClick="qnaView('${qnaVO.qseq}')">${qnaVO.subject}</div>
									</c:otherwise>
							</c:choose>
						</div>
						<div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
						<div class="col">
							<c:choose>
								<c:when test="${empty qnaVO.reply }">NO</c:when>
								<c:otherwise>YES</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
				
				<div class="row">  <!-- 페이지의 시작 -->
					<div class="coltitle" style="font-size:120%; font-weight:bold;">
						<c:if test="${paging.prev}" >
							<a href="qnaList?page=${paging.beginPage-1}">◀</a>
						</c:if>
						&nbsp;
						
						<c:forEach begin="${paging.beginPage}"  end="${paging.endPage}" var="index">
							<c:if test="${index!=paging.page}" >
								<a href="qnaList?page=${index}">${index}&nbsp;</a>
							</c:if>
							<c:if test="${index==paging.page}" >
								<span style="color:red">${index}&nbsp;</span>
							</c:if>
						</c:forEach>
						
						&nbsp;
						<c:if test="${paging.next}" >
							<a href="qnaList?page=${paging.endPage+1}">▶</a>
						</c:if>
					</div>
				</div><!-- 페이지의 끝 -->
				
				<div class="row">
					<div class="coltitle">
						<div class="btn">
							<input type="button" value="질문하기" 
							onClick="location.href='writeQnaForm'"/>
						</div>
					</div>
				</div>
				
			</div>
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>