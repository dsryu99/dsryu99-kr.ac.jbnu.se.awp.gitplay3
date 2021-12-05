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
	 
	 <script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='form']");
			
			// 헌혈 확정
			$(".confirm_btn").on("click", function(){
				formObj.attr("action", "/reservation/confirm");
				formObj.attr("method", "post");
				formObj.submit();				
			});
			
		})
	</script>
	 
	 	<title>게시판</title>
	</head>
	<body>
		<div class="container">
			<header>
				<h1>내 예약목록</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="/WEB-INF/views/nav/nav.jsp" %>
			</div>
			
			<section id="container">
				<form role="form" method="post">
					<c:if test="${member.userId != null}">

					<table class="table table-hover">

						<thead>
							<tr><th>번호</th><th>게시글</th><th>작성자</th><th>등록일</th><th>환자이름</th><th>의료기관</th><th>필요혈액</th><th>예약날짜</th><th>헌혈완료</th></tr>
						</thead>
						
						<c:forEach items="${reslist}" var = "reslist">
							<c:if test="${member.userId == reslist.userId}">
							<tr>
							
								<td><c:out value="${reslist.bno}" /></td>
								
								<td><a href="/board/readView?bno=${reslist.bno}">${reslist.title}</a></td>
								<td><c:out value="${reslist.writer}" /></td>
								<td><fmt:formatDate value="${reslist.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${reslist.patientName} (${reslist.patientNum})" /></td>
								<td><c:out value="${reslist.hospital}" /></td>
								<td><c:out value="${reslist.bloodtype} ${reslist.donationtype}" /></td>
								<td><c:out value="${reslist.resDate}" /></td>
								
								<c:if test ="${reslist.confirm == 0}">
								<td><button type="button" class="confirm_btn btn btn-warning" onclick = "location.href='/reservation/confirm?bno=${reslist.bno}'">확정</button></td>
								</c:if>
								<c:if test ="${reslist.confirm == 1}">
								<td><button type="button" class="btn btn-primary">완료</button></td>
								</c:if>
							</tr>
							</c:if>
						</c:forEach>
						
					</table>
					
					</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
				</form>
			</section>
		</div>
	</body>
</html>