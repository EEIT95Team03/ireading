<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>顯示書籍清單</title>
<style>
table {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 850px;
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
</head>
<body>
<c:if test="${not empty select}">
	<table>
		<thead>
			<tr>
				<th>分類編號</th>
				<th>分類名稱</th>
			</tr>
		</thead>
		<c:forEach var="bean" items="${select}">
			<c:url value="/pages/book/Category.jsp" var="link">
				<c:param name="categoryID" value="${bean.categoryID}" />
				<c:param name="categoryName" value="${bean.categoryName}" />
			</c:url>
			<tr>
				<td><a href="${link}">${bean.categoryID}</a></td>
				<td>${bean.categoryName}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</c:if>
<h3><a href="<c:url value="/pages/book/Category.jsp" />">回查詢頁面</a></h3>
</body>
</html>