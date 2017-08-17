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
<style>
.media-body {
	background-color: #87acab;
	padding: 15px;
	border-radius: 15px;
}

.bookcase {
	margin-bottom: 30px;
}

.btnblock {
	line-height: 50px;
}

.dropbtn {
	margin-left: 30px;
}

.dropbox {
	background-color: rgb(216, 216, 216);
	padding: 10px;
	border-radius: 15px;
	padding-bottom: 30px;
}

.bookbox {
	margin-top: 30px;
	background-color: white;
	padding: 15px;
	border-radius: 10px;
}

.title-row {
	margin-top: 10px;
	height: 40px;
}
</style>
</head>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="col-lg-12">
		<!--    內容寫這 -->




		<!-- BUTTON 新增書籍按鈕 -->
		<div class="text-center" data-toggle="modal" data-target="#newBCD">
			<button type="button" class="btn btn-lg btn-primary">
				<span class="glyphicon glyphicon-plus"></span>加入書籍
			</button>
		</div>



		<!-- DIALOG 書籍對話框 -->
		<div class="modal fade" id="newBCD" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">X <span class="sr-only">Close</span>
							</span>
						</button>
						<h3 class="modal-title">新增書籍</h3>
					</div>

					<div class="modal-body">
						<form id="neBookform">
							
							<span class="form-gorup col-xs-8" '>
								<input placeholder="請輸入書名及作者資訊"
									style="width: 25em;height:4em;" type="text"
									class="form-control" id="search" name="search" value="" />
							</span>
							<span>
								<button type="submit" class="searchB btn btn-info btn-sm"
									name="action" value="basic">
									<h4>
										<div style="height:1.5em;"class="glyphicon glyphicon-search"></div> 找書趣
									</h4>									
								</button>
							</span>							
													
							
							<div class='result'></div>
						
						</form>
					</div>
					<div class="modal-footer"></div>
					<!-- modal-footer	 		 -->
				</div>
				<!-- 	 	modal-content -->
			</div>
			<!-- 	 modal-dialog modal-md -->
		</div>
		<!-- dialog -->




	<script>
								$('.searchB').click(function(e) {
									e.preventDefault();
									$.get("/ireading/user/bookcase.controller/searchBooksList",{search:''},function(data){
										console.log(data);
										$.each(data,function(i,book){
											console.log(book.Title);
											console.log(book.Author);
											var Title = $('<div></div>').text(book.Title);
											var Author = $('<div></div>').text(book.Author);
											var Publisher = $('<div></div>').text(book.Publisher);
											var Pub_Date = $('<div></div>').text(book.Pub_Date);
											var div = $('.result');
											
											var divA = $('<div class="col-md-11" style="margin:1em;border-bottom:1pt solid gray;padding-bottom:1em;"></div>');
											var divImg = $('<div style="display:inline-block;vertical-align:middle;" class="col-md-3"></div>'); //放圖片
											var divCont = $('<div style="display:inline-block;vertical-align:middle;" class="col-md-7"></div>'); //放內容
											var divB =$('<div class="col-md-1"></div>');
											var divBtn = $('<button type="button" class="btn btn-md btn-danger"><span class="glyphicon glyphicon-plus"></span>加入</button></div>');
											divB.append(divBtn); //加入按鈕
											
											divCont.append([Title,Author,Publisher,Pub_Date]);
											divA.append([divImg,divCont,divB]);
											div.append(divA);
											
											
											
										});
									});
								});
							</script>




	

	</div>

	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>

</html>