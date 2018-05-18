<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>

div#check{
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
	div#check ul{ 
		margin:0 50px 0 50px; 
		padding:1px 0 0 0; 
		border:1px solid #ddd; 
		border-top:0;
		border-right:0; 
		font-size:11px; 
		font-family:Tahoma, Geneva, sans-serif; 
		list-style:none;
	}
	 div#check li{ 
	 	position:relative; 
	 	margin:10px 0; 
	 	white-space:nowrap; 
	 	vertical-align:top;
	 }
	.gTerm{ 
		position:absolute; 
		width:40px; 
		top:0; 
		left:-50px; 
		line-height:20px; 
		text-align:right; 
		color:#767676; 
		font-weight:bold;
	}
	.gBar{ 
		position:relative; 
		display:inline-block; 
		height:20px; 
		border:1px solid #ccc; 
		border-left:0; 
		background:#e9e9e9;
	}
	.gBar span{ 
		position:absolute; 
		width:40px; 
		line-height:20px; 
		top:0; 
		right:-50px; 
		color:#767676;
	}
</style>
</head>
<body>
<div id="check">
<div id="label">결과보기</div>

<%
try{
	/*질문 추출*/
	request.setCharacterEncoding("UTF-8");
	BufferedReader reader1 = null;
	
	String a1="";
	String tmp1 = "";
	
	try{
		String filePath1 = application.getRealPath("/WEB-INF/question.txt");
		reader1=new BufferedReader(new InputStreamReader(new FileInputStream(filePath1),"UTF-8"));
		while(true){
			a1 = reader1.readLine();
			if(a1==null)break;
			
			tmp1 += a1;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] Array1 = tmp1.split(",");

	/*답,카운트 추출*/
	BufferedReader reader = null;
	String a="";
	String tmp = "";
	
	try{
		String filePath = application.getRealPath("/WEB-INF/check.txt");
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
	
	String []answer=new String[Array.length/2];
	int []count=new int[Array.length/2];
	int c_a=0;
	int c_c=0;
	
	
	for(int i=0; i<Array.length; i++){
		if(i%2==1){
			count[c_a]=Integer.parseInt(Array[i]);
			c_a++;
		}
		else{
			answer[c_c]=Array[i];
			c_c++;
		}
		
	}
	
for(int i=0; i<Array1.length/6; i++){
%>
<h3><%=Array1[i*6]%></h3>
<div class="g<%=i%>">
	<ul>
	<%for(int j=0; j<5; j++){%>
		<li><span class="gTerm"><%=answer[i*5+j]%></span><span class="gBar" style="width:<%=count[i*5+j]%>%"><span><%=count[i*5+j]%>명</span></span></li>
	<%}%>
	</ul>
</div>
<%}
}catch(Exception e){
	out.println("정보가 없습니다.<br>"); 
}%>
<br>
<center>
<a href="admin.jsp"><input type="button" value="돌아가기"></a>
</center>
<br>
</div>
</body>
</html>