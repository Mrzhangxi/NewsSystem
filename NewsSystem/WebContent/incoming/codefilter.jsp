<%!//书中此处使用定义，体现了代码的健壮性。如果不使用定义，不影响在该程序中的运行
	String Replace(String str_source, String str_original, String str_new) {
		if(str_source == null || str_source == "")
			return null;
		StringBuffer sb = new StringBuffer();
		int lengOfsource = str_source.length();
		int lengOforiginal = str_original.length();
		int posstart = 0;
		int pos;
		while((pos = str_source.indexOf(str_original, posstart)) >= 0) {
			sb.append(str_source.substring(posstart, pos));
			sb.append(str_new);
			posstart = pos + lengOforiginal;//下一次开始的位置为上次截取位置+被替换文本的长度。即被替换文本后的内容
		}
		
		if(posstart < lengOfsource){
			sb.append(str_source.substring(posstart));
		}
		
		return sb.toString();
	}

	String toHtml(String s) {
		s = Replace(s, "<", "&lt;");
		s = Replace(s, ">", "&gt;");
		s = Replace(s, "&", "&amp;");
		s = Replace(s, "\t", "    ");//制表符转换伪空格？
		s = Replace(s, "\r\n", "\n");
		s = Replace(s, "\n", "<br/>");
		s = Replace(s, " ", "&nbsp");
		s = Replace(s, "'", "&#39;");
		s = Replace(s, "\\", "&#92;");
		return s;
	}
	
	String unHtml(String s) {
		s = Replace(s, "&nbsp", " ");
		s = Replace(s, "<br/>", "\n");
		return s;
	}
%>