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
<script type="text/javascript">
function disp_confirm()
  {
  var r=confirm("确定删除？")
  if (r==true)
    {
	 var id= document.getElementById("email").getAttribute("emailId");
    document.write("删除成功！")
	window.location.href="${pageContext.request.contextPath}/emailAction/updateIsDelete.action?id="+id;
    }
  else
    {
    document.write("")
    }
  }
</script>
</head>

<style type="text/css">
/* #writeEmail td{ margin: 1px;    border:5px solid blue;} */
</style>
<script type="text/javascript">

</script>
<body>
<div class="action">
		<div class="t">
			<b id="pageTitle">垃圾邮件</b>
		</div>
		<div class="pages">
		<input type="hidden" value="-1" id="isFileOk">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="formTable">
		<form action="${pageContext.request.contextPath}/emailAction/insertEmail.action" method="post"  
		enctype="multipart/form-data" onsubmit="return checkmailWrite()">
				<tr>
					<td align="left" width="30%">邮件标题</a></td>
					<td align="left" width="30%">内容</td>
					<td align="left" width="30%">是否已读</td>
					<td align="left" width="30%">发送时间</td>
					<td align="left" width="30%">操作</td>
				</tr>
				<c:if test="${emailList!=null}">
				<c:forEach items="${emailList}" var="email" varStatus="i">
					<tr <c:if test="${i.count%2!=0}">bgcolor="#CCCCFE"</c:if>>
					<td align="left" width="30%"><a href="${pageContext.request.contextPath}/emailAction/emailInfoDetail.action?model.id=${email.id}">${email.title}</a></td>
					<td align="left" width="30%">${email.content}</td>
					<td align="left" width="30%">${email.isRead==0 ? '未读' : '已读' }</td>
					<td align="left" width="30%"><fmt:formatDate value="${email.sendTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td align="left" width="30%"><input type="button" onclick="disp_confirm()"value="删除"  id="email" emailId="${email.id}"/>
				</tr></td>
					
				</c:forEach>
				</c:if>
			</table>
	</div>
	</div>
</body>
</html>