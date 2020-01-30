<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>showFiles</title>
<!--引入easyui主题样式-->
<link rel="stylesheet" type="text/css" href="../jQuery/easyui/themes/default/easyui.css">
<!--引入easyui图标样式-->
<link rel="stylesheet" type="text/css" href="../jQuery/easyui/themes/icon.css">
<script type="text/javascript" src="../jQuery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="../jQuery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js_css/showFilesJs.js"></script>
<link rel="stylesheet" type="text/css" href="../js_css/showFilesCss.css">
</head>
<body>
<%
	JSONArray flist=(JSONArray)session.getAttribute("childrenNode");
	String imgPath;
	for(int i=0;i<flist.size();i++){
		//遍历JSONArray
		JSONObject fobj=flist.getJSONObject(i);
		//如果是文件，则根据拓展名选择图标
		if(fobj.getBoolean("is_file")){
			String type=fobj.getString("type");
			if(type.equals("doc") || type.equals("docx")){//word文档
				imgPath="../images/FileTypeIcons/DocType.png";
			}else if(type.equals("png")||type.equals("jpg")||type.equals("gif")){//图片
				imgPath="../images/FileTypeIcons/ImgType.png";
			}else if(type.equals("mp3")){//音乐
				imgPath="../images/FileTypeIcons/MusicType.png";
			}else if(type.equals("ppt")||type.equals("pptm")||type.equals("pptx")){//ppt
				imgPath="../images/FileTypeIcons/PptType.png";
			}else if(type.equals("txt")){//文本
				imgPath="../images/FileTypeIcons/TxtType.png";
			}else if(type.equals("pdf")){//pdf
				imgPath="../images/FileTypeIcons/PdfType.png";
			}else if(type.equals("rar")||type.equals("zip")){//压缩包
				imgPath="../images/FileTypeIcons/RarType.png";
			}else if(type.equals("exe")){//可执行文件
				imgPath="../images/FileTypeIcons/ExeType.png";
			}else{//其他文件
				imgPath="../images/FileTypeIcons/OtherType.png";
			}	
		}else{
			imgPath="../images/FileTypeIcons/FolderType.png";
		}
%>
	<div class="div-file">
		<img src=<%=imgPath %> alt=<%=fobj.get("absolute_path") %> class="div-img"><br>
		<font><%=fobj.get("text") %></font>
	</div>
<%  }%>
<!-- 
	<img id="error" src="../images/FileTypeIcons/image_default.png">
	<font style="font-size:16px;color:'red';">error.get("text")</font>
 -->
<!-- 上传文件div -->
<div id="upload" class="div-file">
	<img id="uploadImg" class="div-img" src="../images/FileTypeIcons/upload.png"><br>
	<font>上传文件</font>
</div>
<!-- 右键菜单 -->
<div id="menu">
	<table>
		<tr id="tr-download">
			<td><img src="../images/icons/download.png"></td>
			<td><a id="download" href="#">打包下载</a></td>
		</tr>
		<tr id="tr-delete">
			<td><img src="../images/icons/delete.png"></td>
			<td><a id="delete" href="#">删除</a></td>
		</tr>
	</table>
</div>
<!-- 选择文件对话框  -->
<div id="upload_dialog">
	<form id="form1" class="hidden" enctype="multipart/form-data" method="post">
		选择文件<input type="file" name="upload_file">
	</form>
</div>
</body>
</html>