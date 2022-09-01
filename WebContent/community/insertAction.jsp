<%@page import="dao.CommunityDao"%>
<%@page import="dto.Community"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//테이블 insert
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();
	Community dto = new Community();
	dto.setName(name);
	dto.setPassword(password);
	dto.setSubject(subject);
	dto.setContent(content);
//	out.print(dto);   //테스트용.
	CommunityDao dao = CommunityDao.getInstance();
	dao.insert(dto);
	response.sendRedirect("listAction.jsp");
%>

