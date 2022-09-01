<%@page import="dao.CommunityDao"%>
<%@page import="dto.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정 버튼-> 내용 변경 -> 저장버튼 으로 실행됩니다.
	request.setCharacterEncoding("UTF-8");
	int pageNo = Integer.parseInt(request.getParameter("page"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
//	String password = request.getParameter("password");
	String content = request.getParameter("content");
//	String ip = request.getRemoteAddr();
	Community dto = new Community();
//	dto.setIp(ip);
//	dto.setPassword(password);
	dto.setIdx(idx);
	dto.setSubject(subject);
	dto.setContent(content);
	CommunityDao dao = CommunityDao.getInstance();
	dao.update(dto);
//	response.sendRedirect("updateAction.jsp?update=&idx="+idx);
	response.sendRedirect("updateAction.jsp?idx="+idx+"&page="+pageNo);
%>
