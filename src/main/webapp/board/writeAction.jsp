<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="board.BoardVO" scope="page" />
<jsp:setProperty name="vo" property="title" />
<jsp:setProperty name="vo" property="content" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>게시판 글쓰기</title>
</head>
<body>
  <%
  	String id = null;	
  	if (session.getAttribute("id") != null) {
  		id = (String) session.getAttribute("id");
  		vo.setId(id);
  	}
  	if (id == null) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('로그인이 필요합니다.')");
  		//script.println("location.href = '../member/login.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	} else {
  		if (vo.getTitle() == null || vo.getContent() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('입력되지 않은 사항이 있습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				BoardDAO dao = new BoardDAO();
  				if (!dao.write(vo.getTitle(), vo.getContent(), id)) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글쓰기에 실패했습니다.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글쓰기 완료')");
  					script.println("location.href = 'list.jsp'");
  					script.println("</script>");
  				}
  			}
  	}		
  %>
</body>
</html>