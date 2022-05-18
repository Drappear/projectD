<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/board/main" var="mainUrl"></c:url>
<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/write" var="writeUrl"></c:url>

<nav class="left-sideBar">
	<ul class="nav nav-pills flex-column text-white bg-dark">
	  <li class="nav-item">
		  <a class="nav-link" href="${mainUrl }">Main</a>
	  </li>
	  <li class="nav-item">
	 	 <a class="nav-link" href="${listUrl }">글 목록</a>
	  </li>
	  <li class="nav-item">
	  	<a class="nav-link" href="${writeUrl }">글 쓰기</a>
	  </li>
	</ul>
</nav>