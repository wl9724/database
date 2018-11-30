<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%> 
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
	String goodsid1=request.getParameter("goodsid1");
	String name=request.getParameter("name");
	String spec=request.getParameter("spec");
	String type=request.getParameter("type");
	String size=request.getParameter("size");
	String price1=request.getParameter("price");
	float price=Float.parseFloat(price1);
	String sale1=request.getParameter("sale");
	float sale=Float.parseFloat(sale1);
	String member1=request.getParameter("member");
	float member=Float.parseFloat(member1);
	String stock1=request.getParameter("stock");
	int stock=Integer.parseInt(stock1);
	String supplierid=request.getParameter("supplierid");
	//数据转换：字符串（数字）转整型//利用jdbc完成数据库插入操作 
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	String sql = "update goods set goodsid='"+goodsid+"',name='"+name+"',spec='"+spec+"',type='"+type+"',size='"+size+"',price='"+price+"',sale='"+sale+"',member='"+member+"',stock='"+stock+"',supplierid='"+supplierid+"' where goodsid='"+goodsid1+"'";
	Statement state = con.createStatement();  
	int rs=state.executeUpdate(sql); 
	con.close(); 
	response.sendRedirect("goods.jsp");
}catch(Exception e){
	out.print("商品信息修改失败！！！");
	e.printStackTrace();
   } 
%> 
</body>
</html>