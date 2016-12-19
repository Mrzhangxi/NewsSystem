<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.Date"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<%@ include file="../incoming/check.jsp" %>
<%@ include file="../incoming/codefilter.jsp" %>
<meta http-equiv="refresh" content="4; url=main.jsp">
<title><%=title %>管理</title>
<link href="../incoming/style.css" rel="sytlesheet" type="text/css">
</head>
<body>
<%
try {
	String newstitle = new String(request.getParameter("newstitle").getBytes("iso8859-1"),"utf-8");
	String newsbody = new String(request.getParameter("newsbody").getBytes("iso8859-1"),"utf-8");
	Date cur_time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateString = formatter.format(cur_time);
	String adduser = (String)session.getValue("username");
	System.out.println(newstitle + "  " + newsbody + "  " + dateString + "  " + adduser);
	sql = "insert into article(title,body,adddate,adduser) value (?,?,?,?)";
	pstemt = conn.prepareStatement(sql);
	pstemt.setString(1, newstitle);
	pstemt.setString(2, toHtml(newsbody));
	pstemt.setString(3, dateString);
	pstemt.setString(4, adduser);
	pstemt.execute();
	pstemt.close();
	conn.close();//此处加一个关闭数据库操作查看效果
} catch(Exception e) {
	out.println("错误信息：" + e.getMessage());
} finally {

}
%>
<table width="381" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
	<tr height="25">
		<td width="391" align="center" bgcolor="#999999">
			<font color="red">
				<b>新闻发布成功</b>
			</font>
		</td>
	</tr>
	<tr class="text">
		<td align="center">
			<br>
			本页将在<b>3</b>秒钟后自动返回管理页面，您可以选择以下操作：
			<br>
			<br>
			<a href="main.jsp">返回首页面</a>
			<a href="addarticle.jsp">继续发布新闻</a>
		</td>
	</tr>
</table>
</body>
</html>