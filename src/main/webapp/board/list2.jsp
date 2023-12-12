<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>

<title>커뮤니티 게시판</title>
</head>

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>

<body>
	<div id="container">
	<%@ include file="/header.jsp"%>
	<%
		//String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		int pageNumber = 1; // 기본 페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					request.setCharacterEncoding("utf-8"); 
	
					BoardDAO dao = new BoardDAO();
					List<BoardVO> list = dao.getList2(pageNumber);

					for(int i=0; i<list.size(); i++) {
						BoardVO listvo = (BoardVO) list.get(i);
	
						int num = listvo.getNum();
						String title = listvo.getTitle();
						id = listvo.getId();
						Date postDate = listvo.getPostDate();
		 			%>
					<tr>
						<td><%= num %></td>
						<td><a href="view.jsp?num=<%= num %>">
							<%= title.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> %></a></td>
						<td><%= id %></td>
						<td><%= postDate %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if (dao.nextPage(pageNumber + 1)) {
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>	
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	</div>
</body>
</html>