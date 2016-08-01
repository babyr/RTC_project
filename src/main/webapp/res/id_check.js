$(document).ready(function(){ 
		$('#id').keyup(function(){
				var id = $(this).val();
				$.ajax({
					   type : "GET",
					   url : "id_check.do?id="+id,
					   dataType: "text",
					   comtentType:"application/x-www-form-urlencoded;charset=UTF-8",
					   success : function(data){   
					      var check=data;
					      if(check=='success')
					    	  $("#idChk").html("사용가능합니다.");
					      else if(check=='fail')
					    	  $("#idChk").html("사용불가능합니다.");
					   }
					});
		});
	});