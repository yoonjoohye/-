<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#adminLogin{
		margin-top:100px;
		margin-bottom:100px;
		margin-left:20%;
		margin-right:20%;
		font-weight:bold;
	}
	div#adminLogin div#label{
		margin-bottom:50px;
		text-align:left;
		font-size:15pt;
		
		color:white;
		border-bottom:3px solid white;
	}
	::placeholder{
		color:white;
	}
	div#adminLogin input{
		border:1px solid white;
		border-radius:5px;
		background-color:rgba(0,0,0,0);
		color:white;
		width:300px;
		height:50px;
		font-size:10pt;
	}
	div#adminLogin input[type="button"]{
		background-color:white;
		color:black;
		margin-bottom:50px;
	}
	div#adminLogin input[type="button"]:hover{
		background-color:#eeeeee;
		border-color:white;
		color:white;
	}
</style>
<script>
	var cnt=0;
	function check(){
		
		if(form.id.value=="yoon"&&form.pw.value=="1234"){
			<%session.setAttribute("id", "yoon");%>
			document.getElementById("form").submit();
		}
		else{
			alert("아이디와 비밀번호를 확인 바랍니다");
			cnt++;
			if(cnt>3){
				alert(cnt+"시도!");
			}
			return;
		}
	}
</script>
</head>
<body>
<div id="adminLogin">
	<center>
	<div id="label">관리자 로그인</div>
	<form name="form" id="form" action="admin.jsp" method="post">
		<table align="center">
			<tr align="center">
				<td><input type="text" name="id" id="id" placeholder="아이디"></td>
			</tr>
			<tr align="center">
				<td><input type="password" name="pw" id="pw" placeholder="패스워드"></td>
			</tr>
			<tr align="center">
				<td><input type="button" onclick="check()" value="로그인"></td>
			</tr>
		</table>
	</body>
	</form>
	</center>
</div>
</html>