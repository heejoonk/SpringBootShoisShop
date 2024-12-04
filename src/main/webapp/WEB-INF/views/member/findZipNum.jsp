<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addressOk( zip_num, address1){
		opener.document.joinForm.zip_num.value=zip_num;
		opener.document.joinForm.address1.value=address1;
		self.close();
	}
</script>
</head>
<body>
<div id="popup">
	<form method="post" name="formm" action="shop.do">
		<h2>우편번호 검색</h2>
		<input type="hidden" name="command" value="findZipnum" />
		<label>동 이름</label>&nbsp;<input name="dong"  type="text">
		<input type="submit" value="찾기"  class="submit">
	</form>
	<br />
	<table id="zipcode" border="0" align="center" bgcolor="black" celspacing="1" width="500">
		<tr bgcolor="white"><th width="100">우편번호</th><th>주소</th></tr>
		<c:forEach items="${addressList}" var="add">
			<tr bgcolor="white" height="30">
				<td align="center">
					<a href="#" onClick="addressOk( '${add.zip_num}' , '${add.sido} ${add.gugun} ${add.dong}')">
						${add.zip_num}
					</a>
				</td>
				<td>&nbsp;
					<a href="#" onClick="addressOk( '${add.zip_num}' , '${add.sido} ${add.gugun} ${add.dong}')">
						${add.sido} ${add.gugun} ${add.dong}
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>