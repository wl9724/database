<%@ include file="inc.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
//get parameters
String username = request.getParameter("username");
String password = request.getParameter("password");

//check null
if (username == null || password == null) {
	response.sendRedirect("login.jsp");
}

//validate
boolean isValid = false;
String sql = "select * from users where name='"+username+"' and pass='"+password+"'";
try {
	Class.forName(drv).newInstance();
	Connection conn = DriverManager.getConnection(url, usr, pwd);
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery(sql);
	if(rs.next())isValid = true;
	rs.close();
	stm.close();
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println(e);
} finally {
}

if (isValid) {
	session.setAttribute("username", username);
	String sql1="select * from users where name='"+username+"'";
	Class.forName("com.mysql.jdbc.Driver");//java的反射
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8","root",""); 
	Statement stm1 = con1.createStatement();
	ResultSet rs1= stm1.executeQuery(sql);
	rs1.next();
	String username1=rs1.getString("power");
	if(username1.equals("admin")){
		response.sendRedirect("admin.jsp");
	}
	else if(username1.equals("buyer")){
		response.sendRedirect("buyer.jsp");
	}
	else if(username1.equals("manage")){
		response.sendRedirect("manage.jsp");
	}
} else {
	response.sendRedirect("login.jsp");
}
%>