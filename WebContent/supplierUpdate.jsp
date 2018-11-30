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
	request.setCharacterEncoding("utf-8");
	String yid=request.getParameter("xiugai");
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");    
	Statement stmt=con.createStatement();              
	String sql="select * from supplier where supplierid="+yid+"";         
	ResultSet rs=stmt.executeQuery(sql);          
	rs.next();         
%>       <!-----------创建用于提交修改后的数据的表单并先将旧数据填---------------->         
<br><br>        
<center>             
	<form action= "supplierupdate1.jsp"  method="post">                 
	<h2>修改供应商的信息</h2> 
	<hr>                  
		<table border="0" width="200">                         
			<tr>                          
				<td>供应商编号</td>                         
				<td><input type="text" name="supplierid" value="<%=rs.getString("supplierid")%>"></td>                         
			</tr>                         
			<tr>                          
				<td>供应商名称</td>                          
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>                         
			<tr>                          
				<td>联系人</td>                         
				<td><input type="text" name="linkman" value="<%=rs.getString("linkman")%>"></td>
			</tr>        
			<tr>                          
				<td>联系电话</td>                         
				<td><input type="text" name="contact" value="<%=rs.getString("contact")%>"></td>
			</tr>                         
			<tr>                          
				<td>手机</td>                          
				<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
			</tr>
			<tr>                          
				<td>单位地址</td>                          
				<td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
			</tr>
			<tr>                          
				<td>邮政编码</td>                          
				<td><input type="text" name="postalcode" value="<%=rs.getString("postalcode")%>"></td>
			</tr>
			<tr>                          
				<td>开户银行</td>                          
				<td><input type="text" name="bank" value="<%=rs.getString("bank")%>"></td>
			</tr>
			<tr>                          
				<td>银行账户</td>                          
				<td><input type="text" name="account" value="<%=rs.getString("account")%>"></td>
			</tr>
			<tr>                         
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重  置"></td>
			</tr>
		</table>
		<input type="hidden" name="supplierid1" value="<%=rs.getString("supplierid") %>">
	</form>
</center>   
</body>
</html>