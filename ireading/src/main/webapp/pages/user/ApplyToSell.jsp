<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>

   <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">  
    <!--jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/js/jquery.tablesorter.js"/>"></script>

    <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
     <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    
 <style>
 .quan{
 	width:100px
 }
 </style>      
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

   <div class="col-lg-11 col-lg-offset-1">
                 <!-- 內容寫這 -->
               
                                 <h1><span class="glyphicon glyphicon-book" ></span> 二手書上架申請</h1>
                         <div><a class="btn btn-lg btn-primary" disabled>申請賣書</a>&nbsp;&nbsp;&nbsp;
                         <a class="btn btn-lg btn-success" href="<c:url value="/user/soldproduct.controller/selectSoldList"/>">查詢賣書清單</a> </div/>                  
                       <br>
               
	<div class="row">
		<div class="col-md-12 custyle">
			<table class="table table-striped custab" id="productlist">
				<thead>
					<tr>
						<th>ISBN</th>
						<th>原價</th>
						<th>平均二手價</th>
						<th>最低二手價</th>
						<th>商品細節描述</th>
						<th>商品狀態</th>
						<th>二手價</th>
						<th></th>
						<th class="text-center">
							
						</th>
					</tr>
				</thead>
				<tbody>
					<form id="insert_form">
						<tr>
						    <td><input id="input_isbn" name ="ISBN" type="textbox" /><br>
						    	<span style="color: red" id="msg1"></span><span style="color: red" id="isbnverify"></span>
						    </td><span class="label label-warning">書名</span>&nbsp;<span id="input_title" name ="title" style="width:70px">請輸入ISBN，對應的書名將會顯示在此</span>
						    	<span style="color: red" id="msg2"></span>	
							<td><span id="input_oprice" name ="ori_price" style="width:70px"></span>
								<span style="color: red" id="msg3"></span>
							</td>
							<td><span id="avg_price" style="width:70px;color:green;font-weight: 800;"></span>
	
							</td>
							<td><span id="low_price" style="width:70px;color:red"></span>
			
							</td>
							<td><input name ="detail" type="textbox"/>
								<span style="color: red" id="msg4"></span>
							</td>
							<td>
								<select id="status" name="status">
									<option>全新</option>
									<option>九成新</option>
									<option>八成新</option>
									<option>七成新</option>
									<option>六成新</option>
									<option>五成新</option>
									<option>四成新</option>
									<option>三成新</option>
									<option>二成新</option>
									<option>一成新</option>
								</select>
<!-- 							    <input name ="status" type="textbox"/> -->
<!-- 								<span style="color: red" id="msg4"></span> -->
							</td>
							<td><input style="width:70px" name ="price" type="number" min="30"/><br>
								<span style="color: red" id="msg5"></span>
							</td>
							<td><button class="updatebtn btn btn-primary btn-xs pull-right"
								data-toggle="modal" data-target="#newproduct" onclick="formReset()">享。新增</button></td>
							
<!-- 							<td><button class="updatebtn btn btn-primary btn-xs pull-right" -->
<!-- 								data-toggle="modal" data-target="#newproduct" onclick="clearForm()">享。清空</button></td>	 -->
								
            			</tr>
            			</form>
				</tbody>
			</table>
		</div>
	</div>
