<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#btn{
		display:inline;
	}
	div#btn button{
		background-color:rgba(0,0,0,0);
		border:0px;
	}
	div#question{
		margin-top:10%;
		margin-bottom:15%;
		font-size:40pt;
		margin-left:20%;
		margin-right:20%;
		padding:20px;
		border:3px solid gray;
		border-radius:10px;
		text-align:center;
	}
	div#question a{
		text-decoration:none;
		color:gray;
		font-weight:bold;
	}
	div#question a:hover{
		text-align:center;
		color:#eeeeee;
	}
</style>
</head>
<body>
<div id="btn">
	<button><img src="img/setting.png"></button>
</div>
<div id="question">
	<a href="question.jsp">행복 설문조사</a>
</div>
</body>
</html>