<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/member.css" />
</head>
<script type="text/javascript">

function login(){
	
	$.ajax({
		type:'post',
		data:$('input').serialize(),
		Datetype:'text',
		url:'${pageContext.request.contextPath}/LoginAction_login.action',
        success:function(data){
			if(data=='false'||data==false){
				$("#login_text").html('<font color="red">登录错误</font>');
			}else{
				document.location.href="${pageContext.request.contextPath}/LoginAction_home.action";
			}
		}
	});
}


</script>


<body>
	<div class="login-top"></div>
	<div class="login-area">
		<form  id="loginfrom" onsubmit="return checksubmit();">
			<label> 工&nbsp;&nbsp;号： </label> 
			<input type="text" name="username" value="" id="checkUserName"  class="easyui-numberbox" required="true"/>
			<span id="userName_text"></span>
			<br />
			<label> 密&nbsp;&nbsp;码： </label> 
			<input type="password" name="password" id="checkPassWord"  class="easyui-validatebox" required="true" /> 
			<span id="passWord_text"></span>
			<br />
			<input type="button" name="submit" class="login-sub" value="" onclick="login()"/><span id="login_text"></span><br/>
		<b><font color="red"></font></b>
		</form>
	</div>
	<div class="login-copyright"></div>
</body>
</html>