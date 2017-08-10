<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
body {
	font-family: 微軟正黑體;
}

.btn-glyphicon {
	padding: 8px;
	background: #ffffff;
	margin-right: 4px;
}

.icon-btn {
	padding: 1px 15px 3px 2px;
	border-radius: 50px;
}

/* 書櫃明細 */
.thumbnails li>.fff .caption {
	background: #fff !important;
	padding: 10px
}

/* Page Header */
.page-header {
/* 	font-family:微軟正黑體;  */
/*     font-size: 18pt;  */
/*     font-weight: bold; */
/*     line-height:70px; */
/* 	background: #FFD1A4; */
 	padding: 10px 30px 10px 0px; 
/* 	height: 3.5em; */
/* 	color: ##a4d6c4; */
/* 	border-radius: 20px */
}

.page-header h3 {
	line-height: 0.88rem;
	color: #000;
}

ul.thumbnails {
	margin-bottom: 0px;
}

/* Thumbnail Box */
.caption h4 {
	color: #444;
}

.caption p {
	color: #999;
}

/* Carousel Control */
.control-box {
	text-align: right;
	width: 100%;
	padding-bottom: 10px
}

.carousel-control {
	background: #666;
	border: 0px;
	border-radius: 0px;
	display: inline-block;
	font-size: 34px;
	font-weight: 200;
	line-height: 18px;
	opacity: 0.5;
	padding: 4px 10px 0px;
	position: static;
	height: 30px;
	width: 15px;
}

/* Mobile Only */
@media ( max-width : 767px) {
	.page-header, .control-box {
		text-align: center;
	}
}

@media ( max-width : 479px) {
	.caption {
		word-break: break-all;
	}
}

li {
	list-style-type: none;
}

::selection {
	background: #ff5e99;
	color: #FFFFFF;
	text-shadow: 0;
}

::-moz-selection {
	background: #ff5e99;
	color: #FFFFFF;
}

/* 書櫃明細 */
</style>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
	
</script>


<title>我的書櫃</title>

</head>
<body>

	<h3> <a href="<c:url value="/pages/bookcase/bookcase.jsp" />">回查詢頁面</a> </h3>
	<input type="button" onclick="history.back()" value="回到上一頁"></input>

<!-- BUTTON 新增書櫃按鈕 -->
	<div style="font-size:16pt;font-family:微軟正黑體;wigth:250pt;font-width:bold;" data-toggle="modal" data-target="#newBC" >
	<button type="button" class="btn btn-info" style="font-size:20pt;font-family:微軟正黑體;font-width:bold;height:40pt;border-radius:10pt;">✚</button>
	新增書櫃</div>
	
	
<!-- Modal-Dialog 新增書櫃 對話框 -->
	<div class="modal fade" id="newBC" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">新增書櫃</h3>
				</div>

				<div class="modal-body" style="overflow: auto;">

					<!--content goes here -->
					<form id="newform">
						<div class="form-group col-xs-12 col-md-6" style="display: none">
							<label for="BCID">書櫃編號</label> <input type="text"
								class="form-control" id="new_BCID" name="BCID" value="" >
						</div>
						<div class="form-group col-xs-12" style="display: none">
							<label for="MemberID">會員編號</label> <input type="text"
								class="form-control" id="new_MemberID" name="MemberID"
								value="${MemberID}" readonly>
						</div>

						<div class="form-group col-xs-12">
							<label for="BCName">書櫃名稱</label> <input type="text"
								class="form-control" id="new_BCName" name="BCName" value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="caseRank">置頂</label> <select name="caserank">
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>

						<div class="form-group col-xs-12">
							<label for="display">公開</label> <select name="display">
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>
						<div class="form-group col-xs-12">
							<button class="btn btn-primary" id="new_btn">新增</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


<!--LAYOUT 書櫃 排版 -->
	<div class="container" id="bookCaselist">
		<div class="col-xs-12">
			<c:forEach var='x' items='${bookCases}'>
				<div class="bc">
					<div class="page-header" style="height:3.75em;border-bottom-color:#CEFFCE;border-bottom-style:solid;border-radius:50pt;border-width:3pt;" >
						<div class="oid" style="display: none">${x.BCID}</div>
						<div style='background-color:#CEFFCE;width:10em;border-radius:50pt;float:left;padding:5pt 0pt 5pt 0pt;font-size:16pt;font-eight:bold;font-family:微軟正黑體;text-align:center;'>
						${x.BCName} 
						</div>
						<span style='float: right;'> 
							<c:choose>
								<c:when test="${x.caseRank==0}">
									<c:out value="是">checked</c:out>
								</c:when>
								<c:when test="${x.caseRank==1}">
									<c:out value="否">checked</c:out>
								</c:when>
							</c:choose> <c:choose>
								<c:when test="${x.display==0 }">
									<c:out value="是">checked</c:out>
								</c:when>
								<c:when test="${x.display==1 }">
									<c:out value="否">checked</c:out>
								</c:when>
							</c:choose>

							<button type="button" class="btn btn-info updatebtn"
								data-toggle="modal" data-target="#updatebc">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="button" class="btn btn-danger deletebtn">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</span>						
					</div>					

					<div class="data hidden">
						<div value="BCID">${x.BCID}</div>
						<div value="MemberID">${x.memberID}</div>
						<div value="BCName">${x.BCName}</div>
						<div value="CaseRank">${x.caseRank}</div>
						<div value="Display">${x.display}</div>
					</div>
					
					<div class="books" ></div>


