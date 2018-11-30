<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>      
<head>      
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">     
<title>输入要添加供应商的信息</title>     
</head>      
<body>       
<%@ include file="inc.jsp"%>                 
<br><br>        
<center>             
	<form action= "suppliercheck.jsp"  method="post">                 
	<h2>输入要添加供应商的信息</h2> 
	<hr>                  
		<table border="0" width="200">                         
			<tr>                          
				<td>供&nbsp;应&nbsp;商&nbsp;编&nbsp;号</td>                         
				<td><input type="text" name="supplierid"></td>                         
			</tr>                         
			<tr>                          
				<td>供应商名称</td>                          
				<td><input type="text" name="name" ></td>
			</tr>                         
			<tr>                          
				<td>联系人</td>                         
				<td><input type="text" name="linkman"></td>
			</tr>        
			<tr>                          
				<td>联系电话</td>                         
				<td><input type="text" name="contact"></td>
			</tr>                         
			<tr>                          
				<td>手机</td>                          
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>                          
				<td>单位地址</td>                          
				<td><input type="text" name="address"></td>
			</tr>
			<tr>                          
				<td>邮政编码</td>                          
				<td><input type="text" name="postalcode"></td>
			</tr>
			<tr>                          
				<td>开户银行</td>                          
				<td><input type="text" name="bank"></td>
			</tr>
			<tr>                          
				<td>银行账户</td>                          
				<td><input type="text" name="account"></td>
			</tr>
			<tr>                         
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="取  消"></td>
			</tr>
		</table>
	</form>
</center>      
</body> 
</html>                        