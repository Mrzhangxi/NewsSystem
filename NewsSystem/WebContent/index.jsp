<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incoming/common.jsp" %>
<%@ include file="incoming/connectdb.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
</head>
<link href="incoming/style.css" rel="stylesheet" type="text/css" >
<style type="text/css">
body{
	background-color: #ffffff;
}
#table{
	background-color: #dddddd;
	width: 438px;
	border-width: 1px;
	border-color:#999999;
	border-collapse:collapse;
	border-style:solid;
	margin: auto;
	text-align: center;
}
#tr{
	background-color: #cccccc;
}
</style>
<body>
	<table id="table">
		<tr id="tr">
			<td height="38" align="center" bgcolor="#cccccc">
				<font size="+6" face="隶书" color="990000"><%=title %></font>
				<font size="3" color="#ffffff"><b></b></font>
			</td>
		</tr>
		<tr align="center">
			
		</tr>
		<tr>
			<td height="28">
				<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr >
					<%
						sql = "select * from article";
						pstemt = conn.prepareStatement(sql);
						rs = pstemt.executeQuery();
						while(rs.next()){
					%>
						<td width="11%" height="20" align="center"><div align="center"><span class="text">·</span></div></td>
						<td width="86%"><a href="article.jsp?id=<%=rs.getInt("id") %>" target="_blank"><%=rs.getString("title") %></a></td>
					</tr>
					<%} %>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>