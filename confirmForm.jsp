<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div#confirm{
	margin-left:20%;
	margin-right:20%;
}
div#label{
	margin-bottom:50px;
	text-align:left;
	font-size:30pt;
	color: gray;
	border-bottom:3px solid gray;
}
div#confirm table{
	border-collapse: collapse;
	width:100%;
	border:2px solid #eeeeee;
	color:gray;
}
div#confirm table th{
	background-color:#eeeeee;
}
</style>
</head>
<body>
<div id="confirm">
<div id="label">건의사항</div>
<%
	request.setCharacterEncoding("UTF-8");

	BufferedReader reader = null;
	String a="";
	String tmp = "";
	
	try{
		String filePath = application.getRealPath("/WEB-INF/supplement.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			
			tmp += a;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] Array = tmp.split(",");
	if(a!=""){
%>
<center>
	<table border>
	<tr>
		<th>번호</th>
		<th>내용</th>
	</tr>
	<tr>
		<td>1</td>
		<td><font color="blue">(공지사항)건의사항입니다!</font></td>
	</tr>
<%
		for(int i=1; i<=Array.length; i++){
%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=Array[i-1]+"\n"%></td>
		</tr>
<% 
		}
	}
	else{
		out.println("건의사항이 없습니다.");
	}
%>
</table>
<br>
<a href="admin.jsp"><input type="button" value="돌아가기"></a>
</center>
<br>
</div>
</body>
</html>