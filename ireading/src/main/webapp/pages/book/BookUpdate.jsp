<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>書籍狀態</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/css/bootstrap-theme.min.css"/>"
	rel="stylesheet" />
<style>
table {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	position: relative;
	left: 50px; 
}

th {
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe;
	border-top: 4px solid #aabcfe;
	border-bottom: 1px solid #fff;
	color: #039;
}

td {
	padding: 8px;
	background: #e8edff; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
}

tr:hover td {
	background: #d0dafd;
	color: #339;
}
	
	</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>

</head>
<body>
	<form action="<c:url value="/manager/books.controller"/>" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
		<td>ISBN : </td>
		<td><input type="text" name="ISBN" value="${responseData.ISBN}"></td>
		<td>${errors.ISBN}</td>
	</tr>
	<tr>
		<td>分類 ID: </td>
		<td><input type="text" name="categoryID" value="${responseData.categoryID}"></td>
		 <td>${errors.categoryID}</td>
		<td></td>
	</tr>

	<tr>
		<td>書名 : </td>
		<td><input type="text" name="title" value="${responseData.title}"></td>
		<td>${requestScope["errors"].title}</td>
	</tr>
	<tr>
		<td>封面 : </td>
		<td><input type="file" name="cover" value="${responseData.byteArrayString}"></td>
	</tr>
	<tr>
		<td>作者 : </td>
		<td><input type="text" name="author" value="${responseData.author}"></td>
		<td>${requestScope.errors["author"]}</td>
	</tr>
	<tr>
		<td>出版社 : </td>
		<td><input type="text" name="publisher" value="${responseData.publisher}"></td>
		<td>${requestScope.errors["publisher"]}</td>
	</tr>
	<tr>
		<td>語言 : </td>
		<td><input type="text" name="language" value="${responseData.language}"></td>
		<td>${requestScope.errors["language"]}</td>
	</tr>
	<tr>
		<td>出版日期 : </td>
		<td><input type="text" name="pub_Date" value="${responseData.pub_Date}"></td>
		<td>${requestScope.errors["expire"]}</td>
	</tr>
	<tr>
		<td>價錢 : </td>
		<td><input type="text" name="ori_Price" value="${responseData.ori_Price}"></td>
		<td>${requestScope.errors["ori_Price"]}</td>
	</tr>
	<tr>
		<td>簡介 : </td>
		<td><input type="text" name="abstracts" value="${responseData.abstracts}"></td>
		<td>${requestScope.errors["abstracts"]}</td>
	</tr>
	<tr>
		<td>點擊率 : </td>
<%-- 		<td>${param.click}</td> --%>
		<td><input type="text" name="click" value="${responseData.click}" disabled="disabled"></td>
		<td>${requestScope.errors["click"]}</td>
	</tr>
	<tr>
		<td>評分平均 : </td>
<%-- 		<td>${param.rateAvg}</td> --%>
		<td><input type="text" name="rateAvg" value="${responseData.rateAvg}" disabled="disabled"></td>
		<td>${requestScope.errors["rateAvg"]}</td>
	</tr>
            <tr>
				<td>
					<input type="submit" name="prodaction" value="Update">
<!-- 					<input type="submit" name="prodaction" value="Delete"> -->
					<input type="button" value="back" onclick="history.go(-1)">
				</td>
			</tr>
		</table>

	</form>

</body>
</html>