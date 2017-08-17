<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
<link rel="stylesheet" href="<c:url value='/css/bookpage.css'/>">
<style type="text/css">
.booklist{
background-color: white;
padding:10px;
}
.booklist .book{
padding: 10px;
margin: 0;
}
.booklist .book:nth-child(odd){
background-color: rgba(230, 230, 230, 0.55);
}
.booklist .book:nth-child(even){
background-color: rgba(82, 130, 119, 0.22);
}

.bookcover{
width:150px;
height:200px;
padding:5px; 
background-color:white;;
border-radius: 10px;}

/*search*/

.well-searchbox{
    margin-top: 70px;
}

 .searchblock {
          background: url("/ireading/images/search.png") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  margin-top:-20px;
  height:600px;
  vertical-align:middle;
        }

     .searchblock .row {
         margin-top:10px;
       color: white;
    font-weight: 800;
   
        }
        
        .nodata{
        height: 200px;
        background-color: white;
        margin-top: 50px;
        }
        
        
</style>
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	<!-- 內容寫在這個區塊內(start) -->
	<section>
   <div class="searchblock" >
      <div class="row text-center  col-xs-12 col-md-8 col-md-offset-2">
    <div class="well-searchbox text-center" >
              <h1 class="text-center" style="font-size:50px;">享。閱，找本書吧</h1>  
        <div class="row">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
				<div class="panel panel-login" style="background-color:rgba(234, 234, 234, 0.67);    border-radius: 15px;">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class=" btn btn-lg btn-primary" id="search-link">快速搜尋</a>
							
							</div>
							<div class="col-xs-6">
								<a href="#" class=" btn btn-lg btn-success"  id="advsearch-form-link">進階搜尋</a>							
							</div>
							<div id="actiontype" class="hidden">${param.action}</div>
						</div>
						<hr>
					</div>
					<div class="panel-body" style="margin-top: -40px;">
						<div class="row">
							<div class="col-lg-12">
								
								<form id="search-form"  action="<c:url value="/browse/searchBooks.controller/searchBooksList"/>" role="form" style="display: block;">
                              <h1> <input type="text" class="form-control" id="searchbox"  name="search" placeholder="請輸入書名或作者" value="${param.search}"/></h1>
                               <button type="submit" class="btn btn-info btn-sm" name="action" value="basic"><h1><span class="glyphicon glyphicon-search"></span> 找書趣</h1></button>
								</form>
								
					
			<form id="advsearch-form" class="form-horizontal"  role="form" action="<c:url value="/browse/searchBooks.controller/advanceSearch"/>" style="display: none;">
                    <div class="form-group">
                        <label class="col-xs-3 control-label">書名：</label>
                        <div class="col-xs-8">
                            <input type="text" class="form-control" id="Title" name="Title" placeholder="請輸入書名" value="${param.Title}"/>
                        </div>
                    </div>
                  
                    <div class="col-xs-6 form-group">  
                    <label class="col-xs-6 control-label">分類：</label>
                        <div class="col-xs-6">
                            <select class="form-control"  id="CategoryID" name="CategoryID">
                                <option></option>
						        <option value="000" <c:if test="${param.CategoryID eq '000'}">selected</c:if>>總類</option>
						        <option value="100" <c:if test="${param.CategoryID eq '100'}">selected</c:if>>哲學類</option>
						        <option value="200" <c:if test="${param.CategoryID eq '200'}">selected</c:if>>宗教類</option>
						        <option value="300" <c:if test="${param.CategoryID eq '300'}">selected</c:if>>科學類</option>
						        <option value="400" <c:if test="${param.CategoryID eq '400'}">selected</c:if>>應用科學類</option>
						        <option value="500" <c:if test="${param.CategoryID eq '500'}">selected</c:if>>社會科學類</option>
						        <option value="600" <c:if test="${param.CategoryID eq '600'}">selected</c:if>>中國史地</option>
						        <option value="700" <c:if test="${param.CategoryID eq '700'}">selected</c:if>>世界史地</option>
						        <option value="800" <c:if test="${param.CategoryID eq '800'}">selected</c:if>>語言文學類</option>
						        <option value="900" <c:if test="${param.CategoryID eq '900'}">selected</c:if>>藝術類</option>
                            </select>
                        </div>
                       </div>
                        
                     <div class="col-xs-6 form-group">
                      <label class="col-xs-5 control-label">出版年：</label>
                        <div class="col-xs-5">
                          <select class="form-control" id="Year" name="Year">
                          <option></option>
						        <c:forEach begin="0" end="39" step="1" varStatus="year">
						         <option value="${2017-year.index}" <c:if test="${param.Year eq 2017-year.index}">selected</c:if>>${2017-year.index}</option>
						        </c:forEach>
						        </select>
                        </div>
                     </div>
                      
                  
                     <div class="form-group">
                        <label class="col-xs-3 control-label">ISBN：</label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="ISBN" name="ISBN" placeholder="請輸入ISBN" value="${param.ISBN}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label">作者：</label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="Author" name="Author" placeholder="請輸入作者" value="${param.Author}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-3 control-label">出版社：</label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="Publisher" name="Publisher" placeholder="請輸入出版社" value="${param.Publisher}"/>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary btn-lg" name="action" value="adv"><span class="glyphicon glyphicon-search"></span> Search</button>
                    </div>
                </form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>      				
    </div>
  </div>
 </div> 
	<div class="container booklist col-xs-12">
	<div class="col-xs-12 col-md-8 col-md-offset-2">
	<div class="col-xs-6"><h1><span class="glyphicon glyphicon-search"></span> 查詢結果</h1></div>
	<div class="col-xs-6 text-right"><h2>找到  <span style="color:red">${selectCount}</span> 筆<h2></div>
	</div>
	
	<c:if test="${empty booksdataList}">
	<div class="nodata col-xs-12"><h1 class="text-center"><span class="glyphicon glyphicon-exclamation-sign"></span>查無資料，再找找看</h1></div>
	
	</c:if>
		<c:forEach var="searchbooks" items="${booksdataList}">
		  
			<div class="book col-xs-12">
			<div class="bookInfo col-xs-12 col-md-8 col-md-offset-2">
				<div class="col-xs-4">
					<a href="<c:url value="/browse/searchBooks.controller/${searchbooks.ISBN}"/>">
					<img class="bookcover img-responsiv" src="data:image/jpg;base64,${searchbooks.Cover.byteArrayString}" />
					</a>
				</div>
				<div class="col-xs-8" style="margin-top:25px;margin-bottom:25px; ">
					<div><h4><strong>
						<a href="<c:url value="/browse/searchBooks.controller/${searchbooks.ISBN}"/>">${searchbooks.title}</a>
					</strong></h4></div>
					<div><h4>作者： <a href="<c:url value="/browse/searchBooks.controller/advanceSearch?Title=&CategoryID=&Year=&ISBN=&Author=${searchbooks.author}&Publisher=&action=adv"/>">${searchbooks.author}</a></h4></div>
					<div><h4>出版社：<a href="<c:url value="/browse/searchBooks.controller/advanceSearch?Title=&CategoryID=&Year=&ISBN=&Author=&Publisher=${searchbooks.publisher}&action=adv"/>">${searchbooks.publisher}</a></h4></div>
					<div><h4>出版日期：${searchbooks.pub_Date}</h4></div>
					<div><a class="btn btn-success" href="<c:url value="/browse/searchBooks.controller/${searchbooks.ISBN}?action=buy"/>">有  <span class="badge"><c:if test="${empty searchbooks.Count}">0</c:if>${searchbooks.Count}</span> 人享賣這本書</a></div>
				</div>
				
				</div>
			</div>
			
		</c:forEach>
	</div>
		</section>
	
	<!-- 內容寫在這個區塊內(end) -->
	<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
<script type="text/javascript" src="/ireading/js/login.js"></script>
<script src="<c:url value="/js/jquery.cookie.js"/>"></script>
<script src="<c:url value="/js/cart.js"/>"></script>
<script>
$(function() {

    $('#search-link').click(function(e) {
		$("#search-form").delay(100).fadeIn(100);
 		$("#advsearch-form").fadeOut(100);
		$('#advsearch-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#advsearch-form-link').click(function(e) {
		$("#advsearch-form").delay(100).fadeIn(100);
 		$("#search-form").fadeOut(100);
		$('#search-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	if($('#actiontype').text()=="adv"){
		$("#advsearch-form").delay(100).fadeIn(100);
 		$("#search-form").fadeOut(100);
		$('#search-link').removeClass('active');
		$(this).addClass('active');	
	}

});
</script>
</html>