/*mypage.js */

function go_cart(){
	if( document.formm.quantity.value==""){
		alert("수량을 입력하세요");
		 document.formm.quantity.focus();
	}else{
		document.formm.action = "cartInsert";
		document.formm.submit();
	}
}


function go_orderOne(){
	if( document.formm.quantity.value==""){
		alert("수량을 입력하세요");
		document.formm.quantity.focus();
	}else{
		if( confirm("현재 상품을 구매하시겠습니까?")) {
			document.formm.action = "orderFormOne";
			document.formm.submit();
		}
	}
}


function go_cart_delete(){
	// 자바스크립트에서 바라보는 폼내의 입력란들은 같은 이름일때 모두 배열로 인식됩니다.
	// 	갯수가 한개라면 배열이 아니라 단순변수처럼 사용합니다
	// 배열로 인식되었을때 document.cartFrm.cseq[0]  document.cartFrm.cseq[1]
	// 변수로 인식되었을때 document.cartFrm.cseq
	
	// 체크박스가 한개라면  document.cartFrm.cseq
	// 체크박스가 두개이상라면  document.cartFrm.cseq[0]  document.cartFrm.cseq[1] ....
	
	 // 폼안에 체크박스가 두개또는 한개인것을 구분하기위해  length 라는 상태를 사용합니다 
	 // 체크박스가 두개이상이라면  length 가 그갯수만큼의 값을 갖을것이고
	 // 체크박스가 한개라면   length 는  undefined  가 됩니다
	 
	 var count = 0;
	 // 체크된 체크박스의 갯수를 카운트합니다
	 if( document.cartFrm.cseq.length == undefined ){
		// 한개의 체크박스가 체크되었는지만 검사
		if( document.cartFrm.cseq.checked == true){
			count++;
		}
	 }else{
		// 반복실행문을 이용해서 모든 체크박스를 체크되었는지 검사
		for( var i=0; i<document.cartFrm.cseq.length; i++){
			if( document.cartFrm.cseq[i].checked == true){
				count++;
			}	
		} 
	 }
	 // 위 if문이 실행되면 체크박스가 한개이든 두개이든 체크된 체크박스의 갯수가  count 변수에 저장됩니다
	 if( count == 0){
		alert("삭제할 항복을 선택하세요");
	 }else{
		var ans = confirm("선택한 항목을 삭제할까요?");
		if( ans ){
			document.cartFrm.action = "cartDelete";
			document.cartFrm.submit();
		}
	 }
}





function go_order_insert(){
	var count = 0;
	 if( document.cartFrm.cseq.length == undefined ){
			if( document.cartFrm.cseq.checked == true){
				count++;
			}
	}else{
		for( var i=0; i<document.cartFrm.cseq.length; i++){
			if( document.cartFrm.cseq[i].checked == true){
				count++;
			}	
		} 
	}
	if( count == 0){
		alert("주문할 항목을 선택하세요");
	}else{
		var ans = confirm("선택한 항목을 주문할까요?");
		if( ans ){
			document.cartFrm.action = "orderForm";
			document.cartFrm.submit();
		}
	}
}



function loadAddress(zip_num, address1, address2, address3){
	if( document.cartFrm.address.checked==true){
		document.cartFrm.zip_num.value = zip_num;
		document.cartFrm.address1.value = address1;
		document.cartFrm.address2.value = address2;
		document.cartFrm.address3.value = address3;
		
	}else{
		document.cartFrm.zip_num.value = "";
		document.cartFrm.address1.value = "";
		document.cartFrm.address2.value = "";
		document.cartFrm.address3.value = "";
	}
}



function go_order(){
	if( document.cartFrm.zip_num.value=="" || document.cartFrm.address1.value=="" ||  document.cartFrm.address2.value==""){
		alert("우편번호와 주소를 확인하세요");
		document.cartFrm.address2.focus();
	}else{
		document.cartFrm.action="orderInsert";
		document.cartFrm.submit();
	}
}



function go_orderInsertOne(){
	if( document.cartFrm.zip_num.value=="" || document.cartFrm.address1.value=="" ||  document.cartFrm.address2.value==""){
		alert("우편번호와 주소를 확인하세요");
		document.cartFrm.address2.focus();
	}else{
		document.cartFrm.action="orderInsertOne";
		document.cartFrm.submit();
	}
}


function purchaseOk(odseq, oseq){
	location.href='updateResult?odseq=' + odseq + '&oseq=' + oseq;
}




function qnaViewWithPass(pass, qseq){
	var inputPass = prompt("비밀글입니다. 암호를 입력하세요");
	if(pass == inputPass){
		location.href="qnaView?qseq="+ qseq;
	}else{
		alert("암호가 일치하지 않습니다");
	}

}


function qnaView( qseq ){
	location.href="qnaView?qseq="+ qseq ;
}



function enable(){
	if(document.formm.secret.checked==true) {
		document.formm.pass.disabled = false;
	}else {
		document.formm.pass.disabled = true;
		document.formm.pass.value="";
	}
}






