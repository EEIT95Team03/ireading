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
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>
<%-- <a href="<c:url value='/books.controller'/>">books測試</a></br> --%>
<%-- <a href="<c:url value='/category.controller'/>">Category測試</a> --%>

	<form action="<c:url value="/category.controller"/>" method="get">
	<table>
		<tr>
		<td>ISBN : </td>
		<td><input type="text" name="categoryID" value="${param.categoryID}"></td>
		<td>${errors.categoryID}</td>
	</tr>
	<tr>
		<td>分類 : </td>
		<td><input type="text" name="categoryName" value="${param['categoryName']}"></td>
		<td>${errors.categoryName}</td>
		<td></td>
	</tr>

	
            <tr>
				<td>
				    <input type="submit" name="prodaction" value="Select">
					<input type="submit" name="prodaction" value="Insert">
					<input type="submit" name="prodaction" value="Update">
					<input type="submit" name="prodaction" value="Delete">
					<input type="button" value="Clear" onclick="clearForm()">
				</td>
			</tr>
		</table>

	</form>
<h3><span class="error">${errors.action}</span></h3>

<c:if test="${not empty delete}">
<h3>Delete Product Table Success : ${delete} row deleted</h3>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty insert}">
		<table border="1">
			<tr><td>categoryID</td><td>${insert.categoryID}</td></tr>
			<tr><td>categoryName</td><td>${insert.categoryName}</td></tr>
		</table>
	</c:if>
	
	<c:if test="${not empty update}">
		<table border="1">
			<tr><td>categoryID</td><td>${update.categoryID}</td></tr>
			<tr><td>categoryName</td><td>${update.categoryName}</td></tr>
		</table>
	 </c:if>


</body>
</html>