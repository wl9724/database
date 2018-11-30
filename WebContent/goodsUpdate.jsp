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
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");    
	Statement stmt=con.createStatement();              
	String sql="select * from goods where goodsid="+yid+"";         
	ResultSet rs=stmt.executeQuery(sql);          
	rs.next();         
%>       <!-----------创建用于提交修改后的数据的表单并先将旧数据填---------------->         
<br><br>        
<center>             
	<form action= "goodsupdate1.jsp"  method="post">                 
	<h2>修改商品的信息</h2> 
	<hr>                  
		<table border="0" width="200">                         
			<tr>                          
				<td>商&nbsp;品&nbsp;编&nbsp;号</td>                         
				<td><input type="text" name="goodsid" value="<%=rs.getString("goodsid")%>"></td>                         
			</tr>                         
			<tr>                          
				<td>商品名称</td>                          
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>                         
			<tr>                          
				<td>商品规格</td>                         
				<td><input type="text" name="spec" value="<%=rs.getString("spec")%>"></td>
			</tr>        
			<tr>                          
				<td>商品型号</td>                         
				<td><input type="text" name="type" value="<%=rs.getString("type")%>"></td>
			</tr>                         
			<tr>                          
				<td>商品尺寸</td>                          
				<td><input type="text" name="size" value="<%=rs.getString("size")%>"></td>
			</tr>
			<tr>                          
				<td>进价</td>                          
				<td><input type="text" name="price" value="<%=rs.getFloat("price")%>"></td>
			</tr>
			<tr>                          
				<td>销售价</td>                          
				<td><input type="text" name="sale" value="<%=rs.getFloat("sale")%>"></td>
			</tr>
			<tr>                          
				<td>会员价</td>                          
				<td><input type="text" name="member" value="<%=rs.getFloat("member")%>"></td>
			</tr>
			<tr>                          
				<td>在库数量</td>                          
				<td><input type="text" name="stock" value="<%=rs.getInt("stock")%>"></td>
			</tr>
			<tr>                          
				<td>供应商编号</td>                          
				<td><input type="text" name="supplierid" value="<%=rs.getString("supplierid")%>"></td>
			</tr>
			<tr>                         
				<td><input name="sure" type="submit" value="提  交"></td>
				<td><input name="clear" type="reset" value="重 置"></td>
			</tr>
		</table>
		<input type="hidden" name="goodsid1" value="<%=rs.getString("goodsid") %>">
	</form>
</center>   
</body>
</html>