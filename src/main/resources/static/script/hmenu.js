// hmenu.js

$(function(){
	$('.hmenu').click(function(){
		$('.gnb').toggle(300, function(){});
		$('.hmenu div').toggleClass("active");
	});
});
