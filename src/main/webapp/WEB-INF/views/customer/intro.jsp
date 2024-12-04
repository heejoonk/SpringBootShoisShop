<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<%@ include file="sub_image_menu.jsp" %>
	<article>
		<form>
			<h2> 회사 소개 </h2>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>회사소개</label><div>&nbsp;</div>
				</div>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>회사연혁</label><div>&nbsp;</div>
				</div>
				<div class="field" style="border-top:1px dotted blueviolet;">
					<label>교통편</label><div>&nbsp;</div>
				</div>
				<div class="field" style="flex-direction: column; border-top:1px dotted blueviolet;">
					<label>지도</label>
					<div>&nbsp;
						<!-- * 카카오맵 - 지도퍼가기 -->
						<!-- 1. 지도 노드 -->
						<div id="daumRoughmapContainer1732520639097" class="root_daum_roughmap root_daum_roughmap_landing"></div>

						<!--
                            2. 설치 스크립트
                            * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                        -->
						<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

						<!-- 3. 실행 스크립트 -->
						<script charset="UTF-8">
							new daum.roughmap.Lander({
								"timestamp" : "1732520639097",
								"key" : "2mbuj",
								"mapWidth" : "640",
								"mapHeight" : "360"
							}).render();
						</script>
					</div>
				</div>
				
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>
		