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
							<h3>글 쓰기</h3>
							<form action="${appRoot }/board/write" method="post">

								<input class="form-control" type="text" name="title"
									maxlength="255" placeholder="제목을 입력해주세요" />

								<br />

								<textarea class="form-control" name="body" placeholder="내용을 입력해주세요" style="height:640px"></textarea>
								<div class="submit-button-group">
									<button type="submit">등록</button>
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