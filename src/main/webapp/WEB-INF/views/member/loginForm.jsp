<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
	<%@ include file="sub_image_menu.jsp" %>
	<article>
			<form method="post" action="login" name="loginForm">
				<h2>LogIn</h2>
					<div class="field">
						<label>User ID</label><input name="userid" type="text" value="${dto.userid}" />
					</div>
					<div class="field">
						<label>Password</label><input name="pwd" type="password" >
					</div>
					<div class="btn">
	  				   	<input type="submit" value="LOGIN">
					   	<input type="button" value="JOIN"  onclick="" >
						<input type="button" value="FIND ID"  onclick="" >
					</div>
					<div class="btn">
						<input type="button" value="KaKao" style="background: yellow; color:black"
							   onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
						<input type="button" value="Naver" style="background: green" onclick="" >
						<input type="button" value="Google" style="background: red" onclick="" >
					</div>
					<div style="font-size:80%; font-weight:bold">${message} </div>

			</form>
	</article>

</section>

<%@ include file="../footer.jsp" %>