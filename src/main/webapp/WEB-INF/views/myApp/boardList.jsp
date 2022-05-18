<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dpr" tagdir="/WEB-INF/tags/myBoard" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myBoard.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js" integrity="sha512-OvBgP9A2JBgiRad/mM36mkzXSXaJE9BEIENnVEmeZdITvwT09xnxLtT4twkCa8m/loMbPHsvPl0T8lRGVBwjlQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0">
</head>
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
						<h3>글 목록</h3>
						<table class="table table-hover" id="list-table">
							<thead>
								<tr>
									<th class="table-head-id" style="width:6rem">글 번호</th>
									<th class="table-head-title">제목</th>
									<th class="table-head-inserted" style="width:10rem">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList }" var="board">
									<tr>
										<th class="text-center">${board.id }</th>
										<td>
											<a href="${appRoot }/board/get/${board.id }">
												${board.title }
												<c:if test="${board.numOfReply > 0 }">
													<span>[${board.numOfReply }]</span>
												</c:if>
											</a>
										</td>
										<td class="text-center">${board.difInserted }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="submit-button-group">
							<form action="${appRoot }/board/write">
								<button type="submit"><i class="fa-solid fa-pencil"></i> 글쓰기</button>
							</form>
						</div>
						<div class="row">
							<dpr:pagination></dpr:pagination>
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