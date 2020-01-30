/**
 * 这是控制showFiles.jsp页面的JavaScript
 */
 $(function() { 
	 var fileName;//全局变量，用来获取右击时的文件/文件夹的路径
     var tab = window.parent.$("#center").tabs("getSelected"); //获取当前选中的tab对象
	 var currentPath=tab.panel("options").title; //获取title,即当前路径
	 $("#uploadImg").attr('alt',currentPath);//为上传图标添加alt属性
	 //阻止浏览器默认右键点击事件
	 //某元素组织右键点击事件 
    $("div").bind("contextmenu", function(){ 
    	return false; 
    	})
    	
	$("img").mousedown(function(e) { 
		//console.log(e.which); 
		//右键为3    左键为1
		if (3 == e.which) { 
			$("#menu").css({"visibility":"visible","left":(e.clientX-5) +'px',"top":(e.clientY-5) + 'px'}); 
			fileName=$(this).attr("alt");
			
		}else if(1 == e.which){
			$("#menu").css({"visibility":"hidden"});
			
		}
	});
	$(document).click(function(e){
		$("#menu").css({"visibility":"hidden"});
	});
	
	//双击文件图标进入下一层目录
	$('.div-img').dblclick(function(){
		var name=$(this).attr('src');
		
		if(name=='../images/FileTypeIcons/FolderType.png'){
			fileName=$(this).attr("alt");
			window.parent.showFiles(fileName);
		}
		  
	});
	
	
	//下载文件
	$("#download").click(function(){
		//下载文件不能用Ajax，用request
		//参数要编码
		window.location.href="/myMonitor/servlet/downloadFile?downloadPath="+encodeURIComponent(fileName);
	});
	
	//删除文件
	$("#delete").click(function(){
		$.ajax({
			 type:'GET',
	       	 url: "/myMonitor/servlet/deleteFile",
	         data:{"deletePath":fileName}, //参数，文件的路径
	         contentType:"application/json",    
	         success: res=>{
	        	 console.log("delete ok");
	        	 alert("delete ok");
	        	 window.parent.updateFiles();//更新选项卡
	         }
		});
	});
	
	
	//上传文件
	//移除upload的所有绑定事件
	$("#upload").unbind();
    $("#uploadImg").unbind();
    $("#upload").click(function(e){
    	$("#form1").removeClass("hidden");
    	$('#upload_dialog').dialog({
			title: '上传文件',    
		    width: 350,    
		    height: 200,    
		    closed: false,    
		    cache: false,
		    buttons:[{
				text:'上传',
				iconCls:'icon-ok',
				handler:function(){
					var path = $('#uploadImg').attr('alt');
					submitForm(path);
				}
			},{
				text:'关闭',
				iconCls:'icon-cancel',
				handler:function(){
					$('#upload_dialog').dialog('close');
				}
			}],
		    modal: true  
		});
	})
	updateCSS();
});

//鼠标移入移出右键菜单
function updateCSS(){
	$("#tr-download").mouseover(function(){
	  $('#tr-download img').attr("src","../images/icons/download.png");
	  $(this).css('background-color','#00ffff');
	});
	$("#tr-download").mouseleave(function(){
		  $('#tr-download img').attr("src","../images/icons/download2.png");
		  $(this).css('background-color','white');  
	});
	$("#tr-delete").mouseover(function(){
		  $('#tr-delete img').attr("src","../images/icons/delete.png");
		  $(this).css('background-color','#00ffff');
	});
	$("#tr-delete").mouseleave(function(){
		  $('#tr-delete img').attr("src","../images/icons/delete2.png");
		  $(this).css('background-color','white');  
	});
}

 
//提交上传文件表单方法
function submitForm(path){
	 
	 $('#form1').form({    
		    url:"/myMonitor/servlet/uploadFile?path="+encodeURIComponent(path),    
		    onSubmit: function(){    
		        // do some check    
		        // return false to prevent submit;
		    	return true;
		    },    
		    success:data=>{    
		    	alert("upload ok");
		    	$('#upload_dialog').dialog('close');
		    	window.parent.updateFiles();//更新选项卡
		    },
		    error:data=>{
		    	console.log("upload error");
		    }
		});    
		// submit the form    
	 $("#form1").submit();
 }         		
