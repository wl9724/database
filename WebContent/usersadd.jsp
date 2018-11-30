<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>      
<head>      
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">     
<title>输入要添加用户的信息</title>     
</head>      
<body>       
<%@ include file="inc.jsp"%>                 
<br><br>        
<center>
	<form action= "userscheck.jsp"  method="post">
	<h2>输入要添加用户的信息</h2> 
	<hr>                  
		<table border="0" width="200">
			<tr> 
				<td>用&nbsp;户&nbsp;名&nbsp;称</td>
				<td><input type="text" name="names"></td>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="text" name="pass" ></td>
			<tr>
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
			<tr>
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重 置"></td>
			</tr>
		</table>
	</form>
</center>      
</body> 
</html>                        