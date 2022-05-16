<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name = "path" %>

<nav aria-label="Page navigation">
  <ul class="pagination justify-content-center"">
  	<c:if test="${pageInfo.prev }">
  		<c:url value="${path }" var="link">
  			<c:param name="page" value="${pageInfo.currentPage - 1 }"></c:param>
  		</c:url>
    	<li class="page-item">
      		<a class="page-link" href="${link }">
    	    	<span>&laquo;</span>
			</a>
    	</li>
  	</c:if>
  	<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="pageNum">
  		<c:url value="${path }" var="link">
  			<c:param name="page" value="${pageNum }"></c:param>
  		</c:url>
    	<li class="page-item ${pageInfo.currentPage == pageNum ? 'active' : '' }">
    		<a class="page-link" href="${link }">${pageNum }</a>
    	</li>
  	</c:forEach>
  	<c:if test="${pageInfo.currentPage != pageInfo.endPage }">
  		<li class="page-item">
  			<c:url value="${path }" var="link">
  				<c:param name="page" value="${pageInfo.current + 1 }"></c:param>
  			</c:url>
   	 		<a class="page-link" href="${link }">
     			<span>&raquo;</span>
   			</a>
 		</li>
  	</c:if>
  </ul>
</nav>