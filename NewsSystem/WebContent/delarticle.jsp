<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %>删除</title>
</head>
<body>
<%
try {
	int id = Integer.parseInt(request.getParameter("id"));
	sql = "delete from article where id=?";
	pstemt = conn.prepareStatement(sql);
	pstemt.setInt(1, id);
	pstemt.executeUpdate();
	response.sendRedirect("main.jsp");
} catch(Exception e) {
	out.println(e.getMessage());
} finally {
	
}
%>
</body>
</html>