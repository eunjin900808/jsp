<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file= "/include/dbcon.jsp"%>
<%
// 1001 ~ 9999
// 새로운 사원번호 가져오기
String sql = " select nvl(max(empno),1000)+1 from emp";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int empno = rs.getInt(1);

//업무목록
String sql3 = " select distinct(job) from emp where job != 'PRESIDENT' ";
ResultSet rs3 = stmt.executeQuery(sql3);

// 부서정보 목록
String sql2 = "select deptno, dname, loc from dept2 order by dname ";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);

// 매니저 목록
String sql4 = "select empno,ename from emp where job='MANAGER' or job='PRESIDENT' ";
Statement stmt4 = con.createStatement();
ResultSet rs4 = stmt4.executeQuery(sql4);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록 화면</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<script>
function fn_submit(){
	
			// 현재창.폼이름
	//let f = document.frm; 변수처리할수있음.[ex) f.empno.value == ""]
		
	if(document.frm.empno.value == ""){
		alert("사원번호를 입력해주세요.");	//알림창
		document.frm.empno.focus();	// 특정위치에 커서를 위치시킴
		return false;		// 함수의 종료
	}
	if(document.frm.empno.value.length !=4){
		alert("사원번호는 4자리로 입력해주세요.");	//알림창
		document.frm.empno.focus();	// 특정위치에 커서를 위치시킴
		return false;		// 함수의 종료
	}
	if(document.frm.ename.value == ""){
		alert("사원이름을 입력해주세요.");
		document.frm.ename.focus();
		return false;
	}
	if(document.frm.ename.value.length > 30){
		alert("사원이름은 30자를 초과할 수 없습니다.");
		document.frm.ename.focus();
		return false;
	}
	if(document.frm.hiredate.value.length != 10){
		alert("날짜를 선택해주세요.");
		document.frm.hiredate.focus();
		return false;
	}
	// 현재창의 폼을 전송한다.
	// submit() :: 전송기능의 내장함수
	document.frm.submit();
	
}
</script>
<body>

<div class="div_title">
	사원등록
</div>

<form name="frm" method="post" action="empWriteSave.jsp">

<div class="div_top_button">
<!-- return false : submit 버튼 기능의 전송기능을 업생는 세팅 -->
<!-- submit 버튼 :: 전송기능,{enter}버튼의 인식 -->
	<button type="submit" onClick="fn_submit(); return false;">저장</button>
	<button type="reset">취소</button>
	<button type="button" onClick="location='empList.jsp'">목록</button>
</div>

<table>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th><label for="empno">사원번호</label></th>
		<td><input type="number" id="empno" name="empno" class="input1" value="<%=empno %>" placeholder="사원번호" readonly autofocus></td>
		<!-- number 타입에서는 maxlength 적용 안됨 -> 자바스크립트 이용 -->
	</tr>
	<tr>
		<th><label for="ename">사원이름</label></th>
		<td><input type="text" id="ename" name="ename" class="input1" placeholder="사원이름" maxlength="30"></td>
	</tr>
	<tr>
		<th><label for="job">업무</label></th>
		<td style="text-align:left;">
			<select name="job" id="job" class="select1">
			<%
			while( rs3.next() ){
				String job = rs3.getString(1);
			%>
				<option value="<%=job %>" ><%=job %> </option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
	<tr>
		<th><label for="mgr">매니저</label></th>
		<td style="text-align:left;">
			<select name="mgr" id="mgr" class="select1">
			<%
			while(rs4.next()){
				String sno = rs4.getString(1);
				String snm = rs4.getString(2);
			%>
				<option value="<%=sno %>"><%=snm %></option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
	<tr>
		<th><label for="hiredate">입사일</label></th>
		<td><input type="date" id="hiredate" name="hiredate" class="input1"></td>
	</tr>
	<tr>
		<th><label for="sal">기본급여</label></th>
		<td><input type="number" id="sal" name="sal" class="input1" value="0"></td>
	</tr>
	<tr>
		<th><label for="comm">업무수당</label></th>
		<td><input type="number" id="comm" name="comm" class="input1" value="0"></td>
	</tr>
	<tr>
		<th><label for="deptno">부서</label></th>
		<td style ="text-align:left;">
			<select name = "deptno" id= "deptno" class="select1">
			<%
			while( rs2.next() ){
				String dno = rs2.getString(1);
				String dnm = rs2.getString(2);
				String loc = rs2.getString(3);
			%>
				<option value="<%=dno %>" > <%=dnm %> (<%=loc %>)</option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
</table>
</form>

</body>
</html>