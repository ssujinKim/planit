<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>커뮤니티 게시판</title>
</head>
<body>
	<div class="container">
	<%@ include file="/header.jsp"%>
	
	<%
  	id = null;
  	if (session.getAttribute("id") != null) {
  		id = (String) session.getAttribute("id");
  	}
  	int num = 0;
  	if (request.getParameter("num") != null) {
  		num = Integer.parseInt(request.getParameter("num"));
  	}
  	if (num == 0) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('유효하지 않는 글입니다.')");
  		script.println("location.href = 'list.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	}
  	BoardVO vo = new BoardDAO().getContent(num);
  	%>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%= vo.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= vo.getId() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= vo.getPostDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="list.jsp" class="btn btn-primary">목록</a>
			<%
				if (id != null && id.equals(vo.getId())) {
			%>
					<a href="update.jsp?num=<%= num %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?num=<%= num %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>