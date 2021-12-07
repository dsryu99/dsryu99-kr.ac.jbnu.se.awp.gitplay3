<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>댓글 삭제</title>
</head>

	<!-- css 가져오기 -->
	<link rel="stylesheet" type="text/css" href="/resources/semantic.min.css">

	<!-- icon 가져오기 Font awesome -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<style type="text/css">
#body {
	background-color: #DADADA;
}

#nav {
	z-index: 1000;
}

body>.grid {
	height: 57%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 1050px;
}

.view_btn {
	cursor: pointer;
}

#table {
	margin-top: 2rem;
	width: 950px;
}

#titleLogo {
	margin-left: 5rem;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

h1 {
	color: red;
}

#container {
	position: relative;
	top: 4em;
}
</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<body id="body">
	
		
			<div class="container">
				<header id="titleLogo">

				<h1 style="font-size: 3em;">
				<i class="fas fa-tint"></i> 대피소
				</h1>
				</header>
			</div>
			 
			<div>
				<%@include file="/WEB-INF/views/nav/navBoard.jsp" %>
			</div>
			<div class="ui middle aligned center aligned grid" >
				<div class="column">
				<form name="updateForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						<div class="ui large form">
					
					<div class="ui stacked segment" style="height: 30em; ">
					<div style = "margin-left: auto; margin-right: auto; margin-top:9em;">
						<p style = "font-size:1.8em; font-weight:bold;"> 댓글을 삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn ui submit red button">예 삭제합니다.</button>
						<button type="button" class="cancel_btn ui submit teal button">아니오. 삭제하지 않습니다.</button>
					</div>
					
					</div>
					</div>
				</form>

			</div>
			</div>
		
	</body>
</html>