<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单列表</title>
</head>
<body>
<br><br>
<%
	String username =(String)session.getAttribute("username");
	if(!username.equals("manage")){
%>
<a href="order.jsp">一键生成订单</a>
<%} %>
<table border=2 align="center">                 
<tr>                  
	<th>订单编号</th>                 
	<th>供应商编号</th>
	<th>订单时间</th>
	<th>采购员</th>
	<th>提交时间</th> 
	<th>审核意见</th>
	<th>审核</th>               
                
</tr>
<%      /*---------------------------------------连接数据库并查询-----------------------*/
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");                
	Statement stmt=con.createStatement();                 
	String sql="select * from order1";                  
	ResultSet rs=stmt.executeQuery(sql);                 
	while(rs.next()){             
%>      
<!-------将查询结果投放至表格中显示------------------------------------->             
<tr>                  
	<td><%=rs.getString("orderid")%> </td>                 
	<td><%=rs.getString("supplierid")%> </td>
	<td><%=rs.getString("ordertime")%> </td> 
	<td><%=rs.getString("buyer")%> </td>
	<td><%=rs.getString("submittime")%> </td>  
	<form action="shenhe.jsp"  method="post"> 
	<td><input type="text" name="shenhe" value="<%=rs.getString("shenhe")%>"></td>
	<%
		if(!username.equals("buyer")&&rs.getInt("checked")==2){
	%>
	<td>
	<input type="radio" name="shenhe1" value="1">通过
	<input type="radio" name="shenhe1" value="0">不通过   
	</td>  
	<td>
	<input type="hidden" name="orderid" value="<%=rs.getString("orderid") %>">
	<input name="sure" type="submit" value="提  交">
	</td>
	<%} %> 
	</form> 
	<td>
	<form action= "orderlist1.jsp" target="down" method="post"> 
	<input type="hidden" name="orderid1" value="<%=rs.getString("orderid") %>">
	<input name="sure" type="submit" value="查看详情">
	</form>
	</td>                  
</tr>              
<%}%>             
<%                   
	rs.close();                  
	stmt.close();                  
	con.close();             
%>         
</table> 
</body>
</html>