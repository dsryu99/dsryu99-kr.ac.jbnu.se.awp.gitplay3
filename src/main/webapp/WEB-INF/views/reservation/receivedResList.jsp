<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>받은 예약목록</title>
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
	height: 86%;
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

.tabletitle {
	width: 200px;
}

.tablewriter {
	text-align: center;
	width: 4em;
}

.tablebno {
	width: 4em;
}

.tabledate {
	text-align: center;
	width: 7em;
}

.unconfirmed {
	background-color: red;
	align: center;
	text-align: center;
	width: 3.2rem;
	height: 2.1rem;
	color: white;
	display: table-cell;
	vertical-align: middle;
	font-size: 0.8em;
}

.confirmed {
	background-color: #2ECCFA;
	align: center;
	text-align: center;
	width: 3.2rem;
	height: 2.1rem;
	color: white;
	display: table-cell;
	vertical-align: middle;
	font-size: 0.8em;
}

#container {
	position: relative;
	top: 4em;
}
</style>
</head>


<body id="body">
	<div class="container">
		<header id="titleLogo">

			<h1 style="font-size: 3em;">
				<i class="fas fa-tint"></i> 대피소
			</h1>
		</header>
	</div>

	<div id="nav">
		<%@include file="/WEB-INF/views/nav/navReservation.jsp"%>
	</div>

	<div class="ui middle aligned center aligned grid">
		<div class="column">

			<form role="form" method="get">
				<div class="ui large form">
					<div class="ui stacked segment" style="height: 50em;">
						<table class="table table-hover"
							style="margin-left: auto; margin-right: auto;">
							<thead>
								<tr>
									<th class="tablebno">번호</th>
									<th class="tabletitle">게시글</th>
									<th class="tablewriter">작성자</th>
									<th>환자이름</th>
									<th>의료기관</th>
									<th>필요혈액</th>
									<th>예약날짜</th>
									<th>예약현황</th>
								</tr>
							</thead>
							<c:forEach items="${reslist}" var="reslist">
								<c:if test="${member.userId == reslist.writer}">
									<tr class="tableInfo">
										<td><c:out value="${reslist.bno}" /></td>
										<td><a href="/board/readView?bno=${reslist.bno}">${reslist.title}</a></td>
										<td><c:out value="${reslist.writer}" /></td>
										<td><c:out
												value="${reslist.patientName} (${reslist.patientNum})" /></td>
										<td><c:out value="${reslist.hospital}" /></td>
										<td><c:out
												value="${reslist.bloodtype} ${reslist.donationtype}" /></td>
										<td><c:out value="${reslist.resDate}" /></td>
										<c:if test="${reslist.confirm == 0}">
											<td style="padding-left: 1.3em;">
												<div class="unconfirmed">미완료</div>
											</td>
										</c:if>
										<c:if test="${reslist.confirm == 1}">

											<td style="padding-left: 1.3em;">
												<div class="confirmed">완료</div>
											</td>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
						</table>

						<c:if test="${member.userId == null}">
							<p>로그인 후에 확인하실 수 있습니다.</p>
						</c:if>

					</div>

				</div>
			</form>
		</div>
	</div>

</body>
</html>