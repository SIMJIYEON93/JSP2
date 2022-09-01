<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>http 프로토콜은 stateless(상태정보 유지안됨), 비연결<br>
	->웹서버와 브라우저 사이의 연결정보를 저장하는 바법을 사용합니다.<br>
	->request 를 통해서 브라우저의 세션 ID가 부여되고 그 값으로 구별.	<br>
	->로그인 기능 구현에 활용합니다.<br>
	->톰캣은 이름 JSESSIONID 값을 만듭니다.<br>
	->세션 유효 시간은 서버에서 설정합니다. web.xml(모든 프로젝트에 적용) 확인<br>
	-> 프로젝트 web.xml 은 해당 프로젝트에만 적용 <br>
		:변경 방법 1).session-config로 유효시간 바꿀 수 있습니다.(단위:분)<br>
		:2).소스코드에서 메소드 실행해서 바꿀 수 있습니다.(단위:초)<br>
	</div>
	<%
	String id = session.getId(); //JSESSIONID
	out.print(id); 
	out.print("<br>");
	
	long start = session.getCreationTime(); //세션이 생성된 시간 - 처음 요청을 보낸 시간
	out.print(start); //시간이 long일 때는 1970년 1월1일을 시작으로 ms 단뒤
	out.print("<br>");
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	out.print("세션 생성시간 : " + df.format(start));
	
	out.print("<br>");
	long exp = session.getMaxInactiveInterval();
	out.print("세션 유효 시간 : "+ exp + "초,"+(exp/60)+ "분");
	out.print("<br>");
//	session.setMaxInactiveInterval(60); //web.xml에서 변경하고 실행할 때는 주석처리 하세요.
	//마지막 session 접근시간
	long last = session.getLastAccessedTime(); //같은 세션 ID로 요청한 최근 시간
	out.print("최근 접근 시간 : "+ df.format(last));
	%>

</body>
</html>