<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
</head>
<body>
<%                              
	request.setCharacterEncoding("utf-8");
	String orderid=request.getParameter("orderid");
	String shenhe=request.getParameter("shenhe");
	int checked=Integer.parseInt(request.getParameter("shenhe1"));
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");    
	String sql = "update order1 set shenhe='"+shenhe+"',shenshijian='"+currentTime+"',checked='"+checked+"' where orderid='"+orderid+"'";
	Statement state = con.createStatement();  
    int flag = state.executeUpdate(sql);
    response.sendRedirect("orderlist.jsp");       
%>       
<br><br>        
</body>
</html>