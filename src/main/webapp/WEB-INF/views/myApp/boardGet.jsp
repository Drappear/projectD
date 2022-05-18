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
			$("#btnForm").attr("action", "${appRoot}/board/list");
			$("#btnForm").submit();				
		});
		$("#btnBoardEdit").click(function() {
			$("#btnForm").attr("action", "${appRoot}/board/edit");
			$("#btnForm").submit();				
		});
		$("#btnBoardDelete").click(function() {
			$("#btnForm").attr("action", "${appRoot}/board/delete");
			$("#btnForm").submit();				
		});
		$(".reply-edit-btn").click(function() {
			const replyId = $(this).attr("data-reply-id");
			const editBtn = "#reply-edit-btn" + replyId;
			const modBtn = "#reply-modify-btn" + replyId;
			const replyDisplay = "#reply-content-display" + replyId;
			const replyEditor = "#reply-content-editor" + replyId;
			$(replyDisplay).hide();
			$(editBtn).hide();
			$(replyEditor).show();
			$(modBtn).show();
		});
		$(".reply-modify-btn").click(function(e) {
			e.preventDefault();
			const replyId = $(this).attr("data-reply-id");
			const replyFormId = "#reply-form" + replyId;
			if(confirm("댓글을 수정하시겠습니까?")) {
				$(replyFormId).attr("action", "${appRoot}/reply/update");
				$(replyFormId).submit();
			}
		});
		$(".reply-delete-btn").click(function() {
			const replyId = $(this).attr("data-reply-id");
			const replyFormId = "#reply-form" + replyId;
			if(confirm("댓글을 삭제하시겠습니까?")) {
				$(replyFormId).attr("action", "${appRoot}/reply/delete");
				$(replyFormId).submit();
			};
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
							<h3>${board.id }번게시물</h3>
							<input class="form-control" type="text" name="title"
								maxlength="255" placeholder="제목을 입력해주세요" value="${board.title }" readonly="readonly"/>

							<br />

							<textarea class="form-control" name="body" style="height: 540px" readonly="readonly">${board.body }</textarea>
							<div class="submit-button-group">
								<form action="" id="btnForm" method="post">
									<input type="hidden" name="id" value="${board.id }" />
									<input type="hidden" name="title" value="${board.title }" />
									<input type="hidden" name="body" value="${board.body }" />
									<button type="submit" id="btnBoardList"><i class="fa-solid fa-list"></i> 목록</button>
									<button type="submit" id="btnBoardEdit"><i class="fa-solid fa-wrench"></i> 수정</button>
									<button type="submit" id="btnBoardDelete"><i class="fa-solid fa-trash-can"> 삭제</i></button>
								</form>
							</div>
							<hr />
							<div class="row" style="margin-bottom: 30px">
								<div>댓글 입력</div>
								<form action="${appRoot }/reply/add" method="post">
									<input type="hidden" name="boardId" value="${board.id }" />
									<input class="form-control" type="text" name="content"
										style="display:inline-block;" />
									<button style="float: right"><i class="fa-solid fa-comment-dots"></i> 등록</button>
								</form>
							</div>
							<hr />
							<div class="row">
								<ul class="list-group" id="reply-list">
									<c:forEach items="${replyList }" var="reply">
										<li class="list-group-item" id="reply-list-item">										
											<div class="d-flex justify-content-between" id="reply-content-display${reply.id }">
												<span id="reply-content" style="display:inline-block; width:70%"> ${reply.content } </span>
												<span id="reply-inserted"> ${reply.difInserted } </span>
											</div>
											<span id="reply-content-editor${reply.id }"	style="display: none">
												<form id="reply-form${reply.id }" action="" method="post">
													<input type="hidden" name="boardId" value="${board.id }" />
													<input type="hidden" name="id" value="${reply.id }" />
													<input class="form-control" type="text" name="content"
														value="${reply.content }" style="width: 85%; float: left" />
												</form>
											</span>
											<span class="btn-group" style="float: right">
												<button class="reply-modify-btn" id="reply-modify-btn${reply.id }" style="display: none"data-reply-id="${reply.id }"><i class="fa-solid fa-check-to-slot"></i> 완료</button>
												<button class="reply-edit-btn" id="reply-edit-btn${reply.id }" data-reply-id="${reply.id }"><i class="fa-solid fa-wrench"></i> 수정</button>
												<button class="reply-delete-btn" id="reply-delete-btn${reply.id }" data-reply-id="${reply.id }"><i class="fa-solid fa-trash-can"></i> 삭제</button>
											</span>
										</li>
									</c:forEach>
								</ul>
							</div>
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