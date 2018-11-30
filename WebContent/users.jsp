<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
</head>
<body>
<br><br>
<table border=2 align="center">                 
<tr>                  
	<th>用户名</th>                 
	<th>密码</th>
    <th>用户权限</th>                              
</tr>
<%      /*---------------------------------------连接数据库并查询-----------------------*/
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");                
	Statement stmt=con.createStatement();                 
	String sql="select * from users";                  
	ResultSet rs=stmt.executeQuery(sql);                 
	while(rs.next()){             
%>      
<!-------将查询结果投放至表格中显示------------------------------------->             
<tr>                                   
	<td><%=rs.getString("name")%> </td>                 
	<td><%=rs.getString("pass")%> </td>   
	<td><%=rs.getString("power")%> </td>                               
	   <!-------用来进行修改删除命令发起的按钮，自带指示位置的数据-----> 
	<td>
	<form action="usersUpdate.jsp" method="post">  
		<input type="hidden" name="xiugai" value="<%=rs.getString("name") %>"> 
		<input type="submit" value="修改" name="submit">    
	</form>  
	<form action="usersDelete.jsp" method="post">
		<input type="hidden" name="shanchu" value="<%=rs.getString("name") %>"> 
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
<form action="usersadd.jsp" method="post">
		<input type="submit" value="添加用户" name="submit">    
	</form>
</body>
</html>