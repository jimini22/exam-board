<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<!-- c:forEach 와 c:out value 쓰려면 이거 써야됨 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	<!-- fmt:formatDate 이 포맷 쓰려면 이거 써야됨 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mini 게시판</title>
		<style type="text/css">
			li {list-style:none; float:left; padding:6px;}	<!-- 페이징(<li>태그) 가로로 정렬 -->
		</style>
	</head>
	<body>
		<div id="root">
			<header>
				<h1>게 시 판</h1>
			</header>
			<hr>
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr>
			
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<table>
						<tr><th>글 번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>		<!-- list에 있는 bno값 가져와서 뿌리렴 -->
								<td>
									<a href="/board/readView?bno=${list.bno}">
									<c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
						<!-- c:forEach items="${list}" var = "list"에서 보면 forEach는 받은 ${list}값 만큼 반복해주는건데
						자바에서 for문이랑 비슷하다고 생각하면 됨. 여기서 ${list}는 BoardController에서 이름을 list로 정한 service.list()를 가져온거임. -->
						
					</table>
					
					<div>
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
					
				</form>
			</section>
			<hr>
		</div>
	</body>
</html>