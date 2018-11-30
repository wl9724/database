<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>      
<head>      
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">     
<title>输入要添加商品的信息</title>     
</head>      
<body>       
<%@ include file="inc.jsp"%>                 
<br><br>        
<center>             
	<form action= "goodscheck.jsp"  method="post">
	<h2>输入要添加商品的信息</h2> 
	<hr>                  
		<table border="0" width="200">                         
			<tr>                          
				<td>商&nbsp;品&nbsp;编&nbsp;号</td>                         
				<td><input type="text" name="goodsid"></td>                         
			</tr>                         
			<tr>                          
				<td>商品名称</td>                          
				<td><input type="text" name="name" ></td>
			</tr>                         
			<tr>                          
				<td>商品规格</td>                         
				<td><input type="text" name="spec"></td>
			</tr>        
			<tr>                          
				<td>商品型号</td>                         
				<td><input type="text" name="type"></td>
			</tr>                         
			<tr>                          
				<td>商品尺寸</td>                          
				<td><input type="text" name="size"></td>
			</tr>
			<tr>                          
				<td>进价</td>                          
				<td><input type="text" name="price"></td>
			</tr>
			<tr>                          
				<td>销售价</td>                          
				<td><input type="text" name="sale"></td>
			</tr>
			<tr>                          
				<td>会员价</td>                          
				<td><input type="text" name="member"></td>
			</tr>
			<tr>                          
				<td>在库数量</td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td>供应商编号</td>
				<td><input type="text" name="supplierid"></td>
			</tr>
			<tr>
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重 置"></td>
			</tr>
		</table>
	</form>
</center>      
</body> 
</html>                        