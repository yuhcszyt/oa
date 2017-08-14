<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>

<title>青鸟办公管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/frame.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>

	<div class="header">
		<div class="top">
			<div class="global-width">
				<img src="images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${u.rankStr} <font color="red">${u.userName }</font>
				你好！欢迎访问青鸟办公管理系统！ <a
					href="${pageContext.request.contextPath }/user/loginOut">注销</a>
			</div>
		</div>
	</div>

	<div class="left">
		<div class="menu">
			<iframe name="menu" id="menu" frameborder="0" src="${pageContext.request.contextPath}/uiAction_frame_leftmenu.action" "
				scrolling="auto"></iframe>
		</div>
	</div>

	<div class="right">
		<div class="main">
			<iframe name="main" id="main" frameborder="0" src="${pageContext.request.contextPath}/uiAction_frame_welcome.action" "
				scrolling="auto"></iframe>
		</div>
	</div>
</body>
</html>
