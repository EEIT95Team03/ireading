<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script> 
 <script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.js"/>"></script> 
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.cookie.js"/>"></script>
 <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/bookpage.css'/>">
   <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
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
							<img style="width:300px" class="img-responsiv" id="item-display" src="data:image/png;base64, ${book.byteArrayString}"></img>
<!-- 								<img style="width: 100%;" -->
<%-- 										src="https://media.taaze.tw/showLargeImage.html?sc=${Img}"/> --%>
								</center>
                            </div>
                            <div class="col-md-7">
                                <h1>${book.title}</h1>
                                <h3>
                                    <label>作者: </label><a href="<c:url value="/browse/searchBooks.controller/advanceSearch?Title=&CategoryID=&Year=&ISBN=&Author=${book.author}&Publisher=&action=adv"/>">${book.author}</a></h3>
                                <h3>
                                    <label>出版日期:</label> <fmt:formatDate pattern = "yyyy-MM-dd" 
         value = "${book.pub_Date}" /></h3>
                                <h3>
                                    <label>出版社:</label><a href="<c:url value="/browse/searchBooks.controller/advanceSearch?Title=&CategoryID=&Year=&ISBN=&Author=&Publisher=${book.publisher}&action=adv"/>">${book.publisher}</a></h3>
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

                            <li id="tab1" class="active text-center"><a href="#service-one" data-toggle="tab"><h3><span class="glyphicon glyphicon-bookmark"></span>摘要</h3></a></li>
                            <li id="tab2" class="text-center"><a href="#service-two" data-toggle="tab"><h3><span class="glyphicon glyphicon-comment"></span>享。書評</h3></a></li>
                            <li id="tab3" class="text-center"><a href="#service-three" data-toggle="tab"><h3><span class="glyphicon glyphicon-shopping-cart"></span>享。買書<span class="badge">${count}</span></h3></a></li>

                        </ul>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="service-one">

                                <section class="container-fluid abstract">
                                    <h3>${book.abstracts}</h3>
                                </section>

                            </div>
                            
                            
                            <div class="tab-pane fade" id="service-two">
                             
                                <section class="container">
                                
<!--                                 未登入 -->
<c:choose>
<c:when test="${MemberID eq null}">
                                <div  class="ReviewInfo col-xs-12 col-md-10 col-md-8">
                           <h2 class="glyphicon glyphicon-exclamation-sign"> 登入後即可撰寫書評! </h2>
                           <button class="btn btn-lg btn-success glyphicon glyphicon-pencil" data-toggle="modal" data-target="#LoginBlock">登入</button>
                                </div>
 </c:when>


 <c:otherwise>
<c:choose>
     <c:when test="${review eq '0'}">
              <c:if test="${empty reviews}">
                                <div class="ReviewInfo col-xs-12 col-md-10 col-md-8">
                           <h2 class="glyphicon glyphicon-exclamation-sign"> 目前沒有任何書評喔! </h2>
                           <button class="btn btn-lg btn-success glyphicon glyphicon-pencil addReview">撰寫書評</button>
                            <div id='wCont' style="display: none">				
				<form id="wwCont">
					<div class='2'>
						<input type='text' id='n_ISBN' name='ISBN' value="${ISBN}" class="hidden"/>
					</div>
					<div class='3' style='display:inline-block;'><lable>評論</lable>
						<textarea style='width: 50em; height: 8em;' type="text"
							  placeholder="請輸入五百字以內的評論"class="form-control" id="w_Cont" name="Cont" value="" ></textarea>
					</div>
					<div class='4' style='width:5em;'><label>評分(1~5分)</label>
						<input min='1' max='5' type="number" class="form-control" id="n_rate" name="rate" value="">
					</div>
				
					<button class="btn btn-sm btn-primary btn_enter" type="submit">確定</button>
					<button class="btn_del btn btn-sm btn-danger" type="submit">取消</button>
				</form>
			</div>			
		</div>                         
             </c:if>            
            

             <c:if test="${not empty reviews}">                                
                                <div class="ReviewInfo col-xs-10 col-md-10 col-md-8">                            
                           <h2 class="glyphicon glyphicon-exclamation-sign"> 您目前撰寫這本書的書評喔! </h2>
                           <button class="btn btn-lg btn-success glyphicon glyphicon-pencil addReview">撰寫書評</button>
                           <div id='wCont' style="display: none">				
				<form id="wwCont">
					<div class='2'>
						<input type='text' id='n_ISBN' name='ISBN' value="${ISBN}" class="hidden"/>
					</div>
					<div class='3' style='display:inline-block;'><lable>評論</lable>
						<textarea style='width: 50em; height: 8em;' type="text"
							  placeholder="請輸入五百字以內的評論"class="form-control" id="w_Cont" name="Cont" value="" ></textarea>
					</div>
					<div class='4' style='width:5em;'><label>評分(1~5分)</label>
						<input min='1' max='5' type="number" class="form-control" id="n_rate" name="rate" value="">
					</div>
				
					<button class="btn btn-sm btn-primary btn_enter" type="submit">確定</button>
					<button class="btn_del btn btn-sm btn-danger" type="submit">取消</button>
				</form>
			</div>			
		</div>                   
                                
           </c:if>         
     </c:when>

