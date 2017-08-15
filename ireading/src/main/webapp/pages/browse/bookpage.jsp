<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.js"/>"></script> 
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
 <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/bookpage.css'/>">
</head>
<body>
<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
<!-- 內容寫在這個區塊內 -->
 <section>
        <div class="container-fluid">
            <div class="content-wrapper">
                <div class="item-container">
                    <div class="container">
                        <div class="col-md-12" id="bookinfo">
                            <div class="col-md-5">
                                <center>
							<img style="width:300px" id="item-display" src="data:image/png;base64, ${book.byteArrayString}"></img>
<!-- 								<img style="width: 100%;" -->
<%-- 										src="https://media.taaze.tw/showLargeImage.html?sc=${Img}"/> --%>
								</center>
                            </div>
                            <div class="col-md-7">
                                <h1>${book.title}</h1>
                                <h3>
                                    <label>作者: </label>${book.author}</h3>
                                <h3>
                                    <label>出版日期:</label> ${book.pub_Date}</h3>
                                <h3>
                                    <label>出版社:</label> ${book.publisher}</h3>
                                <h3>
                                    <label>語言:</label>
            <c:if test="${book.language eq 1}"> 外文</c:if>
            <c:if test="${book.language eq 0}"> 繁體中文</c:if></h3>
                                <h3>
                                    <label>定價:</label>
                                     ${book.ori_Price}</h3>
                                <hr>
                            </div>
                        </div>





                    </div>
                </div>

                <div class="container-fluid">
                    <div class="col-md-12 product-info">
                        <ul id="myTab" class="nav nav-tabs nav_tabs">

                            <li class="active text-center"><a href="#service-one" data-toggle="tab"><h3><span class="glyphicon glyphicon-bookmark"></span>摘要</h3></a></li>
                            <li class="text-center"><a href="#service-two" data-toggle="tab"><h3><span class="glyphicon glyphicon-comment"></span>享。書評</h3></a></li>
                            <li class="text-center"><a href="#service-three" data-toggle="tab"><h3><span class="glyphicon glyphicon-shopping-cart"></span>享。買書</h3></a></li>

                        </ul>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="service-one">

                                <section class="container-fluid abstract">
                                    <h3>${book.abstracts}</h3>
                                </section>

                            </div>
                            
                            <div class="tab-pane fade" id="service-two">

                                <section class="container">
                                <c:choose>
                                <c:when test="${empty reviews}">
                                <div id="noReview">
                           <h2 class="glyphicon glyphicon-exclamation-sign"> 目前沒有任何書評喔! </h2>
                           <button class="btn btn-lg btn-success glyphicon glyphicon-pencil">撰寫書評</button></div>
                                </c:when>
                                <c:otherwise>
                                <div id="reviewList">
                                <c:forEach var="review" items="${reviews}">
                                <div class="review">
                                <p>${review.cont}</p>
                                </div>
                                </c:forEach>                           
                           </div>
                                </c:otherwise>
                                </c:choose>                               	                            	
                                </section>

                            </div>
                            
                            <div class="tab-pane fade" id="service-three">
                                <table id="ProducTable" style="width: 100%" class="tablesorter">
                                    <thead>
                                        <tr>
                                            <th class="text-center">享。書編號</th>
                                            <th class="text-center">細節描述</th>
                                            <th class="text-center">使用狀態</th>
                                            <th class="text-center">享。售價 <span class="glyphicon glyphicon-sort"></span></th>
                                            <th class="text-center">享。看書況</th>
                                            <th class="text-center">享。買</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="product" items="${products}">
                                    <tr>
                                            <td class="text-center">${product.productID}</td>
                                            <td class="text-center">${product.detail}</td>
                                            <td class="text-center">${product.status}</td>
                                            <td class="text-center">${product.productPrice}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn btn-lg btn-danger glyphicon glyphicon-film" data-toggle="modal" data-target="#video1"></button>
                                            </td>
                                           

                            <td class="text-center">
                                <a type="button" class="btn btn-success addcart" value="<c:url value="/browse/cart/add/${product.productID}"/>"><span class="glyphicon glyphicon-plus"></span><span class="glyphicon glyphicon-shopping-cart"></span></a>
                            </td>
                                    </c:forEach>

                            </tbody>
                                </table>
 <div class="modal fade videobox" id="video1" tabindex="-1" role="dialog" aria-labelledby="videoModal" aria-hidden="true">
 	
                                                <div class="modal-dialog modal-lg">                                                   
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                    <iframe width="560" height="315" src="https://www.youtube.com/embed/BxuY9FET9Y4" frameborder="0" allowfullscreen></iframe>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>      
                                            </div>
                                        </div>
    
     <div class="modal fade videobox" id="video2" tabindex="-1" role="dialog" aria-labelledby="videoModal" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">                                                   
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                <div class="embed-responsive embed-responsive-16by9">
                                                                   <iframe src='https://www.youtube.com/embed/3AtDnEC4zak' frameborder='0' allowfullscreen></iframe>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>      
                                            </div>
                                        </div>                                        
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
        </div>
    </section>
    
<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
  <script> 
        $(function(){
  $("#ProducTable").tablesorter(); 
  
  $.post("/ireading/browse/cart/count",{},function(data){
	   
	   $('#cart span').text(data[0].count);
	   
	 });
  
           
           $('.videobox').on('hidden.bs.modal', function () {
           console.log($(this).html());
           var src=$(this).find("iframe").attr("src");
             $(this).find("iframe").attr("src","").attr("src",src);  
           });
           
           
           
           $("#ProducTable").on("click",".addcart",function(event){
        	   var url=$(this).attr("value");
        	   
        	   $.post(url,{},function(data){
        		   console.log(data[0].count);
        		   $('#cart span').text(data[0].count);
        		   if(data[0].change=="1"){alert("成功新增至購物車");}
        		   else{alert("商品已在購物車");}});
        	   
           }); 
           
        })
    </script>
</html>