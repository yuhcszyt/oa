<%@page import="util.PublicinformationUtil"%>
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
	href="${pageContext.request.contextPath }/css/member.css">
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/managejs/common.js"></script> 
</head>

<%--导入这句css就报错,页面看不了  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/main.css">   --%>
	
<style type="text/css"> 
.toptitle{
	position:absolute;
	left:20px;
	color:red;
	font-size:16px;
	font-weight:bold;
}

.maintitle{
	position:absolute;
	left:15px;
	color:#fff;
	font-size:16px;
	font-weight:bold;
	padding:5px;
}
.leimu{
    background-image: url('images/744632675023512131.jpg');
   background: #ff0000 url(../images/744632675023512131.jpg) no-repeat fixed center; 
}
</style> 


<body>
	<%-- <div class="login-top"></div>
	<div class="login-area">

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
	</div>
	<div class="login-copyright"></div> --%>


	<div id="mainwindow" class="easyui-window leimu"
		style="width: 600px; height: 300px; background:#fafafa; overflow: hidden"
		title="登录" border="false" resizable="false" draggable="false"
		minimizable="false" maximizable="false">
		<div class="header" style="height: 35px;">
			<div class="toptitle"
				style="margin-top: 25px; font-size: 20px; margin-left: 60px;">
				<%=PublicinformationUtil.GetProperties("projectname")%></div>
		</div>
		<div style="padding: 60px 0;">
			<div id="loginForm">
				<div style="padding-left: 150px">
					<table cellpadding="0" cellspacing="3">
						<tr>
							<td>登录帐号</td>
							<td><input id="LOGINNAME" style="width:114px;" value=""></input></td>
						</tr>
						<tr>
							<td>登录密码</td>
							<td><input id="PASSWORD" type="password"
								style="width: 114px;"></input></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td></td>
							<td><a id="btnLogin" class="easyui-linkbutton"
								>登 录</a> <a
								class="easyui-linkbutton" onclick="clearAll()">重 置</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(function(){
	$("#mainwindow").css("background-image","url(${pageContext.request.contextPath}/images/744632675023512131.jpg)");
})

function clearAll(){
	document.getElementById('LOGINNAME').value="";
	document.getElementById('PASSWORD').value="";
}
$("#PASSWORD").keydown(function(event){
	if(event.keyCode==13)
		$("#btnLogin").click();
});

$("#btnLogin").click(function(){
	var LOGINNAME = $("#LOGINNAME").val();
	var PASSWORD = $("#PASSWORD").val();
	if(JUDGE.isNull(LOGINNAME) || JUDGE.isNull(PASSWORD)){
		$.messager.alert("提示消息", "用户名、密码都不能为空!", "info");
		return;
	}

	var condition = {"username":LOGINNAME,"password":PASSWORD};		
/* 	condition = JSON.stringify(condition); 
    condition = escape(encodeURIComponent(condition));			 */
	var url='${pageContext.request.contextPath}/userAction_login.action';
	
    	$.ajax({
    	type : "post",
		url : url,
		data: condition,
		dataType:'json',
		error : function(event,request, settings) {
			$.messager.alert("提示消息", "请求失败!", "info");
		},
		success : function(data) { 
			if(!JUDGE.isNull(data)){
				if(data.msg=='OK'){
					window.location.href="${pageContext.request.contextPath}/userAction_home.action";   
				}
			}
			else{
				$.messager.alert("提示消息", "用户名或密码错误!", "info");
			}	
		}
	});	
});

</script>

</html>