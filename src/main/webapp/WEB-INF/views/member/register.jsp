<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
<title>회원가입</title>
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
#logoutBtn, #memberUpdateBtn, #login_btn, #boardBtn, #memberdeleteBtn {
	background-color:#F43F36;
}
</style>
</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	
	<body>
	<div class="ui middle aligned center aligned grid">
	
		<div class="column">
		
			<i class="fas fa-tint"></i>
			<h2 class="title">지정 헌혈 게시판</h2>
			<h2 class="title" style = "margin-top:-0.3em; font-size:3em;">대 피 소</h2>
			
			<form class="ui large form" name='homeForm' action="/member/register" method="post" id="regForm">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<label for="userId"></label>
							<input type="text" id="userId" name="userId" placeholder="아이디">
							
						</div>
					</div>
					<div class="field">
					<button class="idChk ui fluid large red submit button" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<input type="password" id="userPass" name="userPass" placeholder="비밀번호">
						</div>
					</div>
					<div class="field">
					<div class="ui left icon input">
		
							<input class="form-control" type="text" id="userName" name="userName" placeholder="성명" />
						</div>
					</div>
					<div class="form-group has-feedback">
					<button class="ui fluid large red submit button" type="submit" id="submit">회원가입</button>
					</div>
					</div>
				
			</form>
			<div class="ui message">
				로그인 할 계정이 있다면 <a href="/">여기</a>를 눌러주세요.		
			</div> 
				<a href="/board/list">게시판 바로가기</a>	
				
		</div>
	</div>

	</body>
	
</html>
