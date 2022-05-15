<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="current" %>
<c:url value="/board/main" var="mainUrl"></c:url>
<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/write" var="writeUrl"></c:url>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${mainUrl }">게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link ${current == 'main' ? 'active' : '' }" href="${mainUrl }">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'list' ? 'active' : '' }" href="${listUrl }">글 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'write' ? 'active' : '' }" href="${writeUrl }">글 쓰기</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="${mainUrl }">Main</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${listUrl }">글 목록</a></li>
            <li><a class="dropdown-item" href="${writeUrl }">글 쓰기</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>