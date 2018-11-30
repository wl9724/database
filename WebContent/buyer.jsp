<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title>采购员界面</title>
</head>

<frameset framespacing="1" border="1" bordercolor= #333399  frameborder="yes">
	<frameset cols="150,*">
		<frame name="contents" target="main" src="left1.jsp" scrolling="auto" frameborder=0>
		<frame name="right" src="goods.jsp" scrolling="auto" noresize frameborder=0>
	</frameset>
	<noframes>
	<body>
	<p>此网页使用了框架，但您的浏览器不支持框架。</p>
	</body>
	</noframes>
</frameset>

</html>