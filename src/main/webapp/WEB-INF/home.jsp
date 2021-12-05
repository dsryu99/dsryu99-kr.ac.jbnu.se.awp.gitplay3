<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Login</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- css 가져오기 semantic UI -->
<link rel="stylesheet" type="text/css" href="/resources/semantic.min.css">
<!-- icon 가져오기 Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style type="text/css">
body {
	background-color: #DADADA;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;

}

#memberUpdateBtn{
	margin-bottom:1rem;
	border:3px;
	
}

#memberMsg{
	margin-top:1rem;
	font-size:1.5rem;
}

.fa-tint{
	color:#F43F36;
	font-size:5rem;
	margin-right:1rem;
	
}
#logoutBtn, #memberUpdateBtn, #login_btn {
	background-color:#F43F36;
}
#title {

}
</style>
</head>



<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})
		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})

	})
</script>
<body>
	<!-- 
		<form name='homeForm' id="login"  method="post" action="/member/login">
	<a href="/board/list">게시판</a><br/>
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userId">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	 -->

	<div class="ui middle aligned center aligned grid">
	
		<div class="column">
		<c:choose>
				<c:when test="${member != null }">
					<div>
					<i class="fas fa-tint"></i><br>
					<h2 class="title">지정 헌혈 게시판</h2>
						<div class="ui stacked segment">
						<p id="memberMsg">${member.userId}님환영합니다.</p>
						<button  class="ui fluid large red submit button" id="memberUpdateBtn" type="button">회원정보수정</button>
						<button  class="ui fluid large red submit button" id="logoutBtn" type="button" id = "logoutbtn">로그아웃</button>
					</div>
					</div>
				</c:when>
			
			<c:otherwise>
			<i class="fas fa-tint"></i>
			<h2 class="title">지정 헌혈 게시판</h2>
			
			<form class="ui large form" name='homeForm' id="loginForm"
				method="post" action="/member/login">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<label for="userId"></label> <input type="text" id="userId"
								name="userId" placeholder="아이디">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<input type="password" id="userPass" name="userPass"
								placeholder="비밀번호">
						</div>
					</div>
					<button type="submit" class="ui fluid large red submit button"
						id="login_btn">로그인</button>
				</div>
				<div class="ui error message"></div>

			</form>
			<div class="ui message">
				로그인 할 계정이 없다면 <a href="member/register">여기</a>를 눌러주세요.		
			</div> 
				<a href="/board/list">게시판 바로가기</a>
			</c:otherwise>
			</c:choose>
			<c:if test="${msg == false}">
				<br>
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</div>
	</div>
</body>
</html>