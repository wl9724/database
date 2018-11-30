<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
					  + request.getServerName() + ":" + request.getServerPort()
					  + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">

<title>商品管理系统登录</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
-->

</head>

<body>
<center>
<form name="form1" action="login_action.jsp" method="post">
<table width="200" border="1">
	<tr>
		<td colspan="2">商品管理系统登录</td>
	</tr>
	<tr>
		<td>用户名</td>
		<td><input type="text" name="username" size="10"></td>
	</tr>
	<tr>
		<td>密码</td>
		<td><input type="password" name="password" size="10"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" name="submit" value="登录"></td>
	</tr>
</table>
</form>
</center>
</body>
</html>
