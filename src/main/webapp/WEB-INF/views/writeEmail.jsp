<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="action">
		<div class="t">写邮件</div>
		<div class="pages">
			<table width="90%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" width="30%">收件人：</td>
					<td align="left"><s:select list="userList" name="username"
				listKey="username" listValue="username"
				headerKey="" headerValue="----请--选--择----"
			>
			</s:select></td>
				</tr>
				<tr>
					<td align="right" width="30%">邮件标题：</td>
					<td align="left"><s:textfield name="title"></s:textfield></td>
				</tr>
				<tr>
					<td align="right" width="30%">邮件内容：</td>
					<td align="left"><s:textarea name="" cols="10" rows="5" label="邮件内容"></s:textarea></td>
				</tr>
				<tr>
					<td align="right" width="30%">上传文件：</td>
					<td align="left"> <s:file name="" label="选择上传的文件" /></td>
				</tr>
				<tr>
					<td align="center" width="30%"><s:submit value="发送邮件"/></td>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>