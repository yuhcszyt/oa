<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<frameset rows="90,*,10" framespacing="0px" frameborder="no">
	<frame src="${pageContext.request.contextPath}/uiAction_frame_top.action" scrolling="no"/>
    <frameset id="main" cols="170,*" framespacing="0px" frameborder="no" >
        <frameset rows="*" framespacing="0px" frameborder="no" >
            <frame src="/uiAction_frame_left.action" scrolling="no"/>
        </frameset>
        <frame src="/uiAction_frame_right.action" name="right" scrolling="yes"/>
	</frameset>
	<frame src="/uiAction_frame_bottom.action" scrolling="no"/>
</frameset>
</body>
</html>