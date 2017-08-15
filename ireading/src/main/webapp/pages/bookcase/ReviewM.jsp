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

<!-- 刪除一本書籍的評論 -->
<script>
	$(function() {
		$('.bookCont').on('click', '.btn_del', function() {
			var isbn = $(this).parents(".aCont").find('.ISBN').text();
			var memberID = $(this).parents(".aCont").find('.memberID').text();
			// 			alert(isbn);
			// 			alert(memberID);
			if (confirm("確定要刪除此評論？")) {
				$.post("/ireading/manager/review.controller/delete", {
					ISBN : isbn,
					MemberID : memberID
				}, function(data) {
					if (data[0].change == 1) {
						location.reload();
					} else {
						alert("memberID" + data[0].memberID + " 刪除失敗");
						location.reload();
					}
				});
			}
		});
	});
</script>


<!--  更新評論  塞值-->
<script>
	$(function() {
		//只能用class
		$('.bookCont').on('click', '.btn_upt', function(event) {
			console.log($(this).html);
			var div = $(this).parents(".aCont").children(".aCCont")

			var memberID = div.children(".memberID").text();
			var ISBN = div.children(".ISBN").text();
			var rate = div.children(".rate").attr("value");
			var cont = div.children(".cont").text();

			var form = $('#newCon')
			form.find('.memberID').attr("value", memberID);
			form.find('.ISBN').attr("value", ISBN);
			form.find('#n_rate').attr("value", rate);
			form.find('#n_Cont').attr("value", cont).text(cont);

		});
		
//Update 更新評論
		$('#newCon #btn_ContS').click(
				function(event) {
					event.preventDefault();
				$('#ContErr').remove();
					var data = $('#neBookCont').serialize();
					var Cont = $('#neBookCont').find('#n_Cont').val();
					if(Cont==""){
						var ContErr = $('<div id="ContErr" style="color:red;">請輸入評論</div>');
						$('#neBookCont').find('#n_Cont').after(ContErr);
						return;
					}										
					$.post("/ireading/manager/review.controller/update", data,
							function(data) {														
								console.log(data[0].change);
								if (data[0].change == "1") {
									alert("更新成功");
									location.reload();
								} else {
									alert("更新失敗");
								}

							});

				});

	})
</script>

</head>
<body>
	<c:import url="/pages/templates/user/usermenu.jsp"></c:import>

	<div class="col-lg-8 col-lg-offset-2">
		<!--    內容寫這 -->
		

		<!-- 顯示會員評論 -->
		<c:forEach var='M' items="${findByMemberID}">
			<div class='bookCont'>
				<div class='aCont' style='border-bottom: 4px #E0E0E0 solid;margin-bottom:10px;vertical-align:middle;height:15em;'>
<!--●●●連結書籍資料 -->
					<div class='bookinfo'
						style='width: 15em; display: inline-block;'>
						<div style='text-align:center;'>
							<img src='https://media.taaze.tw/showLargeImage.html?sc=11100191485' width='100' height='135'/></div>
						<div class='title' name='title' style='text-align:center;'>加入書籍名稱</div>
					</div>
					
					<div class='aCCont'
						style='width: 28em; display: inline-block;vertical-align:top;'>
						<div class='memberID' style="display: none;">${M.memberID}</div>
						<div class='ISBN' style='display: none;'>${M.ISBN}</div>
						<div style='text-align: right;'>${M.postTime}</div>
						<div class="rate" style='text-align:right;' value="${M.rate}"><c:forEach begin="1" end="${M.rate}"><img
			src='http://images.gofreedownload.net/thumps_middle/yellow-star-26785.jpg'
			width='20px' /></c:forEach></div>
						<div class='cont' >${M.cont}</div>
					</div>
					<div class='bookinfo' style='display: inline-block;vertical-align:TOP;margin-left:10pt;'>
						<button class="btn btn-sm btn-primary btn_upt" type="submit" data-toggle="modal"
							data-target="#newCon">Update</button>
						<button class="btn_del btn btn-sm btn-danger" type="submit">Delete</button>
					</div>
				</div>
			</div>
		</c:forEach>

		<!-- DIALOG 修改評論對話框 -->
		<div class="modal fade" id="newCon" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">X <span class="sr-only">Close</span>
							</span>
						</button>
						<h3 class="modal-title">修改書籍評論</h3>
					</div>

					<div class="modal-body" style="overflow: auto;">
						<form id="neBookCont">
							<div class="form-gorup col-xs-12">
								<label for="Cont">評論 <textarea
										style='width: 30em; height: 8em;' type="text"
										class="form-control" id="n_Cont" name="Cont" value=""></textarea>
								</label>
							</div>
							<div class="form-gorup col-xs-12">
								<label for="rate">評分 <input type="number"
									class="form-control" id="n_rate" name="rate" value=""></input>
								</label>
							</div>
							<input class='memberID' name="MemberID" style="display: none;" />
							<input class='ISBN' name="ISBN" style='display: none;' />
							<div class="form-group col-xs-12" style="float: right;">
								<button class="btn btn-danger" id="btn_ContS">確定</button>
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




	<c:import url="/pages/templates/user/userfooter.jsp"></c:import>
	<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
</html>