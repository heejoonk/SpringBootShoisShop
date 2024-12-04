<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" >
function idok(id){
	opener.document.joinForm.userid.value=id;
	opener.document.joinForm.reid.value=id;
	self.close();
}
</script>
<link rel="stylesheet" href="css/section.css" />
</head>
<body>
<form method="post" name="idCheckForm" action="shop.do?command=idcheck" >
	<h2>ID 중복확인</h2>
	<label>User ID</label>&nbsp;<input type="text" name="userid" value="${userid}" >
	<input type="submit" value="검색" ><br><br><br>		
</form>
<c:choose>
	<c:when test="${result==-1}">
		${userid}는 이미 사용중인 아이디입니다.
		<script type="text/javascript">
			opener.document.joinForm.userid.value="";
			opener.document.joinForm.reid.value="";
		</script>
	</c:when>
	<c:otherwise>
		${userid}는 이미 사용가능합니다.<input type="button" value="사용할께요" onclick="idok('${userid}');">
	</c:otherwise>
</c:choose>

</body>
</html>




