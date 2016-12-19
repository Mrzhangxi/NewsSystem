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
<body bgcolor="#cccccc" text=#000000 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table height="710" cellpadding="0" cellspacing="0" width="700" align="center" border="0">
		<tr>
			<td height="710" valign="top">
				<table height="66" cellpadding="0" cellspacing="0" width="775" border="0">
					<tr>
						<td colspan="4" height="66">
							<div align="right">
								<table width="774" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<th height="60" bgcolor="#ffffff">
											<font size="+6" face="隶书" color="#000000"><%=title %></font>
										</th>
									</tr>
								</table>
								<table cellpadding="0" cellspacing="0" width="774" align="center" border="0">
									<tr>
										<td bgcolor="#990033" height="5"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
				<table height="600" cellpadding="0" cellspacing="0" width="774" align="center" bgcolor="#ffffff" border="0">
					<tr align="center">
					<%
					int id = (null == request.getParameter("id"))?1:(Integer.parseInt(request.getParameter("id")));
					sql = "select * from article where id = ?";
					pstemt = conn.prepareStatement(sql);
					pstemt.setInt(1, id);
					rs = pstemt.executeQuery();
					rs.next();
					%>
						<td valign="bottom" width="13" height="600" >&nbsp ; </td>
						<td valign="top" width="749" height="600" >
							<table width="749" height="654" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="749" height="76" align="center" class="title">
										<%=rs.getString("title") %>
										<hr align="center" width="50%" noshade="noshade">
									</td>
								</tr>
								<tr>
									<td height="506" valign="top" class="body" ><%=rs.getString("body") %> </td>
								</tr>
								<tr>
									<td height="72" valign="top">&nbsp;</td>
								</tr>
							</table>
						</td>
						<td valign="top" width="12">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>