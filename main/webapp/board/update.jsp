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
<title>글 수정하기</title>
</head>
<body>
	<div class="container">
	<%@ include file="/header.jsp"%>
	<%
		id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		if (id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if (num == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		}
		BoardVO vo = new BoardDAO().getContent(num);
		if (!id.equals(vo.getId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		}
	%>
		<div class="row">
			<form method="post" action="updateAction.jsp?num=<%= num %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" 
								maxlength="50" value="<%= vo.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" 
								maxlength="2048" style="height: 350px;"><%= vo.getContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글 수정">
			</form>
		</div>
	</div>
</body>
</html>