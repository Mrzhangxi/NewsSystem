<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<%
String userid = request.getParameter("userid");
String pword = request.getParameter("password");
sql = "select * from userpassword where user_id = ? and user_password = ?";
pstemt = conn.prepareStatement(sql);
pstemt.setString(1, userid);
pstemt.setString(2, pword);
rs = pstemt.executeQuery();
if(!rs.next()) {
	String errmsg = "error1";
	response.sendRedirect("login.jsp?errmsg=" + errmsg);
	return;
}
request.getSession(true);
String chk = "true";
session.putValue("Enter", chk);
session.putValue("username", rs.getString("user_name"));
response.sendRedirect("main.jsp");
%>