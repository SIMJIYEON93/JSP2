<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
int pageNo = Integer.parseInt(request.getParameter("page"));	
String password = request.getParameter("password");
	CommunityDao dao = CommunityDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password", password);
	
	int n = dao.delete(map);  //주요 실행 메소드
//	out.print(n);
	out.print("<script>");
	String message=null;
	String href=null;
	if(n==1){  //정상 delete 실행
		message ="글삭제 되었습니다.";
		href="listAction.jsp?page"+pageNo;
	}else {  //n=0 : password 가 틀릴때
		message ="글 비밀번호가 틀립니다.";
		href="detailAction.jsp?page="+pageNo+"&idx"+idx;
	}
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>");
%>

<!-- 


 -->
