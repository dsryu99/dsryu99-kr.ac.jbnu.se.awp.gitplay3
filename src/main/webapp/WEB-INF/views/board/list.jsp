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

<title>게시판 페이지</title>
<!-- css 가져오기 -->
<link rel="stylesheet" type="text/css"
	href="/resources/semantic.min.css">
	
	<!-- icon 가져오기 Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style type="text/css">
	#body {
		
		background-color: #DADADA;
	}
	#nav {
		z-index:1000;
	}
	
	body>.grid {
		height:86%;
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
		margin-left:5rem;
		margin-top: 1rem;
		margin-bottom:1rem;
	}
	
	h1 {
		color:red;
		
	}
	
	.tabletitle {
		width: 400px;
	}
	
	.tablewriter {
		text-align: center;
		width: 3em;
	}
	.tablebno {
		width: 2em;
	}
	.tabledate {
		text-align: center;
		width: 7em;
	}
	
	#writetBtn {
		margin-left: 2em;
		background-color:#F43F36;
		position:absolute;
		left:1em;
	}
	
	#container {
		position:relative;
		top: 4em;
	}

</style>

</head>

 
<body id="body">
	<div class="container">
		<header  id= "titleLogo" >
			
			<h1 style = "font-size : 3em;" > <i class="fas fa-tint"></i> 대피소</h1>
		</header>
	</div>
		
	<div id = "nav">
		<%@include file="/WEB-INF/views/nav/navBoard.jsp"%>
	</div>
	<div class="ui middle aligned center aligned grid">
		<div class="column">

			
			<div class="ui large form">
				<div class="ui stacked segment" style = "height:50em;">

					<table class="table table-hover" id="table" style = "margin-left: auto; margin-right: auto;">
						<thead>
							<tr>
								<th class = "tablebno">번호</th>
								<th class = "tabletitle">제목</th>
								<th class = "tablewriter">작성자</th>
								<th class = "tabledate">등록일</th>
							</tr>
						</thead>
						<tbody id="lists">
							<c:forEach items="${list}" var="list">
								<tr>
									<td><c:out value="${list.bno}" /></td>
									<td><a
										href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
												value="${list.title}" /></a></td>
									<td style = "text-align: center;"><c:out value="${list.writer}" /></td>
									<td style = "text-align: center;"><fmt:formatDate value="${list.regdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/board/writeView"><button id = "writetBtn" class="ui submit button pull-left" style = "color: white;">글쓰기</button></a>
					<div>
					<section id="container">
							
					<div class="search row" style = "margin-left: 1.5em; margin-right: auto;">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option  value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group" style = "width:700px;">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" style = "width:700px;  height:2.7em;"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default" style = "height:2.7em;">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<div class="col-md-offset-3" style = "margin-left: auto; margin-right: auto;" >
						<ul class="pagination" >
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
		
			</section>
					</div>
				</div>

				<div class="ui error message"></div>

			</div>
		</div>
	</div>

</body>
</html>