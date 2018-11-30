<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%> 
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC"-//W3C//DTDHTML4.01Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>删除</title>
</head>
<body>
<% //获取提交参数 
try{
	request.setCharacterEncoding("utf-8");
	String goodsid=request.getParameter("goodsid");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	String sql1 = "DELETE FROM order2 WHERE goodsid ='"+goodsid+"'";
	Statement state1 = con.createStatement();  
	int rs1=state1.executeUpdate(sql1);
	if(rs1!=0)  
    {  
         out.println("<script>alert('删除成功！');</script>");  
    }  
    else  
    {  
         out.println("<script>alert('删除失败！');</script>");  
    }
	con.close(); 
}catch(Exception e){
	out.print("订单删除失败！！！");
	e.printStackTrace();
   } 
%> 
</body>
</html>