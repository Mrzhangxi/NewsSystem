<%
	if((String)session.getValue("Enter") != "true"){//是否可以直接布尔值？
		String errmsg = "error2";//作为文本，有利于下一步发送
		response.sendRedirect("login.jsp?errmsg=" + errmsg);
	}
%>