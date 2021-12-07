<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
		<head>
<title>회원정보수정</title>
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
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
			});
		})
	</script>
	
	<body>
	<div class="ui middle aligned center aligned grid">
	
		<div class="column">
		
			<i class="fas fa-tint"></i>
			<h2 class="title">지정 헌혈 게시판</h2>
			<h2 class="title" style = "margin-top:-0.3em; font-size:3em;">대 피 소</h2>
			
			<form class="ui large form" id="updateForm" action="/member/memberUpdate" method="post">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<label for="userId"></label>
							<input type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
							
						</div>
					</div>

					<div class="field">
						<div class="ui left icon input">
							<input type="password" id="userPass" name="userPass" placeholder="비밀번호">
						</div>
					</div>
					<div class="field">
					<div class="ui left icon input">
		
							<input type="text" id="userName" name="userName" value="${member.userName}" />
						</div>
					</div>
					<div class="form-group has-feedback">
					<button class="ui fluid large red submit button" type="submit" id="submit">회원정보수정</button>
					</div>
					</div>
				
			</form>
			<div class="ui message">
				<a href="/board/list">게시판 바로가기</a>
			</div> 
				
				
		</div>
	</div>
	</body>
	
</html>
