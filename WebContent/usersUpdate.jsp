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
	String sql="select * from users where names='"+yid+"'";         
	ResultSet rs=stmt.executeQuery(sql);          
	rs.next();         
%>       <!-----------创建用于提交修改后的数据的表单并先将旧数据填---------------->         
<br><br>        
<center>             
	<form action= "usersupdate1.jsp"  method="post">                 
	<h2>修改用户的信息</h2> 
	<hr>                  
		<table border="0" width="200">                         
			<tr>                          
				<td>用户名称</td>                         
				<td><input type="text" name="names" value="<%=rs.getString("names")%>"></td>                         
			</tr>                         
			<tr>                          
				<td>密码</td>                          
				<td><input type="text" name="pass" value="<%=rs.getString("pass")%>"></td>
			</tr> 
			<tr>                          
				<td>用户权限</td>                          
				<td>
				<form>
					<select name="power">
						<option value="admin">admin</option>
						<option value="buyer">buyer</option>
						<option value="manage">manage</option>
					</select>
				</form>
				</td>
			</tr>                        
			<tr>                         
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="取  消"></td>
			</tr>
		</table>
		<input type="hidden" name="names1" value="<%=rs.getString("names") %>">
	</form>
</center>   
</body>
</html>