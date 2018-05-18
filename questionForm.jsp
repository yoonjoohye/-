<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<style>
	div#survey{
		margin-left:20%;
		margin-right:20%;
	}
	div#label{
		margin-bottom:50px;
		text-align:left;
		font-size:30pt;
		
		color:gray;
		border-bottom:3px solid gray;
	}
</style>
<body>
<div id="survey">
<div id="label">설문하기</div>
<center>
<form id="surveyform" name="surveyform" action="result.jsp" method="post">
<div>
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
%>
<%
	String[] Array = tmp.split(",");
	for(int i=0; i<Array.length/6; i++){
%>
		<h3>Q<%=i+1%>. <%=Array[i*6]+"\n"%></h3>
<% 
		for(int j=1; j<=5; j++){
%>		
		<input type="radio" name="check<%=i+1%>" id="check<%=i+1%>_<%=j%>" onClick="" value="<%=Array[(i*6)+j] %>"><%=Array[(i*6)+j] %><br> 
<%
		}
		out.println("<br>");
	}
%>
		<input type="hidden" name="count" id="count" value="<%=Array.length/6 %>">
<script>
	function survey(){
		bool=false;
		cnt=1;
		check=1;
		count=<%=Array.length/6+1%>;
	
		do{
			for(var i=0; i<5; i++){
				var chk_radio = document.getElementsByName("check"+cnt);		
			}
			for(var j=0; j<chk_radio.length; j++){
				if(chk_radio[j].checked==true){
					bool=true;
					check++;
					//break;
				}
			}
			cnt++;
		}while(cnt<=count);
		if(check==count){
			if(bool==true){
				document.getElementById("surveyform").submit();
			}
		}
		else{
			alert("질문에 체크해주세요!");
			return;
		}
	}
</script>
<input type="button" value="설문완료" onclick="survey()">
<a href="index.jsp"><input type="button" value="돌아가기"></a>
</div>
</form>
</center>
</div>
<br>
</body>
</html>