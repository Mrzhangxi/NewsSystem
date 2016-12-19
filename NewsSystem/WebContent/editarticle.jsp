<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../incoming/common.jsp" %>
<%@ include file="../incoming/connectdb.jsp" %>
<%@ include file="../incoming/check.jsp" %>
<%@ include file="../incoming/codefilter.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %>编辑</title>
<link href="../incoming/style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function check(form) {
		if(form.newstitle.value == "") {
			alert("请输入新闻标题");
			form.newstitle.focus();
			return false;
		}
		
		if(form.newstitle.value > 100) {
			alert("新闻标题长度应该小于50个汉字");
			form.newstitle.focus();
			return false;
		}
		
		if(form.newsbody.value == "") {
			alert("请输入新闻内容");
			form.newsbody.focus();
			return false;
		}
	}
</script>
<body>
<%
int id = (null == request.getParameter("id")?1:Integer.parseInt(request.getParameter("id")));
sql = "select * from article where id = ?";
pstemt = conn.prepareStatement(sql);
pstemt.setInt(1, id);
rs = pstemt.executeQuery();
while (rs.next()) {
%>
<table border="1" width="784" align="center" cellpadding="0" cellspacing="0">
	<form method="post" action="editarticleover.jsp?id=<%=id %>" onsubmit="return check(this)">
		<tr align="center" bgcolor="#cccccc" height="25">
			<td height="42" colspan="2">
				<font color="#ffffff">
					<font size="5" color="#ffcc00">
						<b>
							<font color="#000000">修改新闻</font>
						</b>
					</font>
					<font color="#000000" class="text">
						<b>**为必填项目</b>
					</font>
				</font>
			</td>
		</tr>
		<tr>
			<td width="30%" align="center" class="text">
				<b>新闻标题</b>
			</td>
			<td width="70%" class="text">
				<input name="newstitle" type="text" id="newstitle" size="70" maxlength="255" value=<%=rs.getString("title") %>>
				**不得超过50个汉字
			</td>
		</tr>
		<tr>
			<td height="407" align="center">
				&nbsp;<b>内容</b><br><br>
				<li class="text">请在此填写新闻的内容<br>
			</td>
			<td>
				<textarea rows="30" cols="100%" name="newsbody" wrap="virtual" class="smallarea" id="newsbody" title="请在此填写新闻的内容">
					<%=unHtml(rs.getString("body")) %>
				</textarea>
				**
			</td>
		</tr>
<%
}
%>
		<tr>
			<td height="80" colspan="2" align="center" >
				<font color="#000000">
					<input name="submit" type="submit" value="修 改">
					&nbsp;&nbsp;
					<input name="submit2" type="reset" value="清 除">
				</font>
			</td>
		</tr>
	</form>
</table>
</body>
</html>