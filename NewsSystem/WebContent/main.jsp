<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<%@ include file="../incoming/check.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %>管理</title>
<link href="../incoming/style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function del(id) {
		if(confirm("您确定要删除吗？")){
			top.location = "delarticle.jsp?id="+id;
		}
	}
</script>
<body bgcolor="#ffffff">
	<table width="500" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999">
		<tr bgcolor="cccccc">
			<td colspan="2" align="center"><font size="3" color="#ffffff"><b><font color="#000000" >系统管理后台</font></b></font></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<a href="addarticle.jsp">发布新闻</a>
				<a href="javascript:this.location.reload()">刷新</a>&nbsp;
				<a href="index.jsp">主页</a>
				<%
				sql = "select * from article";
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet _rs = ps.executeQuery();
				while(_rs.next()) {
				%>
					<div align="right"></div>
			</td>
		</tr>
		<tr>
			<td height="20">
				<div align="left"><span class="text">·</span><a href="editarticle.jsp?id=<%=_rs.getInt("id") %>"><%=_rs.getString("title") %></a></div>
			</td>
			<td align="center" width="29%">
				<a href="editarticle.jsp?id=<%=_rs.getInt("id") %>">编辑新闻</a>
				<a href="javascript:del(<%=_rs.getInt("id") %>)">删除新闻</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>