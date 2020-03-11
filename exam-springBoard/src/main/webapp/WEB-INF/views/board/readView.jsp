<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="UTF-8">
		<title>mini 게시판</title>
		
		<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $("form[name='readForm']");
				
				// 수정 
				$(".update_btn").on("click", function(){
					
					var updateYN = confirm("수정하시겠습니까?");
					if(updateYN == true) {
						formObj.attr("action", "/board/updateView");
						formObj.attr("method", "get");
						formObj.submit();
					}
				})
				
				// 삭제
				$(".delete_btn").on("click", function(){
					
					var deleteYN = confirm("삭제하시겠습니까?");
					if(deleteYN == true) {
						formObj.attr("action", "/board/delete");
						formObj.attr("method", "post");
						formObj.submit();
					}
				})
				
				// 취소(목록)
				$(".list_btn").on("click", function(){
					
					location.href = "/board/list";
					
				})
			})
		</script>
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
				<form role="form" method="post" name="readForm">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="bno">글 번호</label>
									<input type="text" id="bno" name="bno" readonly value="${read.bno}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label>
									<input type="text" id="title" name="title" value="${read.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label>
									<textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label>
									<input type="text" id="writer" name="writer" value="${read.writer}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">등록일</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="button" class="update_btn">수정</button>
						<button type="button" class="delete_btn">삭제</button>
						<button type="button" class="list_btn">목록</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>