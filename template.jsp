<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0px;
	}
	#login{
		position:absolute;
		left:30%;
	 	top:20%;
	 	width:750px;
	  	height:500px;
	  	background-color:rgba(0,0,0,0.5);
	  	z-index:2;
	}
	#content{
		position:relative;
		width:100%;
		height:100%;
		z-index:1;
	}
	#footer{
		position:relative;
		width: 100%;
		bottom: 0;
		clear:both;
		padding:20px;
		color: white;
		background-color:rgba(0,0,0,0.5);
	}
	input[type="button"]{
		width:150px;
		height:50px;
		background-color:gray;
		color:white;
		border:0px;
	}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		$("#login").hide();
		$("#btn").click(function(){
			$("#login").toggle("slow");
		});
	});
</script>
</head>
<body>
<%
	String content=request.getParameter("content");
%>
<div id="login">
	<jsp:include page="login.jsp"/>
</div>
<div id="content">
	<jsp:include page="<%=content%>"/>
</div>
<div id="footer">
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>