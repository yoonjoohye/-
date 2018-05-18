<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String count=request.getParameter("count");
	int num=Integer.parseInt(count);//6
	
	String result[]=new String[num];
	int x=1;
	do{
		String[] check = new String[1];
		for(int j=0; j<5; j++){
			check=request.getParameterValues("check"+x);
		}
		//out.println(check[0]);
		result[x-1]=check[0];
		x++;
		
	}while(x<=num);
	
	out.println("제출 중...");
	
	BufferedWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/result.txt");
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
		for(int i=0; i<num; i++){
			writer.write(result[i]+",");
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
<%
	request.setCharacterEncoding("UTF-8");
	BufferedReader reader = null;
	String a="";
	String tmp = "";
	
	try{
		String filePath = application.getRealPath("/WEB-INF/question.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			
			tmp += a;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}

	BufferedReader reader1 = null;
	String a1="";
	String tmp1 = "";
	
	try{
		String filePath1 = application.getRealPath("/WEB-INF/result.txt");
		reader1=new BufferedReader(new InputStreamReader(new FileInputStream(filePath1),"UTF-8"));
		while(true){
			a1 = reader1.readLine();
			if(a1==null)break;
			
			tmp1 += a1;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	out.println("<br>");
	String[] Array = tmp.split(",");//question
	String[] Array1 = tmp1.split(",");//result
	
	String answer[][]=new String[Array1.length/num][num];//result
	String panel[][]=new String[Array.length/6][5];//question
	
	for(int i=0; i<Array1.length/num; i++){
		for(int j=0; j<num; j++){
			//out.println(Array1[i*num+j]);
			answer[i][j]=Array1[i*num+j];
		}
		//out.println("<br>");
	}
	//out.println("<br>");
	
	for(int i=0; i<Array.length/6; i++){
		for(int j=1; j<=5; j++){
			//out.println(Array[i*6+j]);
			panel[i][j-1]=Array[i*6+j];
		}
		//out.println("<br>");
	}
	//out.println("<br>");
	

	int c=0;
	int cnt[][]=new int[Array.length/6][5];
	
	for(int k=0; k<Array.length/6; k++){//질문
		for(int l=0; l<5; l++){//답
			c=0;
			for(int i=0; i<Array1.length/num; i++){//사람들이 설문한 수
				for(int j=0; j<num; j++){//설문지개수
					 
					if(panel[k][l].equals(answer[i][j])){
						c+=1;
						cnt[k][l]=c;
					}
					else{
						cnt[k][l]=c;
					}
				}
			}
		}
	}
%>
<%
	BufferedWriter writer5 = null;
	try{
		String filePath5 = application.getRealPath("/WEB-INF/check.txt");
		writer5 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath5),"utf-8"));
		for(int k=0; k<Array.length/6; k++){//질문
			for(int l=0; l<5; l++){
				writer5.write(panel[k][l]+","+cnt[k][l]+",");
			}
		}
		writer5.flush();
	}
	catch(Exception e){
		out.println("오류 발생");
	}
	finally{
		writer5.close();
	}
%>
<meta http-equiv='refresh' content='0.5; url=supplement.jsp'>
</body>
</html>