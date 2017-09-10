<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />


<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<%--  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css"> --%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script> 


<script type="text/javascript">
console.info("${loginUser.password}");
	  $(function() {
		$("table input").attr("disabled", true);
		$("select").attr("disabled", true);
		
		
		
		//$("#submit").bind("click", function(){**************});
		/* $("#submit").click(function(){
			$("input").attr("disabled", false);
			$("select").attr("disabled", false);
			$("#pageTitle").html("编辑个人信息");
			var backPath = $("#backPath").val();
			$(".formSubBtn").html("<input type=\"submit\" class=\"submit\" value=\"保存修改\" onclick=\"location.href='"+inserPath+"';\" /> <input type=\"button\" class=\"back\" value=\"返回\" onclick=\"location.href='"+backPath+"';\" />");
		}); */
	}); 
	  
</script>
</head>

<body>
	<input type="hidden" name="backPath" id="backPath" value="${pageContext.request.contextPath}/uiAction_frame_welcome.action" />
	<input type="hidden" name="inserPath" id="inserPath" value="${pageContext.request.contextPath}/LoginAction_updateUser.action" />
	
	<div class="action">
		<div class="t">
			<b id="pageTitle">个人信息</b>
		</div>
		<div class="pages">
		<form id="userInfo"  method="post" onsubmit="return checkUserUpdate(${loginUser.rank}, ${loginUser.rank}, 'update', ${loginUser.password });">
		<input type="hidden" name="username" id="username" value="${loginUser.username}" />
		<input type="hidden" name="id" id="id" value="${loginUser.id}" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="formTable">
				<tr>
					<td align="right" width="30%">原密码：</td>
					<td align="left" width="70%">
					<input type="text" name="password" id="password" class="input" value="${loginUser.password}" onblur="return check_opassword(${loginUser.password });" />
					<span id="password_text">
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
					<td align="left"><input type="text" id="birthdayInput" name="birthday" class="input dateTimeInput" readonly
						value="<fmt:formatDate value="${loginUser.birthday}" pattern="yyyy-MM-dd" />" onblur="return check_birthday();" /> <span id="birthday_text"><font color=red>*</font></span></td>
				</tr>
				<style>div.calendar{margin-top:266px}</style>
				<script type="text/javascript">
				date = new Date();
				/* Calendar.setup({
					inputField     :    "birthdayInput",
					ifFormat       :    "%Y-%m-%d",
					weekNumbers : false
				}); */
				</script>
				<tr>
					<td align="right">性别：</td>
					<td align="left"><label><input type="radio" name="sex"
							value="1" <c:if test="${loginUser.sex==1}">checked</c:if> /> 男</label> <label><input
							type="radio" name="sex" value="2"
							<c:if test="${loginUser.sex==2}">checked</c:if> /> 女</label> <span id="sex_text"></span></td>
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
						value="${user.address }" id="address" class="input" /> <span id="address_text"></span>
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
			<input type="hidden" id="userName" name="userName" value="${loginUseruserName}" />
			<div class="formSubBtn">
					<!-- 	$(".formSubBtn").html("<input type=\"submit\" class=\"submit\" value=\"保存修改\" onclick=\"location.href='"+inserPath+"';\" /> 
						<input type=\"button\" class=\"back\" value=\"返回\" onclick=\"location.href='"+backPath+"';\" />"); -->
				<input type="button" class="submit"  value="保存修改" style="display:none;" onclick="updateUser();"/>
				<input type="button" class="back" value="返回" style="display:none;" onclick="toggleUser();"/>
				<!-- <span  class="submit" id="submit">编辑数据</span> -->
				<input type="button"  class="submit" value="编辑数据" onclick="toggleUser()" />
				<!-- onclick没反应 -->
			</div>
		</form>
		</div>
</body>
	</div>
</html>
<script type="text/javascript">

	function toggleUser(){
	alert("ss222")
		var disable=$("table input").attr("disabled");
		
		if(disable=='disabled'){
		     $("table input").attr("disabled",false);
		     $("select").attr("disabled",false);
		}else{
			 $("table input").attr("disabled",true);
		     $("select").attr("disabled",true);
		}
		
		$("input[value='保存修改']").toggle();
		$("input[value='返回']").toggle();
		$("input[value='编辑数据']").toggle();
	}

	function updateUser(){
		
		$.ajax({
			type:'post',
			dateType:'json',
			url:'${pageContext.request.contextPath}/userInfo_updateUser.action',
			data:$("#userInfo").serialize(),
			success:function(data){
				if(data.ok='ok'){
					$("table input").attr("disabled", true);
					$("select").attr("disabled",true);
					$("input[value='保存修改']").toggle();
					$("input[value='返回']").toggle();
					$("input[value='编辑数据']").toggle();
					}else{
						$.messager.alert("提示消息", "错误!", "info");
					}
				}
			}
		);
	}
</script>