<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userid = request.getParameter("userid");	// ok
String pass = request.getParameter("pass");		// ok
String gender = request.getParameter("gender");	// ok
String[] hobby = request.getParameterValues("hobby");	// 다중선택인데 request.getParameter 으로 받으면 하나만 나옴
String year = request.getParameter("year");		//ok
String content = request.getParameter("content");	//ok
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	아이디 : <%=userid %> <br>
	암호 : <%=pass %> <br>
	성별 : <%=gender %> <br>
	
	취미 : <%
			if(hobby != null){				
				for(int i=0; i<hobby.length;i++){
					out.print(hobby[i]+ " ");
				}
			}else{
				out.print("선택 내용이 없습니다.");
			}
		  %>
		<br>
	
	년도 : <%=year %> <br>
	내용 : <%=content %> <br>
	
</body>
</html>