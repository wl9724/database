<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询页面</title>
</head>
<body>
<br><br>        
<center>
	<form action= "chaixun1.jsp"  method="post">
	<h2>查询</h2> 
	<hr>                  
		<table border="0" width="200">
		<tr>
				<td>查&nbsp;询&nbsp;的&nbsp;表</td>
				<td>
				<form>
					<select name="table">
						<option value="goods">商品</option>
						<option value="supplier">供应商</option>
						<option value="users">用户</option>
					</select>
				</form>
				</td>
				<td>名&nbsp;称</td>
				<td><input type="text" name="names"></td>
				<td><input name="sure" type="submit" value="查询"></td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>