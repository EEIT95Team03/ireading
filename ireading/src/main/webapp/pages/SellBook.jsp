<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<%-- <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" /> --%>
<%-- <link href="<c:url value="/css/bootstrap-theme.min.css"/>" --%>
<!-- 	rel="stylesheet" /> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js">
	
</script>
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
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

<div class="container">
		<div class="row col-md-8 col-md-offset-2 custyle">
			<table class="table table-striped custab" id="productlist">
				<thead>
					<tr>
						<th>商品編號</th>
						<th>ISBN</th>
						<th>書名</th>
						<th>原價</th>
						<th>商品細節描述</th>
						<th>二手價</th>
						<th>銷售所得</th>
						<th></th>
						<th class="text-center">
							<button class="btn btn-primary btn-xs pull-right"
								data-toggle="modal" data-target="#newproduct">享。新增商品</button>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${dataLs}">
						<tr>
						    <td class="pid">${product.ProductID}</td>
						    <td>${product.ISBN}</td>
<%-- 						<td><input value="${product.ISBN}"></input></td> --%>						
							<td>${product.Title}</td>
							<td >${product.Ori_Price}</td>
							<td class="detail">${product.detail}</td>
							<td class="price">${product.productPrice}</td>
							<td></td>
							
							
							<td class="text-center">
						<c:url value="/sellbook.controller/goUpdatePage" var="link">
							<c:param name="ProductID" value="${product.ProductID}"></c:param>
						</c:url> <a class='btn btn-info btn-xs editbtn' value="javascript:excuteUpdate('${product.ProductID}')"> 
						    <span class="glyphiconglyphicon-edit"></span>享。修改
							</a>
							<a class='btn btn-success btn-xs savebtn hidden' value="javascript:excuteUpdate('${product.ProductID}')"> 
						    <span class="glyphiconglyphicon-edit"></span>享。儲存
							</a>
							<a class='btn btn-danger btn-xs cancelbtn hidden' value="javascript:excuteUpdate('${product.ProductID}')"> 
						    <span class="glyphiconglyphicon-edit"></span>享。取消
							</a>
								<button class="btn btn-danger btn-xs deletebtn">
									<span class="glyphicon glyphicon-remove"></span>享。刪除
								</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div>
		<form action="<c:url value="/user/product/sellBook/SellBookMainPage"/>" method="get">
		<input type="submit" value="Select">
		<!--<input type="submit" name="prodaction" value="Insert"> -->
		<!--<input type="submit" name="prodaction" value="Update">  -->
		<!--<input type="submit" name="prodaction" value="Delete">  -->
	    </form>
	</div>
	
	<div class="modal fade" id="newproduct" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">享。新增商品</h3>
				</div>
				<div class="modal-body" style="overflow: auto;">

					<!-- content goes here -->
					<form id="newform">     
						<div class="form-group col-xs-12 col-md-6">
							<label for="ISBN">ISBN</label> 
							<input type="text" class="form-control" id="ISBN" name="ISBN"
								value="${product.booksBean.ISBN}">
								<label class="msg"></label>
						</div>
						<div class="form-group col-xs-12">
							<label for="Title">書名</label> <input type="text"
								class="form-control" id="title" name="title"
								value="${product.booksBean.title}">
						</div>
						<div class="form-group col-xs-12">
							<label for="ori_Price">原價</label> <input type="number"
								class="form-control" id="ori_Price" name="ori_Price"
								value="${product.booksBean.ori_Price}">
						</div>
						<div class="form-group col-xs-12">
							<label for="productPrice">二手價</label> <input type="number"
								class="form-control" id="productPrice" name="productPrice"
								value="${product.productPrice}">
						</div>
						<div class="form-group col-xs-12">
							<label for="detail">商品細節描述</label> <input type="text"
								class="form-control" id="detail" name="detail"
								value="${product.detail}">
						</div>
						<div>
							<button class="btn btn-primary" id="new_btn">享。儲存</button>
							<button class="btn btn-default" data-dismiss="modal">享。取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	
    <form id="updateForm" method="post" action="${pageContext.request.contextPath}/user/sellBook.controller/goUpdatePage"></form>
    
</body>
	<script>
	
	//insert
	$(function() {
		$('#new_btn').click(function(event) {
			event.preventDefault();
			var data = $('#newform').serialize();
			
			$.post("/ireading/user/product/sellBook/insert", data, function(data) {
				console.info(data);
				
				if("Success" == data){
					alert("新增資料成功！");
					location.reload();
				}
				else{
					alert("新增資料失敗！");
					$('#new_btn + .msg').text(data[0].ISBN);
				}
			});
		});
	
	//delete 
	$('#productlist').on('click', '.deletebtn', function() {
		var id = $(this).parents("tr").children('.pid').text();
		if (confirm("確定要刪除這筆商品嗎？這位大大")) {
			$.post("/ireading/user/product/sellBook/delete", {
				ProductID : id
			}, function(data) {
				if (data[0].change == 1) {
					location.reload();
				} else {
					alert("商品編號 " + data[0].id + " 刪除失敗");
					location.reload();
				}
			});}
		});
	
    //editbtn
	$("#productlist").on("click",".editbtn",function(event){
		var tr=$(this).parents("tr");
		var price=tr.find(".price").text();
		tr.find(".price").html("<input type='number' name='price' value='"+price+"''/>");
		var detail=tr.find(".detail").text();
		tr.find(".detail").html("<input type='text' name='detail' value='"+detail+"''/>");
		
		
		$(".editbtn").toggleClass( "hidden" );
		$(".deletebtn").toggleClass( "hidden" );
		tr.find(".savebtn").toggleClass( "hidden" );
		tr.find(".cancelbtn").toggleClass( "hidden" );		
	});
	
	
	//savebtn
	$("#productlist").on("click",".savebtn",function(event){
		var tr=$(this).parents("tr");
        var pid=tr.find(".pid").text();
        var price=tr.find("input[name='price']").val();
        var detail=tr.find("input[name='detail']").val();
        
        $.post("/ireading/user/product/sellBook/update",
        		{Product:pid, Price:price,Detail:detail},function(data){
        			if(data[0].change=="1"){
    					location.reload();
    				}
    				else{
    					alert("新增資料失敗！");
    					location.reload();
    				}
        		});
        $(".editbtn").toggleClass( "hidden" );
		$(".deletebtn").toggleClass( "hidden" );
		tr.find(".editbtn").toggleClass( "hidden" );
	});
	
	$("#productlist").on("click",".cancelbtn",function(event){
		location.reload();
	})
	
	})
	</script>
	<script>
	function excuteUpdate(id) {
		var updateForm = $("#updateForm");
		
		updateForm.append("<input type='hidden' name='ProductID' value='" + id + "' />")
		.submit();
				 
	}
	
	</script>

</html>
