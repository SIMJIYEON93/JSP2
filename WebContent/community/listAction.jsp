<%@page import="java.time.LocalDate"%>
<%@page import="dto.PageDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Community"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비지니스 로직을 처리하는 jsp 파일
	CommunityDao dao = CommunityDao.getInstance();
	//페이지 번호는 파라미터로 전달됩니다.
	int pageNo;
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));   //page=1,2,3,4,.....
	int pageSize =15; //ui로 변경하도록 구현할 수 있습니다.
//	int startNo=(pageNo-1)*pageSize;
	
PageDto pageDto =new PageDto(pageNo,dao.getCount(),pageSize); //페이지처리에 필요한객체((값) 생성)

	Map<String,Integer> map = new HashMap<>();
	map.put("pageSize",pageSize);
	map.put("startNo",pageDto.getStartNo());
	List<Community> list = dao.getList(map);
	
	
	request.setAttribute("today", LocalDate.now());
	request.setAttribute("pageDto", pageDto);
	request.setAttribute("list", list);
	pageContext.forward("listView.jsp");
//	out.print(list);
%>