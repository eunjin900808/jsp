<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 	<%@ include file="/include/dbcon.jsp" %> 
    <%
    String dno = request.getParameter("deptno");
    String dnm = request.getParameter("dname");
    String loc = request.getParameter("loc");
    
    if(dno == null || dno.equals("") || dnm == null || dnm.equals("") ){
 	%>
		<script>
    	alert("입력 데이터 확인을 해주세요!!");
    	history.back();
    	</script>

    <%	
    return;	//메소드 종료; 프로그램종료;
    }
    %>
    
    <%
    String sql = "insert into dept2(deptno,dname,loc)"
    			+" values('"+dno+"','"+dnm+"','"+loc+"')";
    
    int result = stmt.executeUpdate(sql);
    if(result == 1) {
    %>
    	<script>
    	alert("저장완료");			//알림창,경고창,팝업창
    	location="deptList.jsp";	//목록화면으로 이동
    	</script>
    
    <%
    }else{
    %>
    	<script>
    	alert("저장실패!");	//알림창, 팝업창
    	history.back();		//이전 페이지로 이동
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