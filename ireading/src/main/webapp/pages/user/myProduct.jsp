<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

  <div class="col-lg-10 col-lg-offset-1">
                 <!--    內容寫這 -->
                 
                                 <h1><span class="glyphicon glyphicon-home" ></span> 我的書店</h1>
                         <div><a class="btn btn-lg btn-primary" disabled>上架中二手書</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" href="<c:url value="/user/product/sellout"/>">已出售商品</a> </div/>                  
                       <br>


                         
           <nav class="navbar navbar-default query" role="query">

            <div class="container-fluid">

                <div class="navbar-header">
                 <h1 class="label head-title">上架中二手書</h1>                   
                </div>

                <div class="navbar-right col-xs-12 col-sm-4"><h4 class="text-right">共 <strong style="color:red">${OrderCount}</strong> 筆</h4></div>                  
                </div>
        </nav>   
                                             
            <div class="col-sm-12">
            <table class="table table-hover" id="selloutTable">
                <thead>
                    <tr>
                        <th>商品資訊</th>
                        <th class="text-center">細節描述</th>
                        <th class="text-center">定價<span class="glyphicon glyphicon-sort"></span></th>
                         <th class="text-center">售價<span class="glyphicon glyphicon-sort"></span></th>
                         <th class="text-center">實收金額<span class="glyphicon glyphicon-sort"></span></th>
                        <th class="text-center">action</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${dataLs}">
                <tr>
                        <td class="col-md-5">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"><img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${product.Title}</a></h4>
                                <h5 class="media-heading"> 編號 <a href="#">${product.productID}</a></h5>
                                <span>使用狀態: </span><span class="text-success"><strong>${product.status}</strong>${product.Ori_Price}</span>
                            </div>
                        </div></td>
                        <td class="col-md-2 text-center"><strong>${product.detail}</strong></td>
                         <td class="col-md-1 text-center"><strong><fmt:parseNumber integerOnly="true" value="${product.Ori_Price}" /></strong></td>
                        <td class="col-md-1 text-center"><strong><fmt:parseNumber integerOnly="true" value="${product.productPrice}" /></strong></td>
                      <td class="col-md-1 text-center"><strong><fmt:parseNumber integerOnly="true" value="${product.productPrice*0.7}" /></strong></td>
                        <td class="col-md-1 text-center">
                        <a class='btn btn-info btn-xs editbtn'> 
						    <span class="glyphiconglyphicon-edit"></span>享。修改</a>
							<a class='btn btn-success btn-xs savebtn hidden'> 
						    <span class="glyphiconglyphicon-edit"></span>享。儲存</a>
							<a class='btn btn-danger btn-xs cancelbtn hidden'> 
						    <span class="glyphiconglyphicon-edit"></span>享。取消</a>
								<button class="btn btn-danger btn-xs deletebtn">
									<span class="glyphicon glyphicon-remove"></span>享。刪除</button>
									</td>
                    </tr>
                
                
                </c:forEach>                  
                   
                </tbody>
            </table>
        </div>
                    </div>
                                  

<c:import url="/pages/templates/user/userfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
  <script>         
           $(function () {
             $("#selloutTable").tablesorter();

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
            	 
           });
           
         })
  </script>

</html>