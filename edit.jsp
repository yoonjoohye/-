<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String count_q=request.getParameter("count_q");
	int num=Integer.parseInt(count_q);
	
	String question[]=new String[num];	
	String answer[][]=new String[num][5];
	
	for(int i=0; i<num; i++){
		question[i]=request.getParameter("question"+(i+1));
	}
	
	for(int i=0; i<num; i++){
		for(int j=0; j<5; j++){
			answer[i][j]=request.getParameter("answer"+(i+1)+"_"+(j+1));
		}
	}
	
	BufferedWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/question.txt");
		//writer = new BufferedWriter(new FileWriter(filePath,true));
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath),"utf-8"));
		for(int i=0; i<num; i++){
			writer.write(question[i]+",");
			for(int j=0; j<5; j++){
				writer.write(answer[i][j]+",");
			}
		}
		writer.flush();
	}
	catch(Exception e){
		out.println("오류 발생");
	}
	finally{
		writer.close();
	}
%>
<meta http-equiv='refresh' content='0.5; url=admin.jsp'>
</body>
</html>
</body>
</html>