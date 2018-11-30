<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>      
<head>          
<title>输入要添加用户的信息</title>     
</head>      
<body>    
<br><br>        
<center>
	<form action= "ordercheck.jsp"  method="post">
	<h2>输入要添加订单的信息</h2> 
	<hr>                  
		<table border=2 align="center">
			<tr> 
			<th>商品编号</th>
			<th>订货数量</th>
			</tr>
			<tr> 
				<td><input type="text" name="goodsid"></td> 
				<td><input type="text" name="amount"></td> 
				<input type="hidden" name="orderid" value="<%=request.getParameter("tianjia")%>">
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重 置"></td>
			</tr>
		</table> 
</form>
</center>      
</body> 
</html>                        