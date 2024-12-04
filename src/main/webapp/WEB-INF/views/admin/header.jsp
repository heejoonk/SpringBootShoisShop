<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/css/admin.css" />
<script src="admin/script/admin.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
		$(function(){
				$('#imageAddBtn').click( function(){
						var formselect = $('#fileupForm')[0];   // 지목된 폼을 변수에 저장
						var formData = new FormData( formselect );
						$.ajax(
								{
										url:"<%=request.getContextPath()%>/fileup" ,
										type:"POST",
										enctype:"multipart/form-data",
										data: formData,
										timeout: 10000,
										contentType : false,
										processData : false,

										success: function( data ){
											$('#filename').html("<div>" + data.image + "</div>" );
											$("#filename").append("<img src='product_images/" + data.savefilename + "' height='150'/>");
											$('#image').val( data.image );
											$('#savefilename').val( data.savefilename );
										},
										error:function(){  alert("실패"); },
								}
						);
				});
		});
</script>

</head>
<body>

<div id="wrap">
	<header>
		<div id="logo">
			<img style="width:800px" src="admin/images/bar_01.gif">
			<img src="admin/images/text.gif">
			<input class="btn" type="button" value="logout"	onClick="location.href='adminLogout'">
		</div>
	</header>
