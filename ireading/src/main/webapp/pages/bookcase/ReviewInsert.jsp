<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>

<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">



</head>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="col-lg-8 col-lg-offset-2">
		<!--    內容寫這 -->
		
		

		
		
		<!-- ●●●●● 評論開始	 -->
		<div id='write'>撰寫評論</div>	
			
			<div id='wCont' style="display:none">				
				<form id="wwCont">
					<div class='1'><label>會員編號</label>
						<input type='text' id='n_MemberID' name='MemberID' value=""/>${MemberID}
					</div>
					<div class='2'><label>ISBN</label>
						<input type='text' id='n_ISBN' name='ISBN' value=""/>${ISBN}
					</div>
					<div class='3' style='display:inline-block;'><lable>評論</lable>
						<textarea style='width: 50em; height: 8em;' type="text"
							  placeholder="請輸入五百字以內的評論"class="form-control" id="w_Cont" name="Cont" value="" ></textarea>
					</div>
					<div class='4' style='width:5em;'><label>評分</label>
						<input min='1' max='5' type="number" class="form-control" id="n_rate" name="rate" value="">
					</div>
				
					<button class="btn btn-sm btn-primary btn_enter" type="submit">確定</button>
					<button class="btn_del btn btn-sm btn-danger" type="submit">取消</button>
				</form>
			</div>			
		</div>



		<script>
			$(function() {
				$('#write').click(function(event) {					
					$('#wCont').slideToggle();
				});
			})
		</script>
		
		<script>
			$(function(){$('.btn_enter').click(
				function(event){
				event.preventDefault();
				var data = $('#wwCont').serialize();
				$.post("/ireading/manager/review.controller/insert", data,
				function(data){
					console.info(data);
					if("1" == data){
						alert("新增評論成功");
						location.reload();
					} else {
						alert("新增評論失敗");
						}
					})
				})				
			})
		</script>

<!-- ●●●●● 評論結束	 -->





	</div>

<div>123</div>


	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>
	<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
</html>