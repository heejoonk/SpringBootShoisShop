function go_search( url ){
	document.frm.action = url;
	document.frm.submit();
}


function go_detail( pseq ){
		location.href="adminProductDetail?pseq=" + pseq;
}


function go_write(){
	location.href="adminProductWriteForm";
}


function cals(){
	var value1 = document.productWriteFrm.price1.value;
	var value2 = document.productWriteFrm.price2.value
	
	if( value1=="" || value2==""){
		return;
	}else{
		document.productWriteFrm.price3.value = value2 - value1;
	}
}



function go_save(){
	var theForm = document.productWriteFrm;
		if( theForm.category.value==""){   
			alert('상품분류를 선택하세요');
			theForm.kind.focus();
		}else if (theForm.name.value == "") {
			alert('상품명을 입력하세요.'); 				theForm.name.focus();	
		} else if (theForm.price1.value == "") {
			alert('원가를 입력하세요.'); 				theForm.price1.focus();
		} else if (theForm.price2.value == "") {
			alert('판매가를 입력하세요.'); 			theForm.price2.focus();
		} else if (theForm.content.value == "") {
			alert('상품상세를 입력하세요.'); 		theForm.content.focus();
		} else if (theForm.image.value == "") {
			alert('상품이미지들 입력하세요.');		theForm.image.focus();	
		} else{
			theForm.action = "adminProductWrite";
			theForm.submit();
		}
}



function go_mod(pseq){
	location.href="adminProductUpdateForm?pseq=" + pseq;
}



function go_update(){
	var theForm = document.productWriteFrm;
	if( theForm.category.value==""){   
		alert('상품분류를 선택하세요');
		theForm.category.focus();
	}else if (theForm.name.value == "") {
		alert('상품명을 입력하세요.'); 				theForm.name.focus();	
	} else if (theForm.price1.value == "") {
		alert('원가를 입력하세요.'); 				theForm.price1.focus();
	} else if (theForm.price2.value == "") {
		alert('판매가를 입력하세요.'); 			theForm.price2.focus();
	} else if (theForm.content.value == "") {
		alert('상품상세를 입력하세요.'); 		theForm.content.focus();
	} else{
		theForm.action = "adminProductUpdate";
		theForm.submit();
	}
		
}



function deleteProduct(pseq){
	var ans = confirm("정말로 삭제할까요?");
	if( ans ){
		location.href="deleteProduct?pseq=" + pseq;
	}
}





function go_order_next(){
	var count=0;
	if( document.frm.result.length == undefined ){   
		if( document.frm.result.checked == true ) count++;
	}else{  
		for( var i=0; i<document.frm.result.length ; i++)
			if( document.frm.result[i].checked==true)
				count++;
	}
	if (count == 0) {
		   alert("주문처리할 항목을 선택해 주세요.");
	}else{
		document.frm.action = "adminOrderNext";
		document.frm.submit();
	}
		
}





function go_rep(){
	if( document.frm.reply.value==""){
		alert("답변내용을 입력하세요");
		document.frm.reply.focus();
	}else{
		document.frm.action = "adminQnaReplyUpdate";
		document.frm.submit();
	}
}
