<div id="divNewBcd">					
<!-- BUTTON 新增書籍按鈕 -->
	<div style="font-size:16pt;font-family:微軟正黑體;wigth:250pt;font-width:bold;" 
		 data-toggle="modal" data-target="#newBCD" >
	<button type="button" class="btn btn-warning" style="font-size:20pt;font-family:微軟正黑體;font-width:bold;height:40pt;border-radius:10pt;">✚</button>
	新增書籍</div>

<!-- DIALOG 書籍對話框 -->
<div class="modal fade" id="newBCD" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
	 <div class="modal-dialog modal-md">
	 	<div class="modal-content">
	 		<div class="modal-header">
	 			<button type="button" class="close" data-dismiss="modal">
	 				<span aria-hidden="true">X
	 					<span class="sr-only">Close</span>
	 				</span>
	 			</button>
	 			<h3 class="modal-title">新增書籍</h3>
	 		</div>
	 		
	 		<div class="modal-body" style="overflow:auto;">
	 		<form id="neBookform">
	 			<div class="form-gorup col-xs-12">
	 				<label for="ISBN">ISBN
	 					<input type="text" class="form-control" id="n_isbn" name="ISBN" value=""/>
	 				</label>
	 			</div>
	 			<div class="form-group col-xs-12">
	 				<label for="title">書名</label>
	 					<input type="text" class="form-control" id="n_title" name="title" value=""/>	 				
	 			</div>
	 			<div class="form-group col-xs-12">
	 				<label for="author">作者</label>
	 					<input type="text" class="form-control" id="n_author" name="author" value=""/>	 				
	 			</div>
	 			<div class="form-group col-xs-12" style="float:right;">
					<button class="btn btn-danger" id="btn_BCD">新增</button>
					<button class="btn btn-default" data-dismiss="modal">取消</button>
				</div>	 		
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
</div>
					
					
					
				</div>
			</c:forEach>
		</div><!-- /.col-xs-12 -->
	</div><!-- /.container -->


<!-- Dialog 刪除 一本書籍 -->
<!-- <div class="modal fade bs-example-modal-sm" id="bookDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--         <h4 class="modal-title" id="myModalLabel">是否刪除此本書籍？</h4> -->
<!--       </div> -->
<!--      	 <div class="modal-body"> -->
<!--       	</div> -->
<!--       <div class="modal-footer">         -->
<!--         <button class="btn btn-danger delete_Books" >是</button> -->
<!-- 		<button class="btn btn-default" data-dismiss="modal">取消</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div>	 -->
	
	


	<!-- 修改書櫃 -->
	<div class="modal fade" id="updatebc" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">修改書櫃</h3>
				</div>

				<div class="modal-body" style="overflow: auto;">

					<!--content goes here -->
					<form id="updateform">
						<div class="form-group col-xs-12 col-md-6" style="display: none">
							<label for="BCID">書櫃編號</label> <input type="text"
								class="form-control" id="update_BCID" name="BCID" value="">
						</div>
						<div class="form-group col-xs-12" style="display: none">
							<label for="MemberID">會員編號</label> <input type="text"
								class="form-control" id="update_MemberID" name="MemberID"
								value="${MemberID}" readonly>
						</div>

						<div class="form-group col-xs-12">
							<label for="BCName">書櫃名稱</label> <input type="text"
								class="form-control" id="update_BCName" name="BCName" value="">
						</div>

						<div class="form-group col-xs-12">
							<label for="caseRank">置頂</label> <select name="update_caserank">
								<option class="true" value="0">是</option>
								<option class="false" value="1">否</option>
							</select>
						</div>

						<div class="form-group col-xs-12">
							<label for="display">公開</label> <select name="update_display">
								<option class="true" value="0">是</option>
								<option class="false" value="1">否</option>
							</select>
						</div>
						<div class="form-group col-xs-12">
							<button class="btn btn-primary" id="up_btn">修改</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>

					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>










</body>

