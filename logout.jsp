<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%session.invalidate(); %>
<script>
window.onload=function(){
	alert("로그아웃 되었습니다.");
	location.href="index.jsp";
}
</script>