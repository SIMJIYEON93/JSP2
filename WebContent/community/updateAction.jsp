<%@page import="dto.Community"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx =Integer.parseInt(request.getParameter("idx"));
int pageNo = Integer.parseInt(request.getParameter("page"));
	CommunityDao dao = CommunityDao.getInstance();
	Community bean = dao.getOne(idx);
//	out.print(dto);
request.setAttribute("page", pageNo);
	request.setAttribute("bean", bean);
	pageContext.forward("updateView.jsp");
%>


