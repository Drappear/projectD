<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	<div class="row" id="header">
		<div class="col">head</div>
	</div>
	<div class="container" style="float:left; width:100%">
		<div class="row">
			<div class="col-1" id="left" style="float:left">left</div>
			
  			<div class="col-10" id="content" style="float:right">
  				<h3>${board.id }번 게시물</h3>
  				<div class="row" style="border:1px solid; padding:5px;">
  					${board.title }
  				</div>
  				
  				<br />
  				
  				<div class="row" style="border:1px solid; padding:5px; min-height:500px;">
  					${board.body }
  				</div>
  				<div style="margin:30px 0px; display:flex; justify-content:center">
  					<form action="" id="btnForm" method="post">
	  					<input type="hidden" name="id" value="${board.id }"/>
	  					<input type="hidden" name="title" value="${board.title }"/>
	  					<input type="hidden" name="body" value="${board.body }"/>
	  					<button type="submit" id="btnBoardList">목록</button>
	  					<button type="submit" id="btnBoardEdit">수정</button>
	  					<button type="submit" id="btnBoardDelete">삭제</button>
  					</form>
  				</div>
  				<hr />
  				<div class="row" style="margin-bottom:30px">
  					댓글
  					<form action="${appRoot }/reply/add" method="post">
  						<input type="hidden" name="boardId" value="${board.id }"/>
	  					<input class="form-control" type="text" name="content" style="width:85%; float:left"/><button style="float:right">등록</button>
  					</form>
  				</div>
  				<div class="row">
  					<ul class="list-group">
	  					<c:forEach items="${replyList }" var="reply">
	  						<li class="list-group-item">
	  							<span id="reply-content-display${reply.id }">
  									<span class="reply-content">
										${reply.content }  		
	  								</span>
	  								<span>
	  									${reply.inserted }
	  								</span>
	  							</span>
	  							<span id="reply-content-editor${reply.id }" style="display:none">
									<form id="reply-form${reply.id }" action="" method="post">
										<input type="hidden" name="boardId" value="${board.id }"/>
										<input type="hidden" name="id" value="${reply.id }"/>
			  							<input class="form-control" type="text" name="content" value="${reply.content }" style="width:85%; float:left"/>
									</form>
	  							</span>
								<span class="btn-group" style="float:right">
		  							<button class="reply-modify-btn" id="reply-modify-btn${reply.id }" style="display:none" data-reply-id="${reply.id }">완료</button> 
		  							<button class="reply-edit-btn" id="reply-edit-btn${reply.id }" data-reply-id="${reply.id }">수정</button> 
		  							<button class="reply-delete-btn" id="reply-delete-btn${reply.id }" data-reply-id="${reply.id }">삭제</button>									
								</span>							
	  						</li>
  						</c:forEach>
  					</ul>
  				</div>
  			</div>
		</div>
	</div>
	<div class="row" id="footer" style="clear:both">
		<div class="col">foot</div>
	</div>
</body>
</html>