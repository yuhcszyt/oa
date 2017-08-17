<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/member.js"></script>
</head>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/yuhcszyt/oa
<body>
	<div class="login-top"></div>
	<div class="login-area">
<<<<<<< HEAD
	
	<s:form namespace="/" action="LoginAction_login" >
		
			<label>
				工&nbsp;&nbsp;号：
			</label>
			<s:textfield name="username"></s:textfield>
			
			<label>
				密&nbsp;&nbsp;码：
			</label>

			
			<s:password name="password"></s:password>
			<s:submit value="登录" cssClass="btn"></s:submit>
			
			<%-- <a onclick="document.getElementById('loginform').submit();" href="#" id="loginform:j_id19" name="loginform:j_id19">
						<span
							id="loginform:loginBtn" class="login-sub"
							style="margin-top:-36px;">登录</span>
						</a> --%>
			<br/>
				<b><font color="red"></font></b>
				<s:fielderror></s:fielderror>
		</s:form>
=======
		<form action="${pageContext.request.contextPath }/userAction_login.action" method="post" onsubmit="return checksubmit();">
			<label> 工&nbsp;&nbsp;号： </label> 
			<input type="text" name="username" value="" id="checkUserName"  class="easyui-numberbox" required="true"/>
			<span id="userName_text"></span>
			<br />
			<label> 密&nbsp;&nbsp;码： </label> 
			<input type="password" name="password" id="checkPassWord"  class="easyui-validatebox" required="true" /> 
			<span id="passWord_text"></span>
			<br />
			<input type="submit" name="submit" class="login-sub" value="" /> <br />
			<b><font color="red">${message}</font></b>
		</form>
>>>>>>> branch 'master' of https://github.com/yuhcszyt/oa
	</div>
	<div class="login-copyright"></div>
</body>
</html>