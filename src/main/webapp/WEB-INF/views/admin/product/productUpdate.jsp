<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article style="flex-direction: column">
	<form name="productWriteFrm" method="post"   action="adminProductUpdate">
			<input type="hidden" name="pseq" value="${dto.pseq}">
			<h2> Product Update Form </h2>
			<div class="field" >
					<label>상품분류</label>
					<div>
						<select name="category" style="width:200px;height:25px;font-size:105%;">
								<option value="">선택하세요</option>
								<c:forEach items="${categoryList}" var="category" varStatus="status">
										<c:choose>
											<c:when test="${status.count==dto.category}">
												<option value="${status.count}" selected>${category}</option>
											</c:when>
											<c:otherwise>
												<option value="${status.count}">${category}</option>
											</c:otherwise>
										</c:choose>
						   		</c:forEach>
						   		
						</select>
					</div>
			</div>
			<div class="field" >
					<label>상품명</label>	<input type="text" name="name"  value="${dto.name}" />
			</div>
			<div class="field" >
					<label>원가</label>
					<input type="text" name="price1"  style="margin-right:20px;" value="${dto.price1}"  onKeyup="cals();" />
					<label>판매가</label>
					<input type="text" name="price2"  style="margin-right:20px;" value="${dto.price2}" onKeyup="cals();"  />
					<label>마진</label><input type="text" name="price3" value="${dto.price3}" readonly/>
			</div>
			<div class="field"  style="display:block">
					<label >베스트 상품</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${dto.bestyn=="Y"}' >
									<input type="radio" name="bestyn" value="Y" checked="checked">사용
							  		<input type="radio" name="bestyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="bestyn" value="Y" >사용
							  		<input type="radio" name="bestyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>
							
					<label style="margin-left:100px;">사용유무</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test='${dto.useyn=="Y"}' >
									<input type="radio" name="useyn" value="Y" checked="checked">사용
								 	<input type="radio" name="useyn" value="N">미사용
								</c:when>
								<c:otherwise>
									<input type="radio" name="useyn" value="Y" >사용
							  		<input type="radio" name="useyn" value="N" checked="checked">미사용
								</c:otherwise>
							</c:choose>
			</div>
			<div class="field" >
					<label>상세설명</label>
					<textarea name="content" rows="8" style="flex:4;">${dto.content}</textarea>
			</div>
			<div class="field" >
					<label>상품이미지</label>
					<div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start">
						<input type="hidden" name="image" id="image" value="${dto.image}"  >
						<input type="hidden" name="savefilename" id="savefilename" value="${dto.savefilename}" >
						<div id="filename">
							${dto.image}
							<img src="/product_images/${dto.savefilename}" width="150" />
						</div>

					</div>
			</div>
			<div class="btn" >
					<input type="submit" value="상품수정" >
					<input type="button" value="목록으로" onClick="location.href='adminProductList'">
			</div>
	</form>


	<div  style="position:relative;  border:1px solid black; width:500px; margin:0 auto; ">
		<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
			<input type="file" name="fileimage">
			<input type="button" id="imageAddBtn" value="추가">
		</form>
	</div>

</article>

<%@ include file="../footer.jsp"%>