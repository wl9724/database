<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应商列表</title>
</head>
<body>
<br><br>
<table border=2 align="center">                 
<tr>                  
	<th>供应商编号</th>                 
	<th>供应商名称</th>                 
	<th>联系人</th>                 
	<th>联系电话</th>                 
	<th>手机</th>
	<th>单位地址</th>
	<th>邮政编码</th>
	<th>开户银行</th>
	<th>银行账户</th>                
</tr>
<%      /*---------------------------------------连接数据库并查询-----------------------*/
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku","root","");                
	Statement stmt=con.createStatement();                 
	String sql="select * from supplier";                  
	ResultSet rs=stmt.executeQuery(sql);                 
	while(rs.next()){             
%>      
<!-------将查询结果投放至表格中显示------------------------------------->             
<tr>                  
	<td><%=rs.getString("supplierid")%> </td>                 
	<td><%=rs.getString("name")%> </td>                 
	<td><%=rs.getString("linkman")%> </td>                 
	<td><%=rs.getString("contact")%> </td>                 
	<td><%=rs.getString("phone")%> </td>
	<td><%=rs.getString("address")%> </td>
	<td><%=rs.getString("postalcode")%> </td>
	<td><%=rs.getString("bank")%> </td>
	<td><%=rs.getString("account")%> </td>
	 <!-------用来进行修改删除命令发起的按钮，自带指示位置的数据-----> 
	<td>
	<form action="supplierUpdate.jsp" method="post">  
		<input type="hidden" name="xiugai" value="<%=rs.getString("supplierid") %>"> 
		<input type="submit" value="修改" name="submit">    
	</form>  
	<form action="supplierDelete.jsp" method="post">
		<input type="hidden" name="shanchu" value="<%=rs.getString("supplierid") %>"> 
		<input type="submit" value="删除" name="submit">    
	</form>          
	</td>           
</tr>              
<%}%>             
<% 
 /*------------关闭与数据库的连接---------------------------*/                   
	rs.close();                  
	stmt.close();                  
	con.close();             
%>         
</table> 
</body>
</html>