<div class="row">
		<div class="col-md-12 custyle">
			<table class="table table-striped custab" id="productlistdisplay">
				<thead>
					<tr>
						<th>ISBN</th>
						<th>書名</th>
						<th>原價</th>
						<th>商品細節描述</th>
						<th>商品狀態</th>
						<th>二手價</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="display">
					
				</tbody>
			</table>
		</div>
		<div class="row col-md-12 custyle">
	<form>
	<div class="text-right">
		<button id="save_btn" class="btn btn-primary hidden">享。儲存</button>
		<button id="cancelbtn" class="btn btn-default cancelbtn hidden" data-dismiss="modal">享。取消</button>
		</div>
	</form>
	</div>
	</div>
	</div>
	
    	<!-- 新增的資料，暫存在Html裡面  -->
	<script>
	
	//<!-- 新增書本資料到Html -->
	
	$(function(){
		
		$("#productlist").on("click",".updatebtn",function(event){
			
			event.preventDefault();
			
			//<!-- 清空錯誤訊息 -->
		 	$("#msg1").text("");
		 	$("#msg2").text("");
		 	$("#msg3").text("");
		 	$("#msg4").text("");
		 	$("#msg5").text(""); 	
		 	$("#isbnverify").text("");
			
			// 取到input的值
			var ISBN = $('input[name="ISBN"]').val();
			var title = $('span[name="title"]').text();
			var ori_price = $('span[name="ori_price"]').text();
			var status = $('#status option:selected').text();
			var detail = $('input[name="detail"]').val();
		 	var price = $('input[name="price"]').val();
		 	
			console.log(status);
		 	
		 	
		 	//<!-- 驗證 ISBN: 978 or 979開頭  -->
		 	var re = /^(97(8|9))?\d{9}(\d|X)$/;
		 	console.log(re.test(ISBN));
		 	
		 	if(re.test(ISBN) && title.trim().length!=0 && ori_price.trim().length!=0 && price.trim().length!=0 &&price>0){
		 		
		 		$('span[name="title"]').text("");
				$('#input_oprice').text("");
		 			
		 		var cell1 = $("<td name='ISBN' value='" + ISBN + "' ></td>").text(ISBN); 
		 		var cell2 = $("<td name='title' value='" + title + "'></td>").text(title);
		 		var cell3 = $("<td name='ori_price' value='" + ori_price + "'></td>").text(ori_price);
		 		var cell4 = $("<td name='detail' value='" + detail + "'></td>").text(detail);
		 		var cell5 = $("<td name='status' value='" + status + "'></td>").text(status);
		 		var cell6 = $("<td name='price' value='" + price + "'></td>").text(price);
		 		var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
		 		$("#display").append(row);
		 		
		 		var all_Inputs = $("input[type=textbox]");
				all_Inputs.val("");
				var num_Inputs = $("input[type=number]");
				num_Inputs.val("");
				$('#avg_price').text("");
				$('#low_price').text("");
				$('#status')[0].selectedIndex = 0;
				
				$("#save_btn").toggleClass("hidden",false);
				$("#cancelbtn").toggleClass("hidden",false);
				
// 				var num_Inputs = $("input[type=number]");
// 				num_Inputs.val("");
// 				status
				
// 				$("td select").val("default");
		 		
		 	}else if(ISBN==null||ISBN.trim().length==0){
		 			
		 		$("#msg1").text("請輸入ISBN碼喔！");
//	 		 	$("#isbn").text("");	
			 	
			}else if(ISBN < 13){
				$("#msg1").text("ISBN碼必須要符合13個整數的格式喔！");
//	 	 		$("#isbn").text("");
		 	}
			
			//<!-- 驗證二手價 -->
			if(price==null||price.trim().length==0){
				
				$("#msg5").text("請輸入您想賣的價格喔！");
//	 		 	$("#price").text("");	
			 	
			}else if(isNaN(price)){
				
				$("#msg5").text("請輸入數字喔！");
//	 			$("#price").text("");	
				
			}else if(price < 0){			
				$("#msg5").text("請輸入正整數喔！");
			}
			
			
		});
		
		
		$('#save_btn').click(function(event){
			event.preventDefault();
			var trs=$('#display tr');
			var array=[];
			
			$.each(trs,function(i,product){
				
				var isbn = $(product).children('[name="ISBN"]').attr("value");
				var title = $(product).children('[name="title"]').attr("value");
				var ori_price = $(product).children('[name="ori_price"]').attr("value");
				var detail = $(product).children('[name="detail"]').attr("value");
				var status = $(product).children('[name="status"]').attr("value");
				var price = $(product).children('[name="price"]').attr("value");
				var data = {ISBN:isbn, title:title, ori_price:ori_price, detail:detail,status:status, price:price};
				console.log(data);
 				array[i] = data;
 				
			});
			console.log(array);	
			
			$.post("/ireading/user/product/sellBook/userinsert",{list:JSON.stringify(array)}, function(data) {
				console.info(data);
				
				if("Success" == data[0].Success){
					alert("新增資料成功！");
					location.reload();
				}
				else{
					alert("新增資料失敗！");
					$('#new_btn + .msg').text(data[0].ISBN);
				}
			});			

		});
		
		//用blur方法，驗證ISBN
		$('#input_isbn').blur(function(event){

			$('span[name="title"]').text("");
			$('span[name="ori_price"]').attr("value", "");
			
			var isbn=$(this).val();
			
			if(isbn.length>0){
			var re = /^(97(8|9))?\d{9}(\d|X)$/;
		 	if(re.test(isbn)){
		 		$.post("/ireading/user/product/sellBook/isbn",{ISBN:isbn},function(data){
		 			if(data!="0"){
		 				console.log(data[0]);
		 				$('#input_title').text(data[0].title);
		 				$('#input_oprice').text(data[0].ori_Price);
		 				$('#avg_price').text(data[0].Avg);
		 				$('#low_price').text(data[0].low);
		 				return;
		 			}
		 			else{//alert("查無ISBN");
		 			$("#isbnverify").text("查無ISBN");
		 			$('span[name="title"]').text("");
					$('span[name="ori_price"]').text("");
					$('#avg_price').text("");
	 				$('#low_price').text("");
					
					$('#msg1').text("");
					$('span[name="title"]').text("");
					$('span[name="ori_price"]').attr("value", "");
					$('#input_title').text("請輸入ISBN，對應的書名將會顯示在此");
					return;
		 			}
		 		});
		 	}
		 	else{//alert("ISBN格式錯誤");
		 	$("#isbnverify").text("ISBN格式錯誤");
		 	$('.msg1').text("");
		 	$('span[name="title"]').text("");
			$('span[name="ori_price"]').text("");
			$('#avg_price').text("");
				$('#low_price').text("");
			
			$('span[name="title"]').text("");
			$('span[name="ori_price"]').attr("value", "");
			$('#input_title').text("請輸入ISBN，對應的書名將會顯示在此");
		 	return;
		 	}}
		 	$('span[name="title"]').text("");
			$('span[name="ori_price"]').text("");
			$('#input_title').text("請輸入ISBN，對應的書名將會顯示在此");
			$('#avg_price').text("");
				$('#low_price').text("");
			return;
			
		});
		
		//清空input
		$("#input_isbn").focus(function(event){
			$('#msg1').text("");
			$('#msg5').text("");
			$("#isbnverify").text("");
			$('#avg_price').text("");
				$('#low_price').text("");
		});

		
		// 刪除
		$("#productlist").on("click",".cancelbtn",function(event){
			location.reload();
			
		    })

	})
	
	</script>                
               


<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>

</html>