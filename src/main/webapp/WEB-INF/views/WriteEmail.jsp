<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="action">
						<div class="t">
							写邮件
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">收件人：</td><td  align="left">
										<select>
											
									
									
										</select>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">邮件内容：</td><td  align="left"><textarea rows="50" cols="40"></textarea></td>
								</tr>
								<tr >
									<td align="right" width="30%">发信时间：</td><td  align="left">
										<input type="text" name="" value="男" readonly="readonly" id=""/>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">手机：</td><td  align="left"><input type="text" name="u.mobile" value="13879854856" readonly="readonly" id="u_mobile"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td><td  align="left"><input type="text" name="u.address" value="台湾" readonly="readonly" id="u_address"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="button"  id="save" value="编辑数据" onclick="setit()" /></td>
								</tr>
								</table>
						</div>
					</div>
</body>
</html>