<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<title>書櫃清單</title>
<style>


body{
	font-family:微軟正黑體;
}


table {
	font-family: "微軟正黑體","Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 14px;
	margin: 45px;
	width: 850px;
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

</head>

<body>

	<c:if test="${not empty select}">
		<table id="bookslist">
			<thead>
				<tr>
					<th>書櫃編號</th>
					<th>會員編號</th>
					<th>書櫃名稱</th>
					<th>置頂</th>
					<th>公開</th>
					<th>BUTTON</th>
				</tr>
			</thead>
			
			<c:forEach var="bean" items="${select}">
				<!--controller中 		model.addAttribute("select", result); -->
				<c:url value="/pages/bookcase/bookcase.jsp" var="link">
					<c:param name="BCID" value="${bean.BCID}" />
					<c:param name="memberID" value="${bean.memberID}" />
					<c:param name="BCName" value="${bean.BCName}" />
					<c:param name="caseRank" value="${bean.caseRank}" />
					<c:param name="display" value="${bean.display}" />
				</c:url>

				<tr>
					<td class="oid"><a href="${link}">${bean.BCID}</a></td>
					<c:url value="/manager/bookcase.controller/${bean.memberID}" var="link2">
				</c:url>
					
					<td><a href="${link2}">${bean.memberID}</a></td>
					<td>${bean.BCName}</td>
					<td>${bean.caseRank}</td>
					<td>${bean.display}</td>
<%-- 					<td><c:choose> --%>
<%-- 							<c:when test="${bean.caseRank==0}"> --%>
<%-- 								<c:out value="是">checked</c:out> --%>
<%-- 							</c:when> --%>
<%-- 							<c:when test="${bean.caseRank==1}"> --%>
<%-- 								<c:out value="否">checked</c:out> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose>					 --%>
<!-- 					</td>					 -->
<%-- 					<td><c:choose> --%>
<%-- 							<c:when test="${bean.display==0}"> --%>
<%-- 								<c:out value="是">checked</c:out> --%>
<%-- 							</c:when> --%>
<%-- 							<c:when test="${bean.display==1}"> --%>
<%-- 								<c:out value="否">checked</c:out> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose></td> --%>
					<td>
						<button id="buttonUpdate" type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>
						<button id="buttonDelete" type="button" class="btn btn-danger deletebtn"><span class="glyphicon glyphicon-trash"></span></button>
					</td>
				</tr>
			</c:forEach>

			</tbody>
		</table>
		
		
		
<!-- 		<script> -->
<!-- // 		$(function() { -->
			
<!-- // 			$('#bookslist').on('click', '.deletebtn', function() { -->
<!-- // 				var bcid = $(this).parents("tr").children('.oid').text(); -->
<!-- // 				if (confirm("確定要刪除這筆訂單?")) { -->
<!-- // 					$.post("/ireading/bookcase.controller/delete", {BCID : bcid},  -->
<!-- // 					   function(data) { -->
<!-- // 					if(data[0].change==1){ -->
<!-- // 						location.reload(); -->
<!-- // 					} -->
<!-- // 					else{ -->
<!-- // 						alert("BCID "+data[0].bcid+" 刪除失敗"); -->
<!-- // 						location.reload(); -->
<!-- // 					} -->
<!-- // 					}); -->
<!-- // 				} -->
<!-- // 			}); -->
<!-- // 		}); -->
<!-- 	</script> -->
		
		
		
		

	</c:if>
	<h3>
		<a href="<c:url value="/pages/bookcase/bookcase.jsp" />">回查詢頁面</a>
	</h3>
</body>
</html>