<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>远程服务器监控系统.</title>
<link rel="stylesheet" type="text/css" href="/myMonitor/js_css/loginCSS.css">
<link rel="stylesheet" type="text/css" href="/myMonitor/jQuery/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/myMonitor/jQuery/easyui/themes/icon.css">
<script type="text/javascript" src="/myMonitor/jQuery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="/myMonitor/jQuery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/myMonitor/js_css/snow.js"></script>
<script type="text/javascript" src="/myMonitor/js_css/loginJs.js"></script>
</head>
<body>
	<!-- 雪花背景 -->
	<div class="snow-container"></div>
	<div id="left">
		<div class="banner"><img src="/myMonitor/images/banner1.png"/></div>
	</div>
	<!-- 登录 -->
	<div id="right-signin">
	<form id="login" method="post">
    <div class="easyui-panel" style="width:370px; padding:30px 70px 20px 70px">
		<div style="margin-bottom:5px;margin-top:30px;"><span>Username</span></div>
        <div style="margin-bottom:10px">
			<input id="username" class="easyui-textbox" name="username" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38">
            <label id="username-tip" class="hidden"><span style="color:red">*Username can not be empty</span></label>
		</div>
        <div style="margin-bottom:5px"><span>Password</span></div>
		<div style="margin-bottom:20px">
			<input id="password" class="easyui-textbox" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
			<label id="password-tip" class="hidden"><span style="color:red">*Password needs 3~10 digits!</span></label>
			<label id="login-tip"><span style="color:#F00;"></span></label>
		</div>
		
		<div style="margin-bottom:20px">
			<input type="checkbox" checked="checked">
			<span>Remember me</span>
		</div>
		<div style="margin-bottom:20px">
			<a id="sign-in" href="#" class="easyui-linkbutton" style="padding:5px 0px;width:100%;">
				<span style="font-size:14px;">Sign in</span>
			</a>
		</div>
        <div>
			<a id="sign-up" href="#" class="easyui-linkbutton" style="padding:5px 0px;width:100%;">
				<span style="font-size:14px;">Sign up</span>
			</a>
		</div>
        <div style="margin-top:70px;text-align:center"><span>&copy;2016计算机科学与技术</span></div>
	</div>
    </form>
	</div>
	<!-- 注册 -->
	<div id="right-signup">
		<form id="signup" method="post">
		<div class="easyui-panel" style="width:370px; padding:30px 70px 20px 70px">
			
			<div style="margin-bottom:5px;margin-top:30px;"><span>Username</span></div>
	        <div style="margin-bottom:10px">
				<input id="name" class="easyui-textbox" name="name" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38,required:true" value="">
	            <label id="tipUn" class="hidden"><span style="color:red;">*Username can not be empty</span></label>
			</div>
	        <div style="margin-bottom:5px"><span>Password</span></div>
			<div style="margin-bottom:20px">
				<input id="pw" class="easyui-textbox" name="pw" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38,required:true" value="">	
				<label id="tipPw"class="hidden"><span style="color: red">*Password needs 3~10 digits!</span></label>
			</div>
			<div style="margin-bottom:5px"><span>Repeat Password</span></div>
			<div style="margin-bottom:20px">
				<input id="rpw" class="easyui-textbox" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38,required:true" value="">	
				<label id="tipRpw"class="hidden"><span style="color: red">*Inconsistent password!</span></label>
			</div>
	        <div style="margin-bottom:20px">
				<a id="signUp" href="#" class="easyui-linkbutton" style="padding:5px 0px;width:100%;">
					<span style="font-size:14px;">Sign up</span>
				</a>
			</div>
			<a id="back" href="#" style="color:gray;">come back sign in</a>
			
		</div>
		</form>
	</div>
</body>
</html>