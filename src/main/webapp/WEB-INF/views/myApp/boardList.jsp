<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js" integrity="sha512-OvBgP9A2JBgiRad/mM36mkzXSXaJE9BEIENnVEmeZdITvwT09xnxLtT4twkCa8m/loMbPHsvPl0T8lRGVBwjlQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">head</div>
		</div>
		<div class="row">
			<div class="col-2">left</div>
			
  			<div class="col-8">
  				<h3>글 목록</h3>
  				<table class="table table-hover">
  					<thead>
  						<tr>
  							<th>ID</th>
  							<th>제목</th>
  							<th>작성일</th>
  						</tr>
  					</thead>
  					<tbody>
  						<c:forEach items="${boardList }" var="board">
	  						<tr>
  								<th>${board.id }</th>
  								<td>${board.title }</td>
  								<td>${board.inserted }</td>
  							</tr>
  						</c:forEach>
  					</tbody>
  				</table>
  			</div>
  			
  			<div class="col-2">right</div>
		</div>
		<div class="row">
			<div class="col">foot</div>
		</div>
	</div>
</body>
</html>