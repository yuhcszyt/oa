<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript">
	$(function() {
	
		$("input").attr("disabled", true);
		$("select").attr("disabled", true);

		//$("#submit").bind("click", function(){**************});
		$("#submit").click(function(){
			$("input").attr("disabled", false);
			$("select").attr("disabled", false);
			$("#pageTitle").html("编辑个人信息");
			var backPath = $("#backPath").val();
			var inserPath = $("#inserPath").val();
			$(".formSubBtn").html("<input id=\"fromSubmit\" type=\"button\" class=\"submit\" value=\"保存修改\" /> <input type=\"button\" class=\"back\" value=\"返回\" onclick=\"location.href='"+backPath+"';\" />");
		});
		
		$("#fromSubmit").click(function(){
			//进行表单校验
			var v = $("#editform").form("validate");
			if(v){
				//表单校验通过，手动校验两次输入是否一致
				var v1 = $("#password").val();
				var v2 = $("#password2").val();
				if(v1 == v2){
					//两次输入一致，发送ajax请求
					$.post("userAction_editPassword.action",{"password":v1},function(data){
						if(data == '1'){
							//修改成功，关闭修改密码窗口
							$("#editPwdWindow").window("close");
						}else{
							//修改密码失败，弹出提示
							$.messager.alert("提示信息","密码修改失败！","error");
						}
					});
					$.messager.alert("提示信息","修改成功！","warning");
				}else{
					//两次输入不一致，弹出错误提示
					$.messager.alert("提示信息","两次密码输入不一致！","warning");
				}
			}
		});

	});
</script>
</head>

<body>
	<input type="hidden" name="backPath" id="backPath" value="${pageContext.request.contextPath}/uiAction_frame_welcome.action" />
	<div class="action">
		<div class="t">
			<b id="pageTitle">个人信息</b>
		</div>
		<div class="pages">
		<form id="editform" action="${pageContext.request.contextPath }/LoginAction_updateUser.action" method="post" onsubmit="return checkUserUpdate(${loginUserrank}, ${loginUserrank}, 'update', ${loginUserpassword });">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="formTable">
				<tr>
					<td align="right" width="30%">原密码：</td>
					<td align="left" width="70%">
					<input type="text" name="opassword" id="opassword" class="input" value="${loginUser.password}" onblur="return check_opassword(${loginUserpassword });" />
					<span id="opassword_text">
					<font color=red>*</font> 为空时不修改密码</span></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td align="left"><input type="text" name="password" id="password" class="input" onblur="return check_password();" /> <span id="password_text"><font color=red>*</font> 为空时不修改密码</span></td>
				</tr>
				<tr>
					<td align="right">密码确认：</td>
					<td align="left"><input type="text" name="password2" id="password2" class="input" onblur="return check_password2();" /> <span id="password2_text"><font color=red>*</font>为空时不修改密码</span></td>
				</tr>
				<tr>
					<td align="right">昵称：</td>
					<td align="left"><input type="text" name="nickName"
						 id="nickName" class="input" value="${loginUser.nickname}" onblur="return check_nickName();" /> <span id="nickName_text"><font color=red>*</font></span></td>
				</tr>
				<tr>
					<td align="right">生日：</td>
					<td align="left"><input type="text" id="birthdayInput" name="birthdayInput" class="input dateTimeInput" readonly
						value="<fmt:formatDate value="${loginUser.birthday}" pattern="yyyy-MM-dd" />" onblur="return check_birthday();" /> <span id="birthday_text"><font color=red>*</font></span></td>
				</tr>
				<style>div.calendar{margin-top:266px}</style>
				<script type="text/javascript">
				date = new Date();
				Calendar.setup({
					inputField     :    "birthdayInput",
					ifFormat       :    "%Y-%m-%d",
					weekNumbers : false
				});
				</script>
				<tr>
					<td align="right">性别：</td>
					<td align="left"><label><input type="radio" name="sex"
							value="1" <c:if test="${loginUsersex==1}">checked</c:if> /> 男</label> <label><input
							type="radio" name="sex" value="2"
							<c:if test="${loginUsersex==2}">checked</c:if> /> 女</label> <span id="sex_text"></span></td>
				</tr>
				<tr>
					<td align="right">手机：</td>
					<td align="left"><input type="text" name="mobile"
						value="${loginUser.mobile }" id="mobile" class="input" onblur="return check_mobile();" /> <span id="mobile_text"></span>
					</td>
				</tr>
				<tr>
					<td align="right">地址：</td>
					<td align="left"><input type="text" name="address"
						value="${loginUser.address }" id="address" class="input" /> <span id="address_text"></span>
					</td>
				</tr>
				<tr>
					<td align="right">权限：</td>
					<td align="left">
					<label><input type="radio" name="rank" value="0" onblur="return check_rank(${loginUser.rank}, ${loginUser.rank}, 'update');" <c:if test="${loginUserrank==0}">checked</c:if> /> 系统管理员</label>
					<label><input type="radio" name="rank" value="1" onblur="return check_rank(${loginUser.rank}, ${loginUserrank}, 'update');" <c:if test="${loginUserrank==1}">checked</c:if> /> 经理</label>
					<label><input type="radio" name="rank" value="2" onblur="return check_rank(${loginUser.rank}, ${loginUserrank}, 'update');" <c:if test="${loginUserrank==2}">checked</c:if> /> 普通用户</label>
					 <span id="rank_text"></span></td>
				</tr>

			</table>
			<input type="hidden" id="userName" name="userName" value="${loginUser.username}" />
			<div class="formSubBtn">
				<span  class="submit" id="submit">编辑数据</span>
			</div>
		</form>

		</div>
	</div>
</body>
</html>
