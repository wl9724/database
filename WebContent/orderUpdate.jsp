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
<%                              /*-------连接数据库并查询学生
	 表中指定数据-------------------*/   
	String yid=request.getParameter("xiugai");
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");     
	Statement stmt1=con.createStatement();              
	String sql1="select * from order2 where goodsid="+yid+"";         
	ResultSet rs1=stmt1.executeQuery(sql1);
	rs1.next();         
%>       <!-----------创建用1于提交修改后的数据的表单并先将旧数据填---------------->         
<br><br>        
<center>             
	<form action= "orderupdate1.jsp"  method="post">                 
	<h2>修改订单的信息</h2> 
	<hr>                  
		<table border="0" width="200"> 
			<tr>                          
				<td>订单编号</td>                          
				<td><%=rs1.getString("orderid")%></td>
			</tr>
			<tr>                          
				<td>商品编号</td>                          
				<td><%=rs1.getString("goodsid")%></td>
			</tr>                                                  
			<tr>                          
				<td>订单数量</td>                          
				<td><input type="text" name="amount" value="<%=rs1.getString("amount")%>"></td>
			</tr>
			<tr>
			<input type="hidden" name="goodsid" value="<%=rs1.getString("goodsid") %>">
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重 置"></td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>