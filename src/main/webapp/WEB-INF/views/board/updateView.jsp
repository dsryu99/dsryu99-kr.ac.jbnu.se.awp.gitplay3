<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
			function add() {
				amount = document.updateForm.amount;
				
				amount.value++;
			}
			
			function del() {
				amount = document.updateForm.amount;
				
				if(amount.value > 1){
					amount.value--;
				}
			}
		
		
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 <div>
				<%@include file="/WEB-INF/views/nav/nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
									<td>
										혈핵형<br>
										<input type = 'checkbox' name = 'bloodtype' value = 'A'/>A 
										<input type = 'checkbox' name = 'bloodtype' value = 'B'/>B 
										<input type = 'checkbox' name = 'bloodtype' value = 'AB'/>AB 
										<input type = 'checkbox' name = 'bloodtype' value = 'O'/>O <br>
										RH-일 경우 선택하세요. <input type = 'checkbox' name = 'bloodtypeRH' value = 'RH-'/>
									</td>
									
								</tr>
								<tr>
									<td>
										필요한 헌혈의 종류<br>
										<input type = 'checkbox' name = 'donationtype' value = '전혈'/>전혈 
										<input type = 'checkbox' name = 'donationtype' value = '성분채혈 혈소판'/>성분채혈 혈소판 
										<input type = 'checkbox' name = 'donationtype' value = '성분채혈 백혈구'/>성분채혈 백혈구 
										<input type = 'checkbox' name = 'donationtype' value = '농축적혈구'/>농축적혈구
										<input type = 'checkbox' name = 'donationtype' value = '백혈구여과제거적혈구'/>백혈구여과제거적혈구 <br>
									</td>
									
								</tr>
								
								<tr>
									<td>	
										수량 : 	<input type="text" name="amount" value="${update.amount}" size="3" onchange="change();">
												<input type="button" value=" + " onclick="add();">
												<input type="button" value=" - " onclick="del();"><br>
									</td>	
								</tr>
								
								<tr>
									<td>
										<label for="patientName">환자성명</label><input type="text" id="patientName" name="patientName" value="${update.patientName}" class="chk" title="환자 성명을 입력하세요" />
									</td>
								<tr>
								<tr>
									<td>
										<label for="patientNum">환자등록번호</label><input type="text" id="patientNum" name="patientNum" value="${update.patientNum}" class="chk" title="환자 등록번호를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="hospital">의료기관</label><input type="text" id="hospital" name="hospital" class="chk" value="${update.hospital}" title="의료기관을 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="roomNum">병실호수</label><input type="text" id="roomNum" name="roomNum" value="${update.roomNum}"  class="chk" title="병실 호수 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="cellNum">연락처</label><input type="text" id="cellNum" name="cellNum" value="${update.cellNum}" class="chk" title="연락처를 입력하세요."/>
									</td>
								<tr>
								<tr>
									<td>
										<label for="resDate">필요한 날짜</label><input type="text" id="resDate" name="resDate" value="${update.resDate}" class="chk" title="필요한 날짜를 입력하세요."/>
									</td>
								<tr>
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="button" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>