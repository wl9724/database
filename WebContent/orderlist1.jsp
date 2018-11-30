<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
</head>
<body>

<table border=2 align="center">                 
<tr>
	<th>订单编号</th>
	<th>商品编码</th>
	<th>订单数量</th>
	<th>供应商编码</th>
	<th>订单时间</th>
	<th>采购员</th>
	<th>提交时间</th>
	<th>审核状态</th>
	<th>供应商名称</th>
	<th>单位地址</th>
	<th>邮政编码</th>
	<th>商品名称</th>
	<th>商品规格</th>
	<th>商品型号</th>
	<th>单价</th>                
</tr>
<%      /*---------------------------------------连接数据库并查询-----------------------*/
	request.setCharacterEncoding("utf-8");
	String orderid1=request.getParameter("orderid1"); 
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");
	Statement stmt=con.createStatement();
	String sql="select * from order2 where orderid='"+orderid1+"'";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()){
%>
<!-------将查询结果投放至表格中显示------------------------------------->             
<tr>                  
	<td><%=rs.getString("orderid")%> </td>                                  
	<td><%=rs.getString("goodsid")%> </td>                 
	<td><%=rs.getString("amount")%> </td>                 
	<% 
	String sql1="select * from order1 where orderid='"+orderid1+"'";
	Statement stmt1=con.createStatement();
	ResultSet rs1=stmt1.executeQuery(sql1);
	rs1.next();
	%>
	<td><%=rs1.getString("supplierid")%> </td>
	<td><%=rs1.getString("ordertime")%> </td>
	<td><%=rs1.getString("buyer")%> </td>
	<td><%=rs1.getString("submittime")%> </td>
	<td><%=rs1.getString("checked")%> </td>
	<% 
	String supplierid=rs1.getString("supplierid");
	String sql2="select * from supplier where supplierid='"+supplierid+"'";
	Statement stmt2=con.createStatement();
	ResultSet rs2=stmt2.executeQuery(sql2);
	rs2.next();
	%>
	<td><%=rs2.getString("name")%> </td>
	<td><%=rs2.getString("address")%> </td>
	<td><%=rs2.getString("postalcode")%> </td>
	<% 
		String goodsid=rs.getString("goodsid");
		String sql3="select * from goods where goodsid='"+goodsid+"'";
		Statement stmt3=con.createStatement();
		ResultSet rs3=stmt3.executeQuery(sql3);
		rs3.next();
	%>
	<td><%=rs3.getString("name")%> </td>
	<td><%=rs3.getString("spec")%> </td>
	<td><%=rs3.getString("type")%> </td>
	<td><%=rs3.getString("price")%> </td>
	   <!-------用来进行修改删除命令发起的按钮，自带指示位置的数据-----> 
	<%
		int checked=rs1.getInt("checked");
		String username =(String) session.getAttribute("username");
		if(checked!=1&&!username.equals("manage")){
	%>
	<td>
	<form action="orderUpdate.jsp" method="post">  
		<input type="hidden" name="xiugai" value="<%=rs.getString("goodsid") %>"> 
		<input type="submit" value="修改" name="submit">    
	</form>  
	<form action="orderDelete.jsp" method="post">
		<input type="hidden" name="goodsid" value="<%=rs.getString("goodsid") %>"> 
		<input type="submit" value="删除" name="submit">    
	</form>          
	</td> 
	<%} %>          
</tr>
<%}%>
<% 
 /*------------关闭与数据库的连接---------------------------*/                   
	rs.close();
	stmt.close();
	con.close();             
%>         
</table> 
<%
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");
	Statement stmt1=con1.createStatement();
	String sql1="select * from order1 where orderid='"+orderid1+"'";
	ResultSet rs1=stmt1.executeQuery(sql1);
	rs1.next();
	int checked=rs1.getInt("checked");
	String username =(String) session.getAttribute("username");
	if(checked!=1&&!username.equals("manage")){
%>
<form action="orderadd.jsp" method="post">
		<input type="hidden" name="tianjia" value="<%=orderid1%>">   
		<input type="submit" value="添加订单" name="submit">
</form>
<%} %>
</body>
</html>