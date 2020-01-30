// JavaScript Document

$(document).ready(function(e) {
    $("#cup_perf").click(
		function(){
			$('#center').tabs('add',{    
				title:'性能检测',    
				content:'<iframe src="../pages/cpuPerf.html"></iframe>',    
				closable:true,    
			  
			});
		});
    $("#disk_perf").click(
		function(){
			$('#center').tabs('add',{    
				title:'硬盘检测',    
				content:'<iframe src="../pages/diskContent.html"></iframe>',    
				closable:true,    
			  
			});
		});
    $("#re_desktop").click(
		function(){
			$('#center').tabs('add',{    
				title:'远程桌面监控',    
				content:'<iframe src="../pages/desktop.html"></iframe>',    
				closable:true,    
			  
			});
		});
    //加载选项卡展示文件目录
    $('#tt').tree({
    	onClick: function(node){
    		//console.log(node.id);
    		//下拉时从showFiles获得子集
    		var filepath=node.id;
    		showFiles(filepath);
    	}
    });
    //展示用户栏
    $("#user").click(function(){
    	var div=$("#east");
    	var state=div.css("display");
    	if(state=="none"){
    		//div.css({'display':'block'});
    		div.slideDown(500);
    	}else{
    		//div.css({'display':'none'});
    		div.slideUp(500);
    	}
    	
    });
    //修改密码对话框
    $("#updatePassword").click(function(){
    	$("#upWin").removeClass("hidden");
    	$('#upWin').dialog({   
		    title:"update password",
    		iconCls:'icon-edit',
		    width: 300,    
		    height: 400,    
		    closed: false,    
		    cache: false,
		    buttons:[{
				text:'reset',
				iconCls:'icon-reload',
				handler:function(){
					$("#upForm").form('reset');//重置表单
				}
			},{
				text:'submit',
				iconCls:'icon-ok',
				handler:function(){
					var username=$("#nameSpan").text();//获取用户名
					submitForm(username);//验证密码，提交表单	
				}
			},{
				text:'cancel',
				iconCls:'icon-cancel',
				handler:function(){
					$('#upWin').dialog('close');//关闭对话框
				}
			}],
		    modal: true  
		});
    	
    	
    });
    //输入框失焦事件，密码验证
    $("input").blur(function(){
    	checkInput();
    });
    //注销
    $("#logout").click(function(){
    	window.location.href="/myMonitor/servlet/logout";	
    });

    updateIcon();//随鼠标改变图标

});
//打开文件目录选项卡
function showFiles(filepath){
	$.ajax({
		 type:'GET',
      	 url: "/myMonitor/servlet/showFiles",
      	 //processData:false,
	         data:{"path":filepath}, //参数
	         contentType:"application/json",    
	         success: function() {
	        	 console.log("fileTree ok");
       }
		
	});
	$('#center').tabs('add',{    
		title:filepath,    
		content:'<iframe src="../pages/showFiles.jsp"></iframe>',    
		closable:true,    
	  
	});
}
//更新文件目录选项卡
function updateFiles(){
	var tab = $('#center').tabs('getSelected');//获取当前选项卡
	var title = tab.panel("options").title; //获取title
	$('#center').tabs('close',title);//关闭选项卡
	showFiles(title);
}
//验证前后密码
function checkInput(){
	var op=$("#op").val();
	var np=$("#np").val();
	var rnp=$("#rnp").val();
	if((np!="")&&(rnp!="")){
		if(np!=rnp){
			$("#tipRnp").removeClass("hidden");
		}else{
			$("#tipRnp").addClass("hidden");
		}
	}
	if(np==""||np.length>10||np.length<3){
		$("#tipNp").removeClass("hidden");
	}else{
		$("#tipNp").addClass("hidden");
	}
	if(op==""){
		$("#tipOp").removeClass("hidden");
	}else{
		$("#tipOp").addClass("hidden");
	}
}
//提交修改密码表单
function submitForm(username){
	$('#upForm').form({    
	    url:'/myMonitor/servlet/updatePassword?username='+encodeURIComponent(username),    
	    onSubmit: function(){    
	        // do some check    
	        // return false to prevent submit;
	    	var op=$("#op").val();
	    	var np=$("#np").val();
	    	var rnp=$("#rnp").val();
	    	if(op!="" && np.length>2 && np.length<11 && np==rnp)
	    		return true;
	    	else{
	    		alert("please check form!");
	    		return false;
	    	}
	    },    
	    success:data=>{    
	    	if(data==1){
	    		alert("update success");
	    		$('#upWin').dialog('close');
	    	}else 
	    		alert("old password is error");
	    },
	    error:data=>{
	    	console.log("update error");
	    }
	});    
	// submit the form    
	$('#upForm').submit();  

}
//鼠标移入移出改变图标和字颜色
function updateIcon(){
	$("#cup_perf").mouseover(function(){
		  $('#cup_perf img').attr("src","../images/icons/cpu2.png");
		  $(this).css('color','blue');
	});
	$("#cup_perf").mouseleave(function(){
		  $('#cup_perf img').attr("src","../images/icons/cpu1.png");
		  $(this).css('color','purple');  
	});
	
	$("#disk_perf").mouseover(function(){
		  $('#disk_perf img').attr("src","../images/icons/磁盘.png");
		  $(this).css('color','blue');
	});
	$("#disk_perf").mouseleave(function(){
		  $('#disk_perf img').attr("src","../images/icons/disk.png");
		  $(this).css('color','purple');
	});
	
	$("#re_desktop").mouseover(function(){
		  $('#re_desktop img').attr("src","../images/icons/远程桌面.png");
		  $(this).css('color','blue');
	});
	$("#re_desktop").mouseleave(function(){
		  $('#re_desktop img').attr("src","../images/icons/desktop.png");
		  $(this).css('color','purple');
	});
}