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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js" integrity="sha512-OvBgP9A2JBgiRad/mM36mkzXSXaJE9BEIENnVEmeZdITvwT09xnxLtT4twkCa8m/loMbPHsvPl0T8lRGVBwjlQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<dpr:navBar></dpr:navBar>
	</header>
	<div class="row" style="padding-top:55px">
		<div class="col-2" id="left" style="float:left; width:15%">
			<dpr:sideBar></dpr:sideBar>
		</div>
		
  		<div class="col-10" id="content" style="float:right; width:85%; padding:10px;">
  			<h3>글 목록</h3>
  			<table class="table table-hover">
  				<thead>
  					<tr>
  						<th class="text-center" style="width:10%">ID</th>
  						<th class="text-center" style="width:70%">제목</th>
  						<th class="text-center" style="width:20%">작성일</th>
  					</tr>
  				</thead>
  				<tbody>
  					<c:forEach items="${boardList }" var="board">
						<tr>
  							<th class="text-center">${board.id }</th>
  							<td>
								<a href="${appRoot }/board/get/${board.id }">${board.title }</a>
								<c:if test="${board.numOfReply > 0 }">
									<span class="badge bg-secondary">${board.numOfReply }</span>								
								</c:if>
							</td>
							<td class="text-center">${board.inserted }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin:30px; display:flex; justify-content:right">
				<form action="${appRoot }/board/write">
 					<button>글쓰기</button>
				</form>
			</div>
			<div class="row" >
				<dpr:pagination></dpr:pagination>
			</div>
		</div>
	</div>
	<footer class="footer mt-auto fixed-bottom py-3 bg-dark">
  		<div class="container">
   			<span class="text-muted">footer content</span>
 		</div>
	</footer>	
</body>
</html>