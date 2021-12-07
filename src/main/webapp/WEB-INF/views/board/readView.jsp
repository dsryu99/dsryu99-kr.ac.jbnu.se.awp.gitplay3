<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<!-- css 가져오기 -->
<link rel="stylesheet" type="text/css"
	href="/resources/semantic.min.css">

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
			height:100%;
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
		
		#titleLogo {
			margin-left: 5rem;
			margin-top: 1rem;
			margin-bottom: 1rem;
		}
		
		h1 {
			color: red;
		}
				
		.bloodtype {
			margin-left: 1em;
			margin-right: 1em;
			width: 2em;
			height: 2em;
			border-radius: 50%;
			font-size: 2em;
			text-align: center;
			line-height: 1.9em;
			border: 2px solid red;
			color: red;
			font-weight: lighter;
		}

		#title {
			width: 50rem;
			height: 2em;
		
		
		}
		
		.devider {
			background-color:red;
			height: 2px;
			margin-top:5em;
		}
		
		.devider2 {
			background-color:red;
			height: 2px;
			margin-top:1em;
		}

</style>
	 	
	 	
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$("#delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){	
					formObj.attr("action", "/board/delete");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
			
			//예약
			$("#reservation_btn").on("click", function(){
				var resYN = confirm("예약하시겠습니까?");
				if(resYN == true){
					formObj.attr("action", "/reservation/write");
					formObj.attr("method", "post");
					formObj.submit();	
				}
			});
			
			// 목록
			$("#list_btn").on("click", function(){
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			//댓글 작성 View
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/board/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
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
			
			<div class="ui middle aligned center aligned grid">
					<div class="column">
					<section id="container">
					<div class="ui stacked segment" style="height: 150em; margin-top:3em;">
			
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="userId" name="userId" value="${member.userId}" />
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="title" name="title" value="${read.title}" />
					<input type="hidden" id="writer" name="writer" value="${read.writer}" />
					<input type="hidden" id="bloodtype" name="bloodtype" value="${read.bloodtype}" />
					<input type="hidden" id="donationtype" name="donationtype" value="${read.donationtype}" />
					<input type="hidden" id="patientName" name="patientName" value="${read.patientName}" />
					<input type="hidden" id="patientNum" name="patientNum" value="${read.patientNum}" />
					<input type="hidden" id="hospital" name="hospital" value="${read.hospital}" />
					<input type="hidden" id="roomNum" name="roomNum" value="${read.roomNum}" />
					<input type="hidden" id="cellNum" name="cellNum" value="${read.cellNum}" />
					<input type="hidden" id="resDate" name="resDate" value="${read.resDate}" />
					
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				<div >
					
					<br><label style = "font-size:2em; margin-left:1em;" class = "pull-left">${read.title}</label><br>
					
					<br><div class = "pull-left" style = "margin-left:3em;">
						<label style = "padding-right: 10px; border-right:2px solid #F2F2F2;">${read.writer}</label>
						<label style = "margin-left:0.3em; margin-right:0.2em;" for="regdate">작성날짜:</label>
						<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
					</div>
					<br><hr>
					<div style = " height: 30em;">
						<div class = "pull-left" style = "margin-left:3em; font-size:1.2em; ">
							${read.content}
						</div>
					
					</div>
					<hr>
					<br>
					<div class = "pull-left" style = "text-align:left; margin-left:6em; font-size:1.2em; width:25em; border-right: 2px solid #F2F2F2;">
					
						<div style = "margin-bottom:1em;">환자성명: ${read.patientName} (환자등록번호: ${read.patientNum})</div>
				
						<div style = "margin-bottom:1em;">의료기관: ${read.hospital} (병실호수: ${read.roomNum})</div>
						
						<div style = "margin-bottom:1em;">필요날짜: ${read.resDate}</div>
						
						<div style = "margin-bottom:1em;">필요수량: ${read.amount}</div>
						
						<div style = "margin-bottom:1em;">연락처: ${read.cellNum}</div>
						
						
					</div>
					
					<div style = " height: 15em;">
					<div class = "pull-right" style = "text-align: center; margin-right:12em; font-size:1.2em; ">
					
						<label style = "margin-bottom:1em;">필요 혈액 <br></label>
					
						<br><label style = "margin-bottom:1em;" class="bloodtype">${read.bloodtype}</label>
						<br><label style = "margin-bottom:1em;"> ${read.donationtype}</label>
					</div>
					</div>
					<hr>
					
					<div class = "pull-right" style = " margin-right:3em;">
					<c:if test="${member.userId != null}">
						<c:if test="${member.userId == read.writer}">
							<button type="button" id = "update_btn" class="ui submit yellow button">수정</button>
							<button type="button" id = "delete_btn" class="ui submit red button">삭제</button>
							<button type="button" id = "list_btn" class="ui submit blue button">목록</button>
						</c:if>
						<c:if test="${member.userId != read.writer}">
						<div>
							<button type="button" id = "list_btn" class="ui submit blue button">목록</button>
							<button type="button" id = "reservation_btn" class="ui submit green button">예약</button>
						</div>
						</c:if>
					</c:if>
				</div>
				<hr class = "devider">
				<!-- 댓글 -->
				 <div>
				 	<hr>
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
							 <div id="reply" style = "position:relative; height:5em;">
								<div id="reply" class = "pull-left">
								<p style = "font-weight:bold;">작성자 : ${replyList.writer}</p>
								</div>
								<div style = "font-weight:bold; margin-right:2em;" id="reply" class = "pull-right" >
								작성날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd"/>
								</div><br>
								<c:if test="${member.userId == replyList.writer}">
								 <div style = "margin-right:1.2em; margin-top:1em;" class = "pull-right">
									<button type="button" class="replyUpdateBtn ui submit yellow button" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn ui submit red button" data-rno="${replyList.rno}">삭제</button>
								</div>
								</c:if>
								<div class = "pull-left" style = "position:absolute; margin-left: 3em; margin-top:1em;">${replyList.content}</div>
								 
							</div>
								<hr>
							
							
							</li>
						</c:forEach>   
					</ol>
				</div>
				<br>
				<hr class = "devider2">
				<c:if test="${member.userId != null}">
				<div>
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="writer" name="writer" value="${member.userId}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
				
				 <div id="reply" style = "height:5em;">
				 <label class = "pull-left" style = "margin-bottom:1em; margin-right:2.5em; margin-left:3em;">댓글작성자</label> <label class = "pull-left" for="content">댓글내용</label> <br>
				 <input readonly class = "ui input pull-left" style = "text-align:center; width:5em; height:2.3em; line-height: 1.8em; margin-top:1.3em; margin-left:-11.3em; "value = "${member.userId}" >
				 <input type="text" id="content" name="content" class="form-control pull-right" style = "width:55em; margin-right:6em; margin-top:0.2em;"/>
				 
				 </div>
				
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn ui submit teal button pull-right" style = "margin-top:1em; margin-right:6em;">작성</button>
						</div>
					</div>
				</form> 
				</div>
				</c:if>
						</div>
						</div>
			</section>
			</div>
			</div>
	

	</body>
</html>