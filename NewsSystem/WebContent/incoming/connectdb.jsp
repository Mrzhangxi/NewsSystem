<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/news";
	String user = "root";
	String password = "";
	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement pstemt;
	ResultSet rs;
	String sql;
	String title = "网站新闻管理系统";
%>