<%@ page language="java" contentType="text/html;charset=utf8" pageEncoding="utf-8"%> 
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC"-//W3C//DTDHTML4.01Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>保存添加</title>
</head>
<body>
<% //获取提交参数 
try{
	request.setCharacterEncoding("utf-8");
	String goodsid=request.getParameter("goodsid");
	String amount1=request.getParameter("amount");
	int amount=Integer.parseInt(amount1);
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	String sql = "update order2 set amount='"+amount+"' where goodsid='"+goodsid+"'";
	Statement state = con.createStatement();
	int rs=state.executeUpdate(sql); 
	con.close();
	response.sendRedirect("orderlist1.jsp");
}catch(Exception e){
	out.print("订单信息修改失败！！！");
	e.printStackTrace();
   } 
%> 
</body>
</html>