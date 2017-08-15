<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->




</head>
<body>


<form action="<c:url value="/manager/review.controller/select"/>" method="get">

<button id='select'>SELECT</button>

<table id="reviewList" style="border:1;">
<thead>
	<tr>
		<th>ISBN</th>
		<th>MemberID</th>
		<th>Cont</th>
		<th>Rate</th>
		<th>Cont</th>
		<th>PostTime</th>
	</tr>
</thead>


<tbody>	
	<c:forEach var="r" items="${review}">	
	<tr>
		<td name="ISBN">${r.ISBN}</td>
		<c:url value="${r.memberID}" var="linkM"/>		
		<td name="memberID"><a href="${linkM}">${r.memberID}</a></td>		
		<td style="width:15em;"name="cont">${r.cont}</td>
		<td name="rate">${r.rate}</td>
		<td name="postTime">${r.postTime}</td>
		<td><button type="submit">Update</button>
			<button class="btn_del" type="submit">Delete</button>
		</td>		
	</tr>	
	</c:forEach>	
</tbody>
</table>		
</form>		

<script>
// 選取全部的書
$(function(){
	$('#select').click(
		function(event) {event.preventDefault();			
		$.get("/ireading/manager/bookcase.controller/select"),data,
			function(data){
			console.log('data');
		}
		})
})
</script>


</div>
                    
               


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
</html>