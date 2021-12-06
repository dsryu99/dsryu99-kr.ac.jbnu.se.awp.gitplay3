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
	 	
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){	
					formObj.attr("action", "/board/delete");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
			
			//예약
			$(".reservation_btn").on("click", function(){
				var resYN = confirm("예약하시겠습니까?");
				if(resYN == true){
					formObj.attr("action", "/reservation/write");
					formObj.attr("method", "post");
					formObj.submit();	
				}
			});
			
			// 목록
			$(".list_btn").on("click", function(){
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
	
	<body>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="/WEB-INF/views/nav/nav.jsp" %>
			</div>
			
			<section id="container">
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
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="bloodtype" class="col-sm-2 control-label">필요혈액</label>
					<input type="text" id="bloodtype" name="bloodtype" class="form-control" value="${read.bloodtype} ${read.donationtype}" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="bloodtype" class="col-sm-2 control-label">환자성명</label>
					<input type="text" id="patientName" name="patientName" class="form-control" value="${read.patientName} (환자등록번호 ${read.patientNum})" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="hospital" class="col-sm-2 control-label">의료기관</label>
					<input type="text" id="hospital" name="hospital" class="form-control" value="${read.hospital}" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="roomNum" class="col-sm-2 control-label">병실호수</label>
					<input type="text" id="roomNum" name="roomNum" class="form-control" value="${read.roomNum}" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="cellNum" class="col-sm-2 control-label">연락처</label>
					<input type="text" id="cellNum" name="cellNum" class="form-control" value="${read.cellNum}" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="resDate" class="col-sm-2 control-label">필요날짜</label>	
					<input type="date" id="reaDate" name="resDate" class="form-control" value="${read.resDate}" readonly="readonly" >
				</div>
				<div class="form-group">
					<label for="amount" class="col-sm-2 control-label">필요수량</label>
					<input type="text" id="amount" name="amount" class="form-control" value="${read.amount}" readonly="readonly" >
				</div>
					
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
				</div>
								
				<div>
				
				<c:if test="${member.userId != null}">
					<c:if test="${member.userId == read.writer}">
						<button type="button" class="update_btn btn btn-warning">수정</button>
						<button type="button" class="delete_btn btn btn-danger">삭제</button>
						<button type="button" class="list_btn btn btn-primary">목록</button>
					</c:if>
					<c:if test="${member.userId != read.writer}">
						<button type="button" class="list_btn btn btn-primary">목록</button>
						<button type="button" class="reservation_btn btn btn-success">예약</button>
					</c:if>
				</c:if>
				
				</div>
				
				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								작성자 : ${replyList.writer}<br />
								작성날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
								</p>
								  
								<p>${replyList.content}</p>
								<div>
									<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
								</div>
							</li>
						</c:forEach>   
					</ol>
				</div>
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">댓글작성자</label>
						<div class="col-sm-10">
							<input type="text" id="writer" name="writer" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">댓글내용</label>
						<div class="col-sm-10">
							<input type="text" id="content" name="content" class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>