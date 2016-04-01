$(function(){
	
	
	
	
});



$(document).ready(function() {

    /*发布*/
	$('#regsubmit').click(function() {
		
		$('#bolgForm').submit();
	});
	
    /*保存草稿*/
	$('#savedraft').click(function() {
		



		$('#bolgForm').submit();
	});
	
	   /*清空*/
	$('#bolgForm').find("input[name=resertbutton]").click(function() {
			document.getElementById("bolgForm").reset(); 
			var s = new CKEDITOR.instances.content("TextArea1")
			s.clearCustomData();
	
	});
	
	   /*关闭*/
	$('#bolgForm').find("input[name=clossbutton]").click(function() {
		if (confirm("您确定要关闭本页吗？")) {
				window.opener = null;
				window.open('', '_self');
				window.close();
			}
	
	});
	
	
});