<!-- 新增書櫃	 -->
<script>
		$(function() {$('#new_btn').click(
			function(event) {event.preventDefault();
			var data = $('#newform').serialize();
			$.post("/ireading/manager/bookcase.controller/insert", data,
			function(data) {console.info(data)
			if ("1" == data) {
				alert("新增書籍資料成功");
				location.reload();
			} else {
				lert("新增書籍資料失敗");
// 	        			$('#new_BCID + .msg').text(data[0].BCID);
			}
		});
	});
});
</script>	


<!--  更新書櫃  塞值-->
<script>
	$(function() {
		$("#bookCaselist").on(
				"click",
				".updatebtn",
				function(event) {
					console.log($(this).html());
					var div = $(this).parents(".bc").children('.data');
					console.log(div.children('div[value="BCID"]').text());
					$("#updatebc").find("#update_BCID").attr("value",
							div.children('div[value="BCID"]').text());
					$("#updatebc").find("#update_MemberID").attr("value",
							div.children('div[value="MemberID"]').text());
					$("#updatebc").find("#update_BCName").attr("value",
							div.children('div[value="BCName"]').text());

					if (div.children('div[value="CaseRank"]').text() == "1") {
						$("#updatebc").find("select[name='update_caserank']")
								.children('.false').prop("selected", true);
					} else {
						$("#updatebc").find("select[name='update_caserank']")
								.children('.true').prop("selected", true);
					}

					if (div.children('div[value="Display"]').text() == "1") {
						$("#updatebc").find("select[name='update_display']")
								.children('option[value="1"]').prop("selected",
										true);
					} else {
						$("#updatebc").find("select[name='update_display']")
								.children('option[value="0"]').prop("selected",
										true);
					}

				});
	})
</script>

<!-- 修改書櫃	 -->
<script>
	$(function() {
		$('#up_btn').click(function(event) {
			event.preventDefault();
			var data = $('#updateform').serialize();
			$.post("/ireading/manager/bookcase.controller/update", data,function(data) {
						console.log(data)
						if (data[0].change=="1") {
							alert("修改書櫃資料成功");
							location.reload();
						} else {
							if(data[0].error!=""){
								alert(data[0].error);
							}
							else{
							alert("修改書櫃資料失敗");}
							// 	        			$('#new_BCID + .msg').text(data[0].BCID);
						}
					});
		});
	});
</script>

<!-- 刪除書櫃			 -->
	<script>
		$(function() {				
			$('#bookCaselist').on('click','.deletebtn',function() {
			var bcid = $(this).parents(".page-header").children('.oid').text();
			console.log(bcid);
			if (confirm("確定要刪除此書櫃？")) {
			$.post("/ireading/manager/bookcase.controller/delete", {BCID : bcid}, 
				function(data) {
				if (data[0].change == 1) {
					location.reload();
					} else {alert("BCID" + data[0].bcid + " 刪除失敗");
				location.reload();
				}
				});
			}
		});
	});
</script>


<!-- 刪除一本書籍 -->
<script>
	$(function(){
		$('.books').on('click','.btn_bookss',function(){
			var isbn = $(this).parent(".aBook").find(".isbn").text();
			var bcid=$(this).parents(".bc").find('.oid').text();
// 			var isbn = $(this).text();
			alert(bcid);
			$.post("/ireading/manager/bookcase.controller/deleteBCD", {ISBN : isbn,BCID:bcid},
				function(data) {
				if(data[0].change == 1){
					location.reload();	
				}else{ alert("ISBN" + data[0].isbn + " 刪除失敗")
					location.reload();
				}				
			});
		});
	});
</script>

<!--  書櫃明細 放到書櫃   -->
<script>
	$(function() {
		$(".data").each(function() {
		var bcid = $(this).children('div[value="BCID"]').text();
		var div = $(this).parent(".bc").children('div[class="books"]').attr('style','width:200px;text-align:center;');
//			var divT = div.attr('style','margin:0px auto;');
		console.log(bcid);
		$.post("/ireading/manager/bookcase.controller/getBCD",{BCID : bcid},
		function(data) {
		console.log(data);
		$.each(data,function(i,bc) {
		var divT = $('<div class="aBook"></div>')
		var bdelete = $('<div style="color:red;font-weight:bold;" class="btn btn_bookss">✖</div>'); 
// 		var bdelete = $('<div class="btn_bookss" style="color:red;font-weight:bold;>✖</div>');
		var img = $('<div><img style="width:110px;height:150px;"/></div>');
		var title = $('<div style="font-size:12pt;font-weight:bold;text-align:center;"></div>').text(bc.booksBean.title);
		var author = $('<p style="text-align:center;"></p>').text(bc.booksBean.author);
		var isbn = $('<p class="hidden isbn"></p>').text(bc.booksBean.ISBN);
		divT.append([bdelete,img,title,author,isbn]);
		div.append(divT);
		});
	});		
});
});
</script>

</html>