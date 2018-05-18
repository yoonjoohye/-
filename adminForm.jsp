<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#admin{
		margin-left:20%;
		margin-right:20%;
	}
	a{
		text-decoration:none;
		color: gray;
		font-size:15pt;
	}
	a:hover{
		color:#eeeeee;
	}
	div#label{
		margin-bottom:50px;
		text-align:left;
		font-size:30pt;
		
		color: gray;
		border-bottom:3px solid gray;
	}
</style>
</head>
<body>
<center>
<div id="admin">
<div id="label">관리자페이지</div>
<table>
	<tr>
		<td><a href="add.jsp">질문지 수정 및  추가</a></td>
	</tr>
	<tr>
		<td><a href="confirm.jsp">건의사항</a></td>
	</tr>
	<tr>
		<td><a href="check.jsp">결과확인</a></td>
	</tr>
	<tr>
		<td><a href="logout.jsp">로그아웃 </a></td>
	</tr>
</table><br>
</div>
</center>
</body>
</html>