<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
#body {
	background-color: #DADADA;
}

#nav {
	z-index: 1000;
}

body>.grid {
	height: 165%;
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
.inputDesc {
	font-weight:bold;
	font-size:1.3rem;
}
input:checked+label {
	color: white;
	background-color: red;
	border: 2px solid red;
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
	border: 1px solid #d2d2d2;
	color: #d2d2d2;
	font-weight: lighter;
}

.donationtype {
	margin-left: 1.5em;
	margin-right: 1.5em;
	height: 2em;
	border-radius: 0.8em;
	font-size: 1.2em;
	text-align: center;
	line-height: 1em;
	border: 1px solid #d2d2d2;
	color: #d2d2d2;
	font-weight: lighter;
	padding: 0.5em;
}
.amBtn {
	font-weight:bold; 
	background-color:red;
	border: 1px solid #d2d2d2;
	color:white; 
	line-height: 1.6em;
	margin-top: 1.3em;
	text-align:center;
	width:2em;
	height: 2em;
	border-radius: 20%;
}
.visually-hidden {
	position: absolute;
	left: -100vw;
}

#title {
	width: 50rem;
	height: 2em;

}

</style>
<title>글작성</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
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
		if (amount.value > 1) {
			amount.value--;
		}
	}
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
		<%@include file="/WEB-INF/views/nav/navBoard.jsp"%>
	</div>

	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<section id="container">
				<form name="writeForm" method="post" action="/board/write"  >
					<div class="ui large form">
						<div class="ui stacked segment" style="height: 105em;">

							<table style = "margin-left: auto; margin-right: auto;">
								<tbody>
									<c:if test="${member.userId != null}">
										<tr>
											<td>
												<label for="title" class = "inputDesc"><br>제목</label><br>
												 
												<div class="ui input">
													<input type="text" id="title" name="title" class="chk" placeholder="제목을 입력해주세요." class="chk" title="제목을 입력해주세요.">
												</div>
											
											</td>
										</tr>
										<tr style = "margin-top:2em;">
											<td  class = "inputDesc"><hr> <br>혈핵형(필수)<br><br>
											<div style = "text-align:center">
											<input type="radio" value='A' name='bloodtype' id="bloodtypeA_ID" class="visually-hidden" checked />
											<label class="bloodtype" for="bloodtypeA_ID">A</label>
											
											<input type="radio" value='B' name='bloodtype' id="bloodtypeB_ID" class="visually-hidden" />
											<label class="bloodtype" for="bloodtypeB_ID">B</label>
											
											<input type="radio" value='AB' name='bloodtype' id="bloodtypeAB_ID" class="visually-hidden" />
											<label class="bloodtype" for="bloodtypeAB_ID">AB</label>
											
											<input type="radio" value='O' name='bloodtype' id="bloodtypeO_ID" class="visually-hidden" />
											<label class="bloodtype" for="bloodtypeO_ID">O</label>
											</div>
												<br>
												<br> <input style = "zoom:1.5; margin-right: 0.3em; margin-top:0.1em;" type='checkbox' name='bloodtypeRH' value='RH-' />RH-일경우 선택하세요.
											</td>
										</tr>
										
										<tr>
										
											<td class = "inputDesc"><hr> <br>필요한 헌혈의 종류<br><br>
												<div style = "text-align:center">
												<input type='radio' name='donationtype' value='전혈' id="bloodtype1" class="visually-hidden"  checked />
												<label class="donationtype" for="bloodtype1">전혈</label>
												
												<input type='radio' name='donationtype' value='성분채혈 혈소판' id="bloodtype2" class="visually-hidden" />
												<label class="donationtype" for="bloodtype2">성분채혈혈소판</label>
												
												<input type='radio' name='donationtype' value='성분채혈 백혈구' id="bloodtype3" class="visually-hidden" />
												<label class="donationtype" for="bloodtype3">성분채혈백혈구</label>
												</div> <br>
												<div style = "text-align:center">
												<input type='radio' name='donationtype' value='농축적혈구' id="bloodtype4" class="visually-hidden"/>
												<label class="donationtype" for="bloodtype4">농축적혈구</label>
												
												<input type='radio' name='donationtype' value='백혈구여과제거적혈구' id="bloodtype5" class="visually-hidden"/>
												<label class="donationtype" for="bloodtype5">백혈구여과제거적혈구</label>
												</div>

										
											</td>
										</tr>
										
										<tr>
											<td ><hr><label class = "inputDesc"> <br> 수량</label>
											<span style = "float: right;">
											 <input type="button" value="+" class = "amBtn" onclick="add();">
											 <input type="text" name="amount" value="1" style =" margin-top: 1.3em ;border: 1px solid #d2d2d2; text-align:center; width:3.5em; height: 2em;" onchange="change();">
											 <input type="button" value="-" class = "amBtn" onclick="del();"><br>
											 </span>
											 
											</td>
										</tr>
										<tr>
											<td ><hr><label class = "inputDesc"  for="patientName">환자성명</label><br>
											<div class="ui input"> 
												<input style = " width: 50rem; height: 2em;"type="text" id="patientName" name="patientName" class="chk" title="환자 성명을 입력하세요" /> 
												</div>
											</td>
										<tr>
										<tr>
											<td><label class = "inputDesc" for="patientNum"><br>환자등록번호</label> <input style="height:2em;"
												type="text" id="patientNum" name="patientNum" class="chk"
												title="환자 등록번호를 입력하세요." /></td>
										<tr>
										<tr>
											<td><label class = "inputDesc"  for="hospital"><br>의료기관</label> <input  style="height:2em;"
												type="text" id="hospital" name="hospital" class="chk"
												title="의료기관을 입력하세요." /></td>
										<tr>
										<tr>
											<td><label class = "inputDesc"  for="roomNum"><br>병실호수</label> <input type="text"  style="height:2em;"
												id="roomNum" name="roomNum" class="chk"
												title="병실 호수를 입력하세요." /></td>
										<tr>
										<tr>
											<td style = " text-align:center; ">
											
												<label class = "inputDesc"  for="cellNum"><br>연락처</label>
												<input type="text"  style="margin-left: 0.7em; margin-right: 2em; margin-top:1.3em; width: 15em; height:2em;" id="cellNum" name="cellNum" class="chk" title="연락처를 입력하세요." />
												
												<label class = "inputDesc"  for="resDate">필요한 날짜</label>
												<input style="margin-left: 0.7em; margin-top:1.3em; width: 15em;height:2em;"	type="date" id="resDate" name="resDate" class="chk" title="필요한 날짜를 입력하세요." />
											
											</td>
										<tr>
										<tr>
											<td><hr><label class = "inputDesc"  for="content"><br>내용</label>
											 <input type="hidden" id="writer" name="writer" value="${member.userId}" /> 
											 <textarea id="content" name="content" class="chk" title="내용을 입력하세요." style = "resize: none;"></textarea>
											</td>
										</tr>
										<tr>
											<td>
												<button id = "writetBtn" class="ui submit red button pull-right" style = "margin-top: 2em; color: white;">작성</button>
											</td>
										</tr>
									</c:if>
									<c:if test="${member.userId == null}">
										<p>로그인 후에 작성하실 수 있습니다.</p>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>
