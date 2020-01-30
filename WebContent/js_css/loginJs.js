/*
 * 
 */
$(function(){
	//隐藏注册面板
	$("#right-signup").hide();
	//提交登录表单
	$("#sign-in").click(function(){
		$("#login").form({    
		    url:"/myMonitor/servlet/SignIn",    
		    onSubmit: function(){    
		        // do some check    
		        // return false to prevent submit;
		    	var name=$("#username").val();
		    	var pw=$("#password").val();
		    	
		    	if(name!="" && pw.length>2 && pw.length<11 )
		    		return true;
		    	else{
		    		alert("please check form!");
		    		return false;
		    	}
		    },    
		    success:data=>{ 
		    	if(data==1){
		    		//使用ajax提交表单，后端定向失效，由前端定向
		    		window.location='/myMonitor/pages/homepage.jsp';
		    	}else{
		    		$("#login-tip span").text('*username or password is error');
		    	}
		    	
		    }
		});
		$("#login").submit();
	});
	
	//展示注册表单
	$("#sign-up").click(function(){
		$("#right-signin").hide();
		$("#right-signup").fadeToggle(1000);
	});
	//回到登录面板
	$("#back").click(function(){
		$("#right-signup").hide();
		$("#right-signin").fadeToggle(1000);
		
	});
	//登录表单失焦校验
	$("#right-signin input").blur(function(){
    	checkSignInForm();
    });
	//注册表单失焦校验
	$("#right-signup input").blur(function(){
    	checkSignUpForm();
    });
	//提交注册表单
	$("#signUp").click(function(){
		$("#signup").form({    
		    url:'/myMonitor/servlet/SignUp',    
		    onSubmit: function(){    
		        // do some check    
		        // return false to prevent submit;
		    	var name=$("#name").val();
		    	var pw=$("#pw").val();
		    	var rpw=$("#rpw").val();
		    	if(name!="" && pw.length>2 && pw.length<11 && pw==rpw)
		    		return true;
		    	else{
		    		alert("please check form!");
		    		return false;
		    	}
		    },    
		    success:data=>{    
		    	if(data==1){
		    		alert("sign up ok");
		    	}else if(data==0){
		    		alert("User already exists");
		    	}else{
		    		alert("sign up fail");
		    	}
		    }
		});    
		// submit the form    
		$('#signup').submit();
	});
})

//验证登录表单
function checkSignInForm(){
	var name=$("#username").val();
	var pw=$("#password").val();
	if(name==""){
		$("#username-tip").removeClass('hidden');
	}else{
		$("#username-tip").addClass('hidden');
	}
	if(pw==""||pw.length<3||pw.length>11){
		$("#password-tip").removeClass('hidden');
	}else{
		$("#password-tip").addClass('hidden');
	}
}
//验证注册表单
function checkSignUpForm(){
	var name=$("#name").val();
	var pw=$("#pw").val();
	var rpw=$("#rpw").val();
	//console.log(name);
	if(name==""){
		$("#tipUn").removeClass('hidden');
	}else{
		$("#tipUn").addClass('hidden');
	}
	if(pw==""||pw.length<3||pw.length>11){
		$("#tipPw").removeClass('hidden');
	}else{
		$("#tipPw").addClass('hidden');
	}
	if(pw!=rpw){
		$("#tipRpw").removeClass('hidden');
	}else{
		$("#tipRpw").addClass('hidden');
	}
}