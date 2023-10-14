<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%> 
   
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

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>

<body>

<%
int gPageCurrent = request.getParameter("gPage") != null ? Integer.parseInt(request.getParameter("gPage")) : 1;
BoardDAO dao = new BoardDAO();
int giverCnt = dao.giverCnt();
int gPages = 0;
int perPage = 10;
if(giverCnt%perPage==0) {
	gPages = giverCnt/perPage;
} else {
	gPages = giverCnt/perPage +1;
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
					List<BoardVO> list = dao.giver_admin_info((gPageCurrent-1)*perPage, perPage);
					for (int i = 0; i < list.size(); i++) {
						BoardVO listt = (BoardVO) list.get(i);
						
						int num = listt.getNum();
						String title = listt.getTitle();
						String id = listt.getId();
						Date postDate = listt.getPostDate();								
					%>
					<tr>
						<td><%= num %></td>
						<td><a href="view.jsp?num=<%= num %>">
							<%= title %></a></td>
						<td><%= id %></td>
						<td><%= postDate %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div>
						<ul class="pagination pagination-lg">
							<%
								for(int gPage = 1; gPage <= gPages; gPage++) {
							%>
							<li class="page-item <%= gPage == gPageCurrent ? "button" : "" %>" onclick="movePage('gPage', <%= gPage %>, this);">
									<%= gPage %>
								</li>
							<%		
								}
							%>
						</ul>
					</div>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

</body>
</html>