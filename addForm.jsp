<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
div#label{
		margin-bottom:50px;
		text-align:left;
		font-size:30pt;
		
		color: gray;
		border-bottom:3px solid gray;
	}
	div#add{
		margin-left:20%;
		margin-right:20%;
	}
	div#question input{
		width:200px;
		height:30px;
		border:1px solid #dddddd;
		border-radius:15px;
	}
</style>
</head>
<body>
<div id="add">
<div id="label">질문지 수정 및 추가</div>
<form id="questionForm" name="questionForm" action="edit.jsp" method="post"> 
<center>
<div id="question">
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
		<label>QUESTION.<%=i+1%></label> <input type="text" id= "question<%=i+1%>" name="question<%=i+1%>" value="<%=Array[i*6]%>"><br>
<% 
		for(int j=1; j<=5; j++){
%>
		<label>ANSWER.<%=j%></label> <input type="text" id="answer<%=i+1%>_<%=j%>" name="answer<%=i+1%>_<%=j%>" value="<%=Array[(i*6)+j] %>"><br>
<%
		}
%>
		<br>
<% 
	}
%>	
	<label>QUESTION.<%=Array.length/6+1 %></label> <input type="text" id= "question<%=Array.length/6+1 %>" name="question<%=Array.length/6+1 %>"><br>
<%

		for(int j=1; j<=5; j++){
%>
		<label>ANSWER.<%=j%></label> <input type="text" id="answer<%=Array.length/6+1%>_<%=j%>" name="answer<%=Array.length/6+1%>_<%=j%>"><br>
<%
		}
%>
	<br>
	</div>
	<input type="hidden" id="count_q" name="count_q" value="<%=(Array.length/6)+1%>">
	<input type="button" value="질문 저장" onclick="empty()">
	<input type="button" value="질문추가" onclick="add_question()"><br><br>
	
	<a href="admin.jsp"><input type="button" value="돌아가기"></a>
</center>
<br>
</form>
<script>
	var count_q=<%=Array.length/6+1%>;
	var count_a=1;
	
	function add_question(){
		count_q++;
		
		var str="";
		str+="<label>QUESTION."+count_q+"</label> <input type='text' id='question"+count_q+"' name='question"+count_q+"'><br>";
		for(var i=0; i<5; i++){
			str+="<label>ANSWER."+(count_a+i)+"</label> <input type='text' id='answer"+count_q+"_"+(count_a+i)+"' name='answer"+count_q+"_"+(count_a+i)+"'><br>";
		}
		str+="<br>";
		document.getElementById("question").innerHTML+=str;
		document.getElementById("count_q").value=count_q;
	}
	
	function empty(){
		bool=false;
		check=0;
		
		for(var i=1; i<=count_q; i++){
			if(document.getElementById("question"+i).value!=""){ 
			check++;
				for(var j=1; j<=5; j++){
					if(document.getElementById("answer"+i+"_"+j).value!=""){	
						bool=true;
						check++;
					}
				}
			}
		}
		if(check==count_q*5+count_q){
			if(bool==true){
				document.getElementById("questionForm").submit();
			}
		}
		else{
			alert("질문과 답을 입력해주세요!");
			return;
		}
	}
</script>
</div>
</body>
</html>