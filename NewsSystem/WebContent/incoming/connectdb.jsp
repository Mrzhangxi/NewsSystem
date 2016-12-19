<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
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