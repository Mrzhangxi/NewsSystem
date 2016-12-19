<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(newstitle + "  " + newsbody);
	sql = "update article set title=?, body=? where id=?";
	pstemt = conn.prepareStatement(sql);
	pstemt.setString(1, newstitle);
	pstemt.setString(2, toHtml(newsbody));
	pstemt.setInt(3, id);
	pstemt.executeUpdate();
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