</c:choose>

 </c:otherwise>
</c:choose>                                 
                                  
                                   <div id="reviewList">
   <c:forEach var='review' items="${reviews}">
			<div class='bookCont'>
			<div class="col-xs-10 col-md-10 col-md-8">
				<div class='aCont' style='margin-bottom:10px;vertical-align:middle;'>
<!--●●●連結書籍資料 -->
					
					<div class='aCCont'>
						<div class='memberID' style="display: none;">${review.memberID}</div>
						<div class='ISBN' style='display: none;'>${review.ISBN}</div>
						<div>
						<div class="col-xs-6">${review.memberID}</div>
						<div  class="col-xs-6 text-right"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${review.postTime}" /></div></div>
                        <c:choose>
						<c:when test="${review.memberID eq MemberID}">
						<div class="rate" value="${review.rate}"><span class="label label-warning">我給</span>&nbsp;<c:forEach begin="1" end="${review.rate}">
						<img src='<c:url value="/images/star.png"/>' width='20px' /></c:forEach></div>					
						</c:when>
						<c:otherwise>
						<div class="rate" value="${review.rate}"><span class="label label-info">他給</span>&nbsp;<c:forEach begin="1" end="${review.rate}">
						<img src='<c:url value="/images/star.png"/>' width='20px' /></c:forEach></div>
						</c:otherwise>
						</c:choose>
						<div class='cont col-xs-12'>${review.cont}</div>
						<c:if test="${review.memberID eq MemberID}">
						<div class="text-right"><button class="btn btn-primary updateReview" data-toggle="modal" data-target="#updateReview"><span class="glyphicon glyphicon-pencil">修改</span></button></div></c:if>
					</div>
				</div>
				</div>
			</div>
		</c:forEach>    
		
		
		<c:forEach var='review' items="${reviews}">
		<c:if test="${review.memberID eq MemberID}">
		<div class="modal fade" id="updateReview" tabindex="-1" role="dialog"
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
						<form id="updateBookReview">
							<div class="form-gorup col-xs-12">
								<label for="Cont">評論 <textarea
										style='width: 30em; height: 8em;' type="text"
										class="form-control" id="n_Cont" name="Cont" value="${review.cont}">${review.cont}</textarea>
								</label>
							</div>
							<div class="form-gorup col-xs-12">
								<label for="rate">評分 (1~5分)
								<input type="number"
									class="form-control" id="n_rate" name="rate" min="1" max="5" value="${review.rate}"></input>
								</label>
							</div>
							<input class='ISBN' name="ISBN" style="display: none;" value="${review.ISBN}" />
							<input class='MemberID' name="MemberID" style="display: none;" value="${review.memberID}" />
							<div class="form-group col-xs-12" style="float: right;">
								<button class="btn btn-primary updateReviewbtn">確定</button>
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
		</c:if>
	</c:forEach>	                     
                           </div>                        	                            	
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
        <div id="action" class="hidden">${param.action}</div>
    </section>
    
<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
<script src="<c:url value="/js/login.js"/>"></script>
<script src="<c:url value="/js/cart.js"/>"></script>
  <script> 
        $(function(){
  $("#ProducTable").tablesorter();
  
  if($('#action').text()=='buy'){
	  $('#tab1').toggleClass("active");
	  $('#tab3').toggleClass("active");
	  $('#service-one').toggleClass("active");
	  $('#service-three').toggleClass("active");
	  $('#service-one').toggleClass("in");
	  $('#service-three').toggleClass("in");
  }
  
  
 
  
  //商品影片
           
           $('.videobox').on('hidden.bs.modal', function () {
           console.log($(this).html());
           var src=$(this).find("iframe").attr("src");
             $(this).find("iframe").attr("src","").attr("src",src);  
           });
           
 
  
//書評
				$('.addReview').click(function(event) {					
					$('#wCont').slideToggle();
				});
				
				
				$('.btn_enter').click(
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
						});
           
              $('.updateReviewbtn').click(function(event){
            	  var data =$('#updateBookReview').serialize();
            	  $.post("/ireading/manager/review.controller/update", data,
  						function(data){
  							if(data[0].change){
  								alert("新增評論成功");
  								location.reload();
  							} else {
  								alert("新增評論失敗");
  								location.reload();
  								}
  							})
            	  
            	  
              });
				
				
				
				
        })
        
        
        
    </script>
</html>