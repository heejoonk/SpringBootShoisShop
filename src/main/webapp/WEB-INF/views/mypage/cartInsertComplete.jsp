<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	var ans = confirm("장바구니에 상품이 추가되었습니다. 장바구니로 이동할까요?");
	if( ans){
		location.href="cartList";
	}else{
		location.href="productDetail?pseq=${pseq}";
	}
</script>
</body>
</html>