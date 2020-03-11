<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="UTF-8">
		<title>mini 게시판</title>
		
		<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $("form[name='writeForm']");
				$(".write_btn").on("click", function(){
					if(fn_valiChk()){
						return false;
					}
					formObj.attr("action", "/board/write");
					formObj.attr("method", "post");
					formObj.submit();
				});
			})
			function fn_valiChk(){
				var regForm = $("form[name='writeForm'] .chk").length;
				for(var i = 0; i<regForm; i++){
					if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
						alert($(".chk").eq(i).attr("title"));
						return true;
					}
				}
			}
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
				<form name="writeform" method="post" action="/board/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목 &nbsp; </label>
									<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="content">내용 &nbsp; </label>
									<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자 &nbsp; </label>
									<input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<button class="write_btn" type="submit">작성</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</section>
			
			<hr>
		</div>
	</body>
</html>