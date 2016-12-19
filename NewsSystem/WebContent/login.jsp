<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<%
String errmsg = request.getParameter("errmsg");
request.getSession(true);//为什么要true？
String chk = "false";
session.putValue("Enter", chk);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %>管理员登录</title>
</head>
<script type="text/javascript">
function checkdata() {
	if(form.userid.value.length<1 || form.userid.value.length>15) {
		alert("请输入正确的用户名");
		return false;
	}
	if(form.password.value.length<1 || form.password.value.length>15) {
		alert("请输入正确的登录密码");
		return false;
	}
}
</script>
<body bgcolor="#ffffff">
	<form action="chklogin.jsp" name="form" method="post" onsubmit="return checkdata()">
		<table width="350" height="151" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr bgcolor="#6699cc" >
				<td width="20%" height="28"> &nbsp</td>
				<td width="49%" align="center" ><font size="2">管理员登录</font></td>
				<td width="31%">&nbsp</td>
			</tr>
			<tr bgcolor="#6699cc">
				<td height="26" align="right"><font size="2">用户名：</font></td>
				<td><input name="userid" type="text" id="userid"></td>
				<td rowspan="2" ><input type="submit" name="submit" value="登录"></td>
			</tr>
			<tr bgcolor="#6699cc">
				<td height="26" align="right"><font size="2">密&nbsp;&nbsp;码</font></td>
				<td ><input name="password" type="password" id="password"></td>
			</tr>
			<tr bgcolor="#6699cc" class="depfont">
				<td height="31" colspan="3" align="center">
					<font size="2" color="#cc3333">
					<%
					if(errmsg != null && errmsg.equals("error1")) {
						out.print("您输入用户名或者密码不正确！请重新输入！");
					} else if(errmsg != null && errmsg.equals("error2")) {
						out.print("请先登录!");
					}
					%>
					</font>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>