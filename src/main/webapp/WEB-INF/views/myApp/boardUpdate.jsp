<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dpr" tagdir="/WEB-INF/tags/myBoard" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myBoard.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function() {
		$("#btnBoardList").click(function() {
			$("#updateForm").attr("action", "${appRoot }/board/list");
			$("#updateForm").submit();				
		});
		$("#btnBoardUpdate").click(function(e) {
			e.preventDefault();
			if(confirm("수정하시겠습니까?")) {
				$("#updateForm").attr("action", "${appRoot }/board/update");				
				$("#updateForm").submit();				
			}
		});
		$("#btnBoardDelete").click(function(e) {
			e.preventDefault();
			if(confirm("삭제하시겠습니까?")) {
				$("#updateForm").attr("action", "${appRoot }/board/delete");
				$("#updateForm").submit();				
			}
		});
	});
</script>
<body>
	<div class="container-wrapper">
		<header class="main-header">
			<dpr:navBar></dpr:navBar>
		</header>
		<div class="content-container">
			<div class="left-side">
				<dpr:sideBar></dpr:sideBar>
			</div>
			<div class="main-content">
				<section class="main-con-sec1">
					<article class="main-con-sec1-art1">
						<h3>${board.id }번게시물수정</h3>
						<form id="updateForm" action="" method="post">
							<input type="hidden" name="id" value="${board.id }" />
							<input class="form-control" type="text" name="title"
								maxlength="255" placeholder="제목을 입력해주세요" value="${board.title }" />

							<br />

							<textarea class="form-control" name="body" style="height: 540px">${board.body }</textarea>
							<div class="submit-button-group">
								<button type="submit" id="btnBoardList"><i class="fa-solid fa-list"></i>목록</button> 
								<button type="submit" id="btnBoardUpdate"><i class="fa-solid fa-check-to-slot"></i>수정완료</button> 
								<button type="submit" id="btnBoardDelete"><i class="fa-solid fa-trash-can"></i>삭제</button>
							</div>
						</form>
					</article>
				</section>
			</div>
		</div>
		<footer class="main-footer">
			<dpr:footer></dpr:footer>
		</footer>
	</div>
</body>
</html>