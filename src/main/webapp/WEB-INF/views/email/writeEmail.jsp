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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadck.js"></script>
</head>

<style type="text/css">
 #writeEmail tr{ margin: 10px;  } 
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
	 var $title_text=$("title_text").val();
	 if($title_text.val()==""){
		 $("title_text").html("<font color=red>✕不能为空</font>");
		 console.info("<font color=red>✕不能为空</font>");
		 return false;
	 }
}
	

$(function() {
	
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
});
</script>
<body>
	<div class="action">
		<s:form id="writeEmail" onsubmit="checkmailWrite()" enctype="multipart/form-data" method="post">
		 <s:hidden id="isFileOk" value="-1"></s:hidden>
		<div class="t">写邮件</div>
		<div class="pages">
			<table width="90%" border="0" cellspacing="0" cellpadding="10">
				<tr>
					<td align="right" width="30%">收件人：</td>
					<td align="left"><s:select list="userList" name="user"
				listKey="userId" listValue="username"
				headerKey="" headerValue="----请--选--择----"
			>
			</s:select></td>
				</tr>
				<tr>
					<td align="right" width="30%">邮件标题：</td>
					<td align="left"><s:textfield name="title" value=""></s:textfield><font color="red">*</font><span id="title_text"></span></td>
				</tr>
				<tr>
					<td align="right" width="30%">邮件内容：</td>
					<td align="left"><s:textarea name="" cols="10" rows="5" label="邮件内容"></s:textarea></td>
				</tr>
				<tr>
					<td align="right" width="30%">上传文件：</td>
					<td align="left"> 
					 <s:file   id="upload" name="" label="选择上传的文件" /><span id="upload_text"><font color="red">*</font>(上传文件不能大于9M)</span></td>
				</tr>
				<tr>
					<td align="center" width="30%" colspan="2"><s:submit value="发送邮件"/></td>
					</td>
				</tr>
			</table>
		</div>
		</s:form>
	</div>
</body>
</html>