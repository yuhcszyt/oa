<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadck.js"></script>
</head>

<style type="text/css">
/* #writeEmail td{ margin: 1px;    border:5px solid blue;} */
</style>

<body>
<div class="action">
		<div class="t">
			<b id="pageTitle">邮件信息详情</b>
		</div>
		<div class="pages">
		<input type="hidden" value="-1" id="isFileOk">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="formTable">
				<tr>
					<td align="right">邮件标题：</td>
					<td align="left"><input type="text" name="title" id="title" class="input" value="${email.title}" disabled="disabled"/></td>
				</tr> 
				<tr>
					<td align="right">邮件内容：</td>
					<td align="left"><textarea rows="20" cols="40" name="content" value="${email.content}" disabled="disabled"></textarea></td>
				</tr>
				<tr>
					<td align="right">发信时间：</td>
					<td align="left">
					<input type="text" id="sendTime" name="sendTime" value='<fmt:formatDate value="${email.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>' disabled="disabled"/></td>
				</tr>
				<tr>
					<td align="right">来自：</td>
					<td align="left"><input type="text" id="text" name="text" value="${email.sender}" disabled="disabled"/></td>
				</tr>
				<tr>
					<td align="right">文件：</td>
				<!-- 	<td align="left"><input type="button" id="text" name="text" value="下载"  FileDownload/></td>
					 -->
					<td align="left"><a href="${pageContext.request.contextPath}/emailAction/FileDownload.action?model.id=${email.id}">下载</a></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="button" value="返回" onclick="window.history.go(-1)"></td>
				</tr>
			</table>
	</div>
	</div>
</body>
</html>