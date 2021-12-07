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
<!-- css 가져오기 -->
<link rel="stylesheet" type="text/css"
	href="/resources/semantic.min.css">

<!-- icon 가져오기 Font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='form']");

		// 예약 확정
		$(".confirm_btn").on("click", function() {
			formObj.attr("action", "/reservation/confirm");
			formObj.attr("method", "post");
			formObj.submit();
		});

		// 예약 취소
		$(".delete_btn").on("click", function() {
			var deleteYN = confirm("예약 취소하시겠습니까?");
			if (deleteYN == true) {
				formObj.attr("action", "/reservation/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});

	})
</script>
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
	width: 5rem;
	height: 2.5rem;
	color: white;
	display: table-cell;
	vertical-align: middle;
	font-size: 1em;
	font-weight:bold;
	border-radius: 5px;
}

#confirmBtn {
	background-color:#FFBF00
}

#container {
	position: relative;
	top: 4em;
}
</style>
<title>내 예약목록</title>
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
			<form role="form" method="post">
			<div class="ui stacked segment" style="height: 50em;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="tablebno">번호</th>
								<th class="tabletitle">게시글</th>
								<th>환자이름</th>
								<th>의료기관</th>
								<th>필요혈액</th>
								<th>예약날짜</th>
								<th>예약현황</th>
								<th>예약취소</th>
							</tr>
						</thead>
						<c:forEach items="${reslist}" var="reslist">
							<c:if test="${member.userId == reslist.userId}">
								<tr>
									<td><c:out value="${reslist.bno}" /></td>
									<td><a href="/board/readView?bno=${reslist.bno}">${reslist.title}</a></td>
									<td><c:out
											value="${reslist.patientName} (${reslist.patientNum})" /></td>
									<td><c:out value="${reslist.hospital}" /></td>
									<td><c:out
											value="${reslist.bloodtype} ${reslist.donationtype}" /></td>
									<td><c:out value="${reslist.resDate}" /></td>

									<c:if test="${reslist.confirm == 0}">
										<td><button type="button" id = "confirmBtn"
												class="ui submit red button pull-left" style = "color: white;"
												onclick="location.href='/reservation/confirm?bno=${reslist.bno}'">확정</button></td>
										<td><button type="button"
												class="ui submit red button pull-left" style = "color: white;"
												onclick="location.href='/reservation/delete?bno=${reslist.bno}'">취소</button></td>
									</c:if>
									<c:if test="${reslist.confirm == 1}">
										<td><div class="confirmed">완료</div></td>
										<td></td>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>

				<c:if test="${member.userId == null}">
					<p>로그인 후에 확인하실 수 있습니다.</p>
				</c:if>
				</div>
			</form>
		</div>
	</div>

</html>