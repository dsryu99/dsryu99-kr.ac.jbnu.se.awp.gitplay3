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
	<body>
		<div class="container">
			<header>
				<h1>예약받은 목록</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="/WEB-INF/views/nav/nav.jsp" %>
			</div>
			
			<section id="container">
				<form role="form" method="get">
					<c:if test="${member.userId != null}">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>게시글</th><th>작성자</th><th>등록일</th><th>환자이름</th><th>의료기관</th><th>필요혈액</th><th>예약날짜</th><th>예약현황</th></tr>
						</thead>
						<c:forEach items="${reslist}" var = "reslist">
							<c:if test="${member.userId == reslist.writer}">
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
									<td>미완료</td>
								</c:if>
								<c:if test ="${reslist.confirm == 1}">
									<td>완료</td>
								</c:if>
							</tr>
							</c:if>
						</c:forEach>
					</table>
					
					</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 확인하실 수 있습니다.</p>
							</c:if>
				</form>
			</section>
		</div>
	</body>
</html>