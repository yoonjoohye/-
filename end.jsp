<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("UTF-8");

String supplement=request.getParameter("supplement");


BufferedWriter writer = null;
try{
	String filePath = application.getRealPath("/WEB-INF/supplement.txt");
	writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
	writer.write(supplement+",");
	writer.flush();
}
catch(Exception e){
	out.println("���� �߻�");
}
finally{
	writer.close();
}
%>
<script>
window.onload=function(){
	alert("������ �����ּż� �����մϴ�.");
	location.href="index.jsp";
}
</script>