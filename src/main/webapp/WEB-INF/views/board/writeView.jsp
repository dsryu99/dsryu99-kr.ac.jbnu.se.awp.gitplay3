<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function add() {
			amount = document.writeForm.amount;
			amount.value++;
		}
		function del() {
			amount = document.writeForm.amount;
			if(amount.value > 1){
				amount.value--;
			}
		}
		
	</script>
	
	<body>
		<div id="root">
			<header>
				<h1>게시판</h1>
			</header>
			<hr/>
			<div>
				<%@include file="/WEB-INF/views/nav/nav.jsp" %>
			</div>
			<hr/>
			<section id="container">
				<form name="writeForm" method="post" action="/board/write" >
					<table>
						<tbody>
							<c:if test="${member.userId != null}">
								<tr>
									<td>
										<label for="title">제목</label>
										<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
									</td>
								</tr>
								<tr>
									<td>
										혈핵형<br>
										<input type = 'radio' name = 'bloodtype' value='A' checked/>A 
										<input type = 'radio' name = 'bloodtype' value='B'/>B 
										<input type = 'radio' name = 'bloodtype' value='AB'/>AB 
										<input type = 'radio' name = 'bloodtype' value='O'/>O <br>
										RH-일 경우 선택하세요. <input type = 'checkbox' name = 'bloodtypeRH' value='RH-'/>
									</td>
								</tr>
								<tr>
									<td>
										필요한 헌혈의 종류<br>
										<input type = 'radio' name = 'donationtype' value = '전혈' checked/>전혈 
										<input type = 'radio' name = 'donationtype' value = '성분채혈 혈소판'/>성분채혈 혈소판 
										<input type = 'radio' name = 'donationtype' value = '성분채혈 백혈구'/>성분채혈 백혈구 
										<input type = 'radio' name = 'donationtype' value = '농축적혈구'/>농축적혈구
										<input type = 'radio' name = 'donationtype' value = '백혈구여과제거적혈구'/>백혈구여과제거적혈구 <br>
									</td>	
								</tr>
								<tr>
									<td>	
										수량 : 	<input type="text" name="amount" value="1" size="3" onchange="change();">
												<input type="button" value=" + " onclick="add();">
												<input type="button" value=" - " onclick="del();"><br>
									</td>	
								</tr>
								<tr>
									<td>
										<label for="patientName">환자성명</label>
										<input type="text" id="patientName" name="patientName" class="chk" title="환자 성명을 입력하세요" />
									</td>
								<tr>
								<tr>
									<td>
										<label for="patientNum">환자등록번호</label>
										<input type="text" id="patientNum" name="patientNum" class="chk" title="환자 등록번호를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="hospital">의료기관</label>
										<input type="text" id="hospital" name="hospital" class="chk" title="의료기관을 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="roomNum">병실호수</label>
										<input type="text" id="roomNum" name="roomNum" class="chk" title="병실 호수를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="cellNum">연락처</label>
										<input type="text" id="cellNum" name="cellNum" class="chk" title="연락처를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="resDate">필요한 날짜</label>
										<input type="date" id="resDate" name="resDate" class="chk" title="필요한 날짜를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="content">내용</label>
										<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label>
										<input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요." value="${member.userId}" />
									</td>
								<tr>
									<td>						
										<button class="write_btn" type="submit">작성</button>	
									</td>
								</tr>	
							</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
						</tbody>			
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>
