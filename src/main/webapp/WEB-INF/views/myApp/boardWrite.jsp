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
<body>
	<div class="row" id="header">
		<div class="col">head</div>
	</div>
	<div class="container" style="float:left; width:100%">
		<div class="row">
			<div class="col-1" id="left" style="float:left">left</div>
			
  			<div class="col-10" id="content" style="float:right">
  				<h3>write</h3>
  				<form action="${appRoot }/board/write" method="post">
  				
  					<input class="form-control" type="text" name="title" maxlength="255" placeholder="제목을 입력해주세요" />
  					
  					<br />
  					
  					<textarea name="body" style="min-height:500px; width:100%; padding:10px"></textarea>	
  					<!-- 
  						<div class="cont" contenteditable="true" style="border:solid 1px; min-height:500px; padding:10px">
	  						<p></p>
  						</div>
  					-->
  					<button>등록</button>
  				</form>
  			</div>
		</div>
	</div>
	<div class="row" id="footer" style="clear:both">
		<div class="col">foot</div>
	</div>
</body>
</html>