<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>書籍資料管理</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/css/bootstrap-theme.min.css"/>"
	rel="stylesheet" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>

</head>
<body>

	<form action="<c:url value="/manager/books.controller/booksMainPage"/>" method="get">
		<input type="text" name="ISBN">
		<input type="submit" name="action" value="Select">
	
	</form>

</body>
</html>