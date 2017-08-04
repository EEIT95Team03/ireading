<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
*{
	font-family: 微軟正黑體
}

table {
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
<title>Show Member Table</title>
</head>
<body>
	<h3>Select Member Table Result : ${fn:length(select)} row(s) selected</h3>
	<c:if test="${not empty select}">
		<table>
			<thead>
				<tr>
					<th>MemberID</th>
					<th>Account</th>
					<th>Password</th>
					<th>Name</th>
					<th>Nick Name</th>
					<th>Address</th>
					<th>Cell Phone</th>
					<th>Birthday</th>
					<th>Registration Date</th>
					<th>Gender</th>
					<th>Income</th>
					<th>Photo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${select}">
					<c:url value="/pages/member/member_query.jsp" var="link">
						<c:param name="memberID" value="${bean.memberID}" />
						<c:param name="account" value="${bean.account}" />
						<c:param name="pwd" value="${bean.pwd}" />
						<c:param name="MName" value="${bean.MName}" />
						<c:param name="nickName" value="${bean.nickName}" />
						<c:param name="addr" value="${bean.addr}" />
						<c:param name="cell" value="${bean.cell }" />
						<c:param name="birthday" value="${bean.birthday }" />
						<c:param name="regDate" value="${bean.regDate}" />
						<c:param name="gender" value="${bean.gender}" />
						<c:param name="income" value="${bean.income}" />
						<c:param name="photo" value="${bean.byteArrayString }"/>
					</c:url>
					<tr>
						<td><a href="${link}">${bean.memberID}</a></td>
						<td>${bean.account}</td>
						<td>${bean.pwd}</td>
						<td>${bean.MName}</td>
						<td>${bean.nickName}</td>
						<td>${bean.addr}</td>
						<td>${bean.cell}</td>
						<td>${bean.birthday}</td>
						<td>${bean.regDate}</td>
						<td>
							<c:choose>
								<c:when test="${bean.gender==0}">
									<c:out value="男"/>
								</c:when>
								<c:when test="${bean.gender==1}">
									<c:out value="女"/>
								</c:when>
							</c:choose>
						</td>
						<td>${bean.income}</td>
						<td><img src="data:image/png;base64, ${bean.byteArrayString }"/></td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<h3>
		<a href="<c:url value="${refer}" />">Member Table</a>
	</h3>
</body>
</html>