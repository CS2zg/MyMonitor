<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="myMonitor.Bean.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--引入主题样式-->
<link rel="stylesheet" type="text/css" href="../jQuery/easyui/themes/default/easyui.css">
<!--引入图标样式-->
<link rel="stylesheet" type="text/css" href="../jQuery/easyui/themes/icon.css">
<!--引入jquery-->
<script type="text/javascript" src="../jQuery/jquery-1.11.0.js"></script>
<!--引入jQuery easyui-->
<script type="text/javascript" src="../jQuery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js_css/homepageJs.js"></script>
<link rel="stylesheet" type="text/css" href="../js_css/myCSS.css">
<meta charset="UTF-8">
<title>远程监控系统</title>
</head>
<body>
	<div id="body" class="easyui-layout" style="width:100%;height:700px;">   
        <!--北-->
        <div data-options="region:'north'" style="height:15%;">
        	<h1 style="text-align:center">服务器远程监控系统</h1>
        	<h2 style="text-align:center">Server remote monitoring system</h2>
            <%User user=(User)session.getAttribute("user"); %>
            <a id="user" href="#" class="user">你好，<%=user.getUserName()%></a>
        	<!---->
        </div>   
        <!--西-->
        <div data-options="region:'west',title:'远程监控'" style="width:17%;" class="easyui-accordion">
        	<div id="b_perf" title="基本性能监控" data-options="iconCls:'icon-large-chart',selected:false" style="height: 45px;">
    			<a id="cup_perf" href="#" class="perf"><img src="../images/icons/cpu1.png">CPU性能监控</a><hr>
    			<a id="disk_perf" href="#" class="perf"><img src="../images/icons/disk.png">磁盘存储监控</a><hr><!-- <span class="icon-span"></span> -->
            </div>   
    		<div id="b_info" title="文件信息监控" data-options="iconCls:'icon-large-shapes'" style="padding:10px;">   
                <ul id="tt"class="easyui-tree" data-options="url:'/myMonitor/servlet/FilesSys'"></ul>    
            </div>   
            <div id="y_cont" title="远程操作监控" data-options="iconCls:'icon-large-smartart'">   
                <a id="re_desktop" href="#" class="perf"><img src="../images/icons/desktop.png">远程桌面监控</a><hr>  
            </div>  
        </div>  
        <!--中-->
        <div id="center" data-options="region:'center'" style="background:#eee;" class="easyui-tabs"></div>
        <!--东 -->
        <div id="east" class="user-panel" >
        	<div id="userInfo" class="user-info">
        	<img src="/myMonitor/images/boy.png" style="width: 70px;height: 70px;">
        	<span><%=user.getUserName()%></span>
        	</div><br>
        	<div id="userControl" class="user-control">
        	<a id="updatePassword" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit',size:'large',iconAlign:'top'">修改密码</a>
        	<a  id="logout" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo',size:'large',iconAlign:'top'">注销退出</a>
        	</div>
        </div>
        <!--南-->
        <div data-options="region:'south'" class="banner-bottom">
        	<br>
        	东莞理工学院<br><!---->
            <a href="http://www.dgut.edu.cn" style="text-decoration: none;color: black;">http://www.dgut.edu.cn</a><br><!---->
            &copy;2016计算机科学与技术
        </div>
        <!--修改密码窗口  -->   
        <div id="upWin" class="hidden">
       		<form id="upForm" method="post">
       		<div style="margin-bottom:20px;margin-top:50px">
				<label>User Name:</label>
				<span id="nameSpan" style="color: blue"><%=user.getUserName()%></span>
			</div>
       		<div style="margin-bottom:20px">
				<label>Old Password:</label><br>
				<input id="op" class="easyui-textbox" type="password" style="width:200px;height:32px" name="oldPassword" value="">
				<label id="tipOp"class="hidden"><span style="color: red">Password cannot be empty!</span></label>
			</div>
			<div style="margin-bottom:20px">
				<label>New Password:</label><br>
				<input id="np" class="easyui-textbox" type="password" style="width:200px;height:32px">
				<label id="tipNp"class="hidden"><span style="color: red">Password needs 3~10 digits!</span></label>
			</div>
			<div style="margin-bottom:20px">
				<label>Repeat New Password:</label><br>
				<input id="rnp" class="easyui-textbox" type="password" style="width:200px;height:32px" name="newPassword">
				<label id="tipRnp"class="hidden"><span style="color: red">Inconsistent password!</span></label>
			</div>
			</form>
        </div>
	</div>  
</body>
</html>