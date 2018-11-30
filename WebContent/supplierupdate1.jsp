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
	String supplierid=request.getParameter("supplierid");
	String supplierid1=request.getParameter("supplierid1");
	String name=request.getParameter("name");
	String linkman=request.getParameter("linkman");
	String contact=request.getParameter("contact");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String postalcode=request.getParameter("postalcode");
	String bank=request.getParameter("bank");
	String account=request.getParameter("account");
	//数据转换：字符串（数字）转整型//利用jdbc完成数据库插入操作 
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	String sql = "update supplier set supplierid='"+supplierid+"',name='"+name+"',linkman='"+linkman+"',contact='"+contact+"',phone='"+phone+"',address='"+address+"',postalcode='"+postalcode+"',bank='"+bank+"',account='"+account+"' where supplierid='"+supplierid1+"'";
	Statement state = con.createStatement();  
	int rs=state.executeUpdate(sql); 
	con.close(); 
	response.sendRedirect("supplier.jsp");
}catch(Exception e){
	out.print("供应商信息修改失败！！！");
	e.printStackTrace();
   } 
%> 
</body>
</html>