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
	String orderid=request.getParameter("orderid");
	String amount=request.getParameter("amount");
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	String sql = "insert into order2 values('"+orderid+"','"+goodsid+"','"+amount+"')";
	Statement state = con.createStatement();  
    int flag = state.executeUpdate(sql); 
    if(flag!=0)  
    {  
         out.println("<script>alert('插入成功！');</script>");  
    }  
    else  
    {  
         out.println("<script>alert('插入失败！');</script>");  
    }
	con.close(); 
}catch(Exception e){
	out.print("订单信息添加失败！！！");
	e.printStackTrace();
   }
	 
%> 
</body>
</html>