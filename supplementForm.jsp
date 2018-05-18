<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function submit(){
		if(document.getElementById("supplement").value!=""){
			alert("좋은 의견 감사합니다");
			document.getElementById("supplementform").submit();
		}
		else{
			document.getElementById("supplementform").submit();
		}
	}
</script>
<style>
	div#supplement{
		margin-left:20%;
		margin-right:20%;
	}
	div#supplement div#label{
		margin-bottom:50px;
		text-align:left;
		font-size:30pt;
		
		color:gray;
		border-bottom:3px solid gray;
	}
</style>
</head>
<body>
<center>
<div id="supplement">
<div id="label">설문지 건의사항</div>
<form id="supplementform" name="supplementform" action="end.jsp" method="post">
	<textarea id="supplement" name="supplement" rows="10" cols="100"></textarea><br><br>
	<input type="button" onclick="submit()" value="건의작성">
</form>
<br>
</div>
</center>
</body>
</html>