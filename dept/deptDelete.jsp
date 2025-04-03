<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String url = "jdbc:oracle:thin:@//127.0.0.1:1523/orcl7";
    String username = "c##java";
    String userpass = "1234";

    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection(url,username,userpass);
    Statement stmt = con.createStatement();      

String deptno = request.getParameter("deptno");

String sql = "delete from dept2 where deptno='"+deptno+"'";

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("삭제완료!!");
	location = "deptList.jsp";
	</script>
<%	
}else{
%>
	<script>
	alert("삭제실패!!");
	location = "deptList.jsp";
	</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>