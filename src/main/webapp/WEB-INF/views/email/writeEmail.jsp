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
<script type="text/javascript">

	function checkmailWrite() {
		var checkarr = [ check_mailTitle(), check_File() ];
		for(var i=0; i<checkarr.length; i++){
			if(checkarr[i]==false){
				return false;
			}
		}
		return true;
	}
	

function check_File(){
	 var $isFileOk  =$("#isFileOk").val()
		if($isFileOk!=1){
			if($isFileOk==-1){
				$("#upload_text").html("<font color=red>✕不能为空</font>");
				 console.info("#upload_tex");
			}
			return false;
		}
}	
	
function check_mailTitle(){
	 var $title_text=$("#title").val();
	 if($title_text==""||$title_text==undefined){
		 $("#title_text").html("<font color=red>✕不能为空</font>");
		 console.info("<font color=red>✕不能为空</font>");
		 return false;
	 }
}
	

$(function(){
	//上传文件，maxSize单位为kb，9*1024=9216为9M
	$('#upload').checkFileTypeAndSize( 
			{
				allowedExtensions : [ 'jpg', 'jpeg', 'gif', 'png', 'rar',
						'zip', '7z', 'pdf', 'doc', 'xls', 'ppt', 'docx',
						'xlsx', 'pptx' ],
				maxSize : 9216,
				success : function() {
					$("#upload_text").html("<font color=green>√</font>");
					$("writeEmail").val("1");
				},
				extensionerror : function() {
					$("#upload_text").html("<font color=red>✕ 附件允许的格式为：jpeg、gif、png、rar、zip、7z、pdf、doc、xls、ppt、docx、xlsx、pptx</font>");
					$("writeEmail").val("0");
				},
				sizeerror : function() {
					$("#upload_text").html("<font color=red>✕ (上传文件不能大于9M)</font>");
					$("writeEmail").val("0");
				}
			});
	
	$.ajax({
		   type: "POST",
		   url: "some.php",
		   data: "name=John&location=Boston",
		   dataType:"json",
		   success: function(msg){
		     alert( "Data Saved: " + msg );
		   }
		});
	
});
</script>
<body>
<div class="action">
		<div class="t">
			<b id="pageTitle">写邮件</b>
		</div>
		<div class="pages">
		<input type="hidden" value="-1" id="isFileOk">
		<form action="" method="post" onsubmit="checkmailWrite()">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="formTable">
				<tr>
					<td align="right" width="30%">收件人：</td>
					<td align="left" width="70%"><select>
					<option>--请选择--</option>
						<c:forEach items="${userList}" var="user">
								<option value="${user.username}">${user.username}&nbsp;&nbsp;${user.nickname}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">邮件标题：</td>
					<td align="left"><input type="text" name="title" id="title" class="input" onblur="check_mailTitle()"/> <span id="title_text"><font color=red>*</font></span></td>
				</tr> 
				<tr>
					<td align="right">邮件内容：</td>
					<td align="left"><textarea rows="20" cols="40"></textarea></td>
				</tr>
				<tr>
					<td align="right">上传附件：</td>
					<td align="left"><input type="file" id="upload"/> <span id="upload_text"><font color=red>*</font>上传附件不能大于9M</span></td>
				</tr>
			</table>
				<div align="center">
					<input type="submit" value="发送邮件" >
				</div>
		</form>
	</div>
	</div>
</body>
</html>