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

</script>
<body>
<div class="action">
		<div class="t">
			<b id="pageTitle">收邮件</b>
		</div>
		<div class="pages">
		<input type="hidden" value="-1" id="isFileOk">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="formTable">
		<form>
		<%-- <input type="hidden" name="pageNum"  value="${page.pageNum}"/> --%>
				<tr>
					<td align="left" width="30%">邮件标题</a></td>
					<td align="left" width="30%">内容</td>
					<td align="left" width="30%">是否已读</td>
					<td align="left" width="30%">发送时间</td>
					<td align="left" width="30%">操作</td>
				</tr>
				<c:if test="${page!=null}">
				<c:forEach items="${page.data}" var="email" varStatus="i">
					<tr <%-- <c:if test="${i.count%2!=0}">bgcolor="#CCCCFE"</c:if> --%>   id="${email.id}">
					<td align="left" width="30%"><a href="${pageContext.request.contextPath}/emailAction/emailInfoDetail.action?model.id=${email.id}">${email.title}</a></td>
					<td align="left" width="30%">${email.content}</td>
					<td align="left" width="30%">${email.isRead==0 ? '未读' : '已读' }</td>
					<td align="left" width="30%"><fmt:formatDate value="${email.sendTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td align="left" width="30%"><a href="javascript:void(0)" onclick="todelete(${email.id})">删除</a></td>
				</tr>
				</c:forEach>
				</c:if>
				<tr>
					<td align="right" colspan="5">
						<span>第${page.pageNum}/${page.totalPage}页</span>
						<c:if test="${page.pageNum gt 1}">
							<a href="javascript:void(0)" onclick="showPage(1)">[首页]</a>&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="showPage(${page.pageNum-1})">[上一页]</a>&nbsp;&nbsp;
						</c:if>
						<c:forEach begin="${page.start}" end="${page.end}" var="num">
						    	<a href="javascript:void(0)" onclick="showPage(${num})">${num}</a>&nbsp;&nbsp;
						</c:forEach>
						<c:if test="${page.pageNum lt page.totalPage}">
							<a href="javascript:void(0)" onclick="showPage(${page.pageNum+1})">[下一页]</a>&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="showPage(${page.totalPage})">[尾页]</a>&nbsp;&nbsp;
						</c:if>
					</td>
				</tr>
			</form>		
			</table>
			<%-- <table border="0" cellspacing="0" cellpadding="0" align="center">
			</table> --%>
	</div>
	</div>
</body>
<script type="text/javascript">

		$(function(){
			updateColor();
		})
		//修改样式
		function updateColor(){
			
			var size=$("tr[id]").size();
			
			for(var i=0;i<size;i++){
				$("tr[id] :eq("+i+")").css({background:"null"});
				if(i%2==0){
					$("tr[id] :eq("+i+")").css({background:"#CCCCFE" });
				}
			}
			
			/* var dom=$("tr[id]").get(0);
			for(var num in dom ){
				
			} */

		}
		
		function showPage(num){
			window.location.href="${pageContext.request.contextPath}/emailAction/emailInfo.action?pageNum="+num;
		}
		
		function todelete(id){
			var flag=confirm("是否删除");
			if(flag==true){
				updateIsdelete(id);
			}
		}
		
		function updateIsdelete(id){
			$.ajax({
				url:'${pageContext.request.contextPath}/emailAction/updateIsdelete.action',
				type:'post',
				dataType:'text',
				data:{'model.id':id},
				success:function(data){
					if(data=="true"){
						$("tr").remove("[id="+id+"]");
						//修改样式
						updateColor();
					}else{
						alert("删除失败");
					}
				}
				
			});
		}
		
	</script>
</html>

<!--以下代码是 分页参考 -->
 <%--  <td align="right">
    	<span>第<s:property value="#pageBean.pageNum" />/<s:property value="#pageBean.totalPage" />页</span>
        <span>
        	<s:if test="#pageBean.pageNum gt 1">
            	<a href="javascript:void(0)" onclick="showPage(1)">[首页]</a>&nbsp;&nbsp;
            	<a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.pageNum - 1" />)">[上一页]</a>&nbsp;&nbsp;
        	</s:if>
        	
        	动态显示条
        	<s:iterator begin="#pageBean.start" end="#pageBean.end" var="num">
           		<a href="javascript:void(0)" onclick="showPage(<s:property value="#num" />)"><s:property value="#num" /></a>&nbsp;&nbsp;
        	</s:iterator>
        	
        	<s:if test="#pageBean.pageNum lt #pageBean.totalPage">
           		<a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.pageNum + 1" />)">[下一页]</a>&nbsp;&nbsp;
            	<a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.totalPage" />)">[尾页]</a>&nbsp;&nbsp;
            </s:if>
        </span>
    </td>
  </tr>
</table>
	<script type="text/javascript">
		function showPage(num){
			//1 修改隐藏域的值
			document.getElementById("pageNum").value = num;
			//2 提交表单
			document.forms[0].submit();
		}
	</script>
 --%>