<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.ResultSetMetaData"%>
<%
String drv = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/shujuku?useUnicode=true&characterEncoding=UTF-8";
String usr = "root";
String pwd = "";
%>
