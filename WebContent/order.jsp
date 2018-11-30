<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单</title>
</head>
<body>
<%@ include file="login.jsp"%>
<%      /*---------------------------------------连接数据库并查询-----------------------*/
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root","");                
	Statement stmt=con.createStatement();                 
	String sql="select * from goods";                  
	ResultSet rs=stmt.executeQuery(sql);                 
	while(rs.next()){ 
		if(rs.getInt("stock")<10){
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date currentTime = new java.util.Date();
			String str_date1 = formatter.format(currentTime);
			String year=str_date1.substring(0,4);//取第0+1位至第4位
			String month=str_date1.substring(5,7);//取第5+1位至第7位
			String day=str_date1.substring(8,10);
			String orderid=year+month+day+rs.getString("supplierid");
			//String ordertime=str_date1;
			String goodsid=rs.getString("goodsid");
			//String submittime=formatter;
			int amount=rs.getInt("stock")*10;
			String username =(String) session.getAttribute("username");
			out.print(username);
			String sql1="insert ignore into order2 values('"+orderid+"','"+goodsid+"','"+amount+"')";
			Statement stmt1=con.createStatement();
		    int flag = stmt1.executeUpdate(sql1);
			String sql2="select supplierid from goods where goodsid='"+goodsid+"'";
			Statement stmt2=con.createStatement();
			ResultSet rs1=stmt2.executeQuery(sql2);
			rs1.next();
			String supplierid=rs1.getString("supplierid");
			String sql3="insert ignore into order1(orderid,supplierid,ordertime,buyer,submittime) values('"+orderid+"','"+supplierid+"','"+str_date1+"','"+username+"','"+str_date1+"')";
			Statement stmt3=con.createStatement();
		    int flag1 = stmt3.executeUpdate(sql3);
		} 	
	}
	response.sendRedirect("orderlist.jsp");
	%>
</body>
</html>