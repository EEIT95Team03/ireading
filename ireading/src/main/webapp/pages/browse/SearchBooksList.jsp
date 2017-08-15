<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/bookpage.css'/>">
<style type="text/css">
fieldset {
            width:570px;
            border:1px  solid #00FF00;
            border-radius:15px;
            margin:15px auto;
        }

</style>
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	<!-- 內容寫在這個區塊內(start) -->

	<div class="container">
		<c:forEach var="searchbooks" items="${booksdataList}">
		<fieldset>
		  
			<div class="row col-md-12 col-md-offset-0 ">
				<div class="row col-md-3 col-md-offset-0">
<!-- 					<img style="width: 80%;" -->
<%-- 					src="data:image/jpg;base64, ${searchbooks.byteArrayString}" /> --%>
					<img style="width: 120%;"
						src="https://media.taaze.tw/showLargeImage.html?sc=${searchbooks.Img}" />
				</div>
				<div class="row col-md-6 col-md-offset-2 ">
					<div><h4>
						<a href="<c:url value="/browse/searchBooks.controller/${searchbooks.ISBN}"/>">書名：${searchbooks.title}</a>
					</h4></div>
					<div><h4>作者：${searchbooks.author}</h4></div>
					<div><h4>出版社：${searchbooks.publisher}</h4></div>
					<div><h4>出版日期：${searchbooks.pub_Date}</h4></div>
				</div>
			</div>
			
		</fieldset>
		</c:forEach>
	</div>
	<!-- 內容寫在這個區塊內(end) -->
	<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>

</html>