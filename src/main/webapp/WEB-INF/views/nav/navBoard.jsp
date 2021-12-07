<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="/resources/semantic.min.css">
<!--<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href="/board/list">목록</a></li>
	<li><a href="/board/writeView">글 작성</a></li>
	<li>
		<c:if test="${member != null}"><a href="/member/logout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/">로그인</a></c:if>
	</li>
	<li><a href="/reservation/resList">내 예약목록</a></li>
	<li><a href="/reservation/receivedResList">예약받은 목록</a></li>
	<li>
		<c:if test="${member != null}">
			<p>${member.userId}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>  
<style>
	.navbar-header {
		font-weight:bold;
	}
</style>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style = "color:#F43F36;">지정 헌혈 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				
				<li class="active"><a href="/board/list">게시판</a></li>
				<li><a href="/reservation/resList">내 예약정보</a></li>
			</ul>
	
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${member != null}">
					<p>${member.userId}님 안녕하세요.</p>
				</c:if>
			</ul>


		</div>
</nav> -->
<style>

	.navul {
		
		width: 1024px;

		list-style-type : none;
		margin:0;
		padding:0;

		overflow: hidden;
		
	}
	div.wrap { 
			z-index: 10;	
			position: absolute;
			left:50%;
  			transform: translateX(-50%);
			height:2.6rem;
			width: 1024px;
			margin:0;
			padding:0;
			background-color: #F43F36;
	}
	
	.navul li { float: left; width: 7rem;}
	.navul li a {
		display: block;
		background-color: #F43F36;
		color: #000000;
		padding: 8px;
		text-decoration: none;
		text-align: center;
		font-weight: bold;
		
	}
	
	.navul li a.current {	
		background-color: #FF6347;
		color:white;
	}
	.navul li a:hover:not(.current) { 
		background-color: #FF6347;
		color:white;
	}
	
	.second li {list-style:none;}
	.second {
		background-color: #FF6347;
 		width: 120px;
		left:0; 
		display:none;
		
	  }
	.second li { width:120px;  }
	.navul li:hover .second {margin-left:-3rem;display: block; 	}
	
</style>
<div class = "wrap">

	<ul class="navul">
		<li><a href = "/">Home</a></li>
		<li><a class = "current" href = "/board/list">게시판</a></li>
		<li><a>예약정보</a>
			<ul class = "second">
				<li><a href="/reservation/resList">내 예약목록</a></li>
				<li><a href="/reservation/receivedResList">받은 예약목록</a></li>
	
			</ul>
		</li>
		<li>
			<c:if test="${member != null}"><a href="/member/logout">로그아웃</a></c:if>
			<c:if test="${member == null}"><a href="/">로그인</a></c:if>
		</li>
		
	</ul>
</div>