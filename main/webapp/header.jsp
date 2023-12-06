<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${contextPath}/css/header.css">

<!--          로그인 체크          -->
<%
String id = (String)session.getAttribute("id");


%>

<header>
    <!-- 홈페이지 로고 -->
        <div id="logo">
          <a href="${contextPath}/index.jsp"><img src="${contextPath}/images/Plan-it.png" alt="Plan-it" height="50px"></a>
        </div>
        
    <!-- 메뉴(내비게이션) 영역 -->
	<%
	String u_id = (String)session.getAttribute("id");
	%>
    <!-- 로그인 전 화면 -->
    <%if (u_id == null) {%>
        <nav>
          <ul id="topMenu-user">
            <li><a href="${contextPath}/member/login.jsp">로그인/회원가입</a></li>
          </ul>
          
    <!-- 로그인 후 화면 -->
	<%} else if (u_id != null) {%>
		  <ul id="topMenu-user">
            <li><a href="${contextPath}/member/logout.jsp">로그아웃</a></li>
            <li><a href="${contextPath}/member/mypage.jsp">마이페이지</a></li>
            <li><a href="${contextPath}/board/list.jsp">커뮤니티 채팅방</a></li>
          </ul>
        </nav>
    <%};%>
        
</header>