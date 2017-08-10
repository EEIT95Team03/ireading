<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<title>我的書櫃</title>

<style>

body{
	font-family:"微軟正黑體";
}


.signbuttons {
	margin-bottom: 35px;
	background: #2196f3;
	border: none;
}

table {
	font-family: "微軟正黑體","Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 14px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	position: relative;
	left: 50px;
}

th {
	font-size: 14px;
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
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>
</head>
<body>
	<%-- <a href="<c:url value='/books.controller'/>">books測試</a></br> --%>
	<%-- <a href="<c:url value='/category.controller'/>">Category測試</a> --%>

	<form action="<c:url value="/manager/bookcase.controller"/>" method="get">
		<table>
			<tr>
				<td>書櫃編號BCID :</td>
				<td><input type="text" name="BCID" value="${param.BCID}"></td>
				<td>${errors.BCID}</td>
			</tr>
			<tr>
				<td>會員編號MemberID :</td>
				<td><input type="text" name="memberID"
					value="${param['memberID']}"></td>
				<td>${errors.memberID}</td>
				<td></td>
			</tr>

			<tr>
				<td>書櫃名稱BCName :</td>
				<td><input type="text" name="BCName" value="${param.BCName}"></td>
				<td>${requestScope["errors"].BCName}</td>
			</tr>
		
		<tr>
				<td>置頂CaseRank :</td>
				<td><input type="radio" name="caseRank" value="0"
				<c:if test="${param.caseRank==0 }">
				checked
				</c:if> />
				是
				 <input  type="radio" name="caseRank" value="1"
				<c:if test="${param.caseRank==1 }">
				checked
				</c:if> />
				否</td>
				<td>${requestScope.errors["caserank"]}</td>
			</tr>
			<tr>
				<td>公開Display :</td>
				<td><input type="radio" name="display" value="0"
				<c:if test="${param.display==0 }">
				checked
				</c:if> />
				是
				 <input  type="radio" name="display" value="1"
				<c:if test="${param.display==1 }">
				checked
				</c:if> />
				否</td>
				<td>${requestScope.errors["display"]}</td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="submit" name="prodaction"
					value="Select" class=" signbuttons btn btn-primary"> 
				<input type="submit" name="prodaction" value="Insert"
					class=" signbuttons btn btn-primary"> 
					<input type="submit"
					name="prodaction" value="Update"
					class=" signbuttons btn btn-primary"> 
					<input type="submit"
					name="prodaction" value="Delete"
					class=" signbuttons btn btn-primary"> 
					<input type="button"
					value="Clear" onclick="clearForm()"
					class=" signbuttons btn btn-primary">
					 <!-- 					<input type="submit" name="prodaction" value="getBCID"> -->

				</td>
			</tr>
		</table>

	</form>
	<h3>
		<span class="error">${errors.action}</span>
	</h3>

	<c:if test="${not empty delete}">
		<h3>Delete Product Table Success : ${delete} row deleted</h3>
		<script type="text/javascript">
			clearForm();
		</script>
	</c:if>

	<c:if test="${not empty insert}">
		<table border="1">
			<tr>
				<td>書櫃編號</td>
				<td>${insert.BCID}</td>
			</tr>
			<tr>
				<td>會員編號</td>
				<td>${insert.memberID}</td>
			</tr>
			<tr>
				<td>書櫃名稱</td>
				<td>${insert.BCName}</td>
			</tr>
			<tr>
				<td>置頂</td>
				<td>${insert.caseRank}</td>
			</tr>
			<tr>
				<td>公開</td>
				<td>${insert.display}</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${not empty update}">
		<table border="1">
			<tr>
				<td>書櫃編號</td>
				<td>${update.BCID}</td>
			</tr>
			<tr>
				<td>會員編號</td>
				<td>${update.memberID}</td>
			</tr>
			<tr>
				<td>書櫃名稱</td>
				<td>${update.BCName}</td>
			</tr>
			<tr>
				<td>置頂</td>
				<td>${update.caseRank}</td>
			</tr>
			<tr>
				<td>公開</td>
				<td>${update.display}</td>
			</tr>
		</table>
	</c:if>


</body>
</html>