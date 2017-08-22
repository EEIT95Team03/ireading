<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱管理者後台</title>

   <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">  
   <link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	  <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script> 
<script type="text/javascript"
	src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>

    <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/userpage.css'/>">
     <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
 <c:import url="/pages/templates/manager/managermenu.jsp"></c:import>

          <div  class="col-lg-11" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                    
                <h1><span class="glyphicon glyphicon-book"></span>書籍資料維護</h1>   
                
                <form id="advsearch-form" class="form-horizontal"  role="form" action="<c:url value="/browse/books.controller/booksMainPage"/>">
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
                    <div class="col-sm-12 text-center">
                        <button type="submit" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-search"></span> Search</button>
                    </div>
                </form>
                 
                <button class="btn btn-success btn-md pull-right" data-toggle="modal" data-target="#newbook"><span class="glyphicon glyphicon-plus"></span>新增資料</button>                  
                        <table id="bookslist">
				<thead>
					<tr>
						<th style="text-align: center;">ISBN編號</th>
						
						<th style="text-align: center;">書名</th>
						<th style="text-align: center;">封面</th>
						<th style="text-align: center;">作者</th>
						<th style="text-align: center;">出版社</th>
						<th style="text-align: center;">分類</th>
						<th style="text-align: center;">語言</th>
						<th style="text-align: center;">出版日期</th>
						<th style="text-align: center;">售價</th>
						<th style="text-align: center;">點擊率</th>
						<th style="text-align: center;">評分平均</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="books" items="${dataLs}">
						<tr>
						
							<td class="bid">${books.ISBN}</td>
							
							<td>${books.title}</td>
							<td ><img style="width: 20px" src="data:image/png;base64, ${books.Cover}"/></td>
<%--  							<td ><img style="width: 20px" src="https://media.taaze.tw/showLargeImage.html?sc=${books.Img}"/></td> --%>
							<td>${books.author}</td>
							<td>${books.publisher}</td>
							<td >${books.categoryID}</td>
							<td>
							<c:if test="${books.language eq 1}"> 外文</c:if>
            				<c:if test="${books.language eq 0}"> 中文</c:if>
            				</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${books.pub_Date}"/></td>
							<td>
							<fmt:parseNumber integerOnly="true" value="${books.ori_Price}"/></td>
							<td>${books.click}</td>
							<td>${books.rateAvg}</td>
							
							

							<td class="text-center">
								<a class='btn btn-info btn-xs editbtn' href="javascript:excuteUpdate('${books.ISBN}');">
									<span class="glyphicon glyphicon-edit"></span>修改</a>
									<br/>
								<button class="btn btn-danger btn-xs deletebtn">
									<span class="glyphicon glyphicon-remove"></span>刪除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="modal fade" id="newbook" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">新增書籍資料</h3>
                </div>
                <div class="modal-body" style="overflow: auto;">
                    <!-- content goes here -->
                    <form id="newform" action="<c:url value="/manager/books.controller"/>" method="POST" enctype="multipart/form-data">
                        <div class="form-group col-xs-12 col-md-6">
                            <label for="ISBN">ISBN</label>
                            <input type="text" class="form-control" id="new_ISBN" name="ISBN" value="" >
                            <label class="msg">${errors.ISBN}</label>
                        </div>
                        <div class="form-group col-xs-12">
                            <label for="categoryID">分類</label>
                            <select  id="categoryID" name="categoryID">
                                <option>請選擇分類</option>
						        <option value="000">總類</option>
						        <option value="100">哲學類</option>
						        <option value="200">宗教類</option>
						        <option value="300">科學類</option>
						        <option value="400">應用科學類</option>
						        <option value="500">社會科學類</option>
						        <option value="600">中國史地</option>
						        <option value="700">世界史地</option>
						        <option value="800">語言文學類</option>
						        <option value="900">藝術類</option>
                            </select>
                        </div>
                         <div class="form-group col-xs-12">
                                <label for="title">書名</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_title" name="title" value=""></textarea>
                            </div>
                        
                        <div class="form-group">                          
                            <div class="form-group col-xs-12">
                                <label for="cover">封面</label>
                                <input type="file" class="form-control" id="new_cover" name="cover">
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="author">作者</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_author" name="author" value=""></textarea>
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="publisher">出版社</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_publisher" name="publisher" value=""></textarea>
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="language">語言</label>
<!--                                 <textarea class="form-control" style="resize: vertical;" id="new_language" name="language" value=""></textarea> -->
                           <input type="radio" id="new_language" name="language" value="0">中文
                           <input type="radio" id="new_language" name="language" value="1">英文
                             </div>
                            <div class="form-group col-xs-12">
                                <label for="pub_Date">出版日期</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_pub_Date" name="pub_Date" value=""></textarea>
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="ori_Price">價錢</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_ori_Price" name="ori_Price" value=""></textarea>
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="abstracts">簡介</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_abstracts" name="abstracts" value=""></textarea>
                            </div>
                            <div class="form-group col-xs-12">
                                <label for="abstracts">Img</label>
                                <textarea class="form-control" style="resize: vertical;" id="new_Img" name="Img" value=""></textarea>
                            </div>
                        </div>
                        <div class="form-group col-xs-12">
<!--                         <input id="new_btn" type="submit" name="prodaction" value="Insert"> -->
                        <button type="submit" class="btn btn-primary" id="new_btn" name="prodaction" value="Insert">儲存</button> 
                        <button class="btn btn-default" data-dismiss="modal">取消</button>
                       </div>
                    </form>

                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
			
	 <form id="updateForm" method="post" action="${pageContext.request.contextPath}/manager/books.controller/goUpdatePage"></form>		
                    </div>
                    
               


<c:import url="/pages/templates/manager/managerfooter.jsp"></c:import>

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script>
$(function(){
	
	  $('#bookslist').DataTable({
		  "searching":false
		  
	  });
	
	
	$('#bookslist').on('click', '.deletebtn', function() {
		var id = $(this).parents("tr").children('.bid').text();
		if (confirm("確定要刪除這筆資料?")) {
			$.post("/ireading/manager/books.controller/delete", {ISBN : id}, 
			   function(data) {
			if(data[0].change==1){
				location.reload();
			}
			else{
				alert("ISBN "+data[0].id+" 刪除失敗");
				location.reload();
			}
			});
		}
	});
	
	
	
})
function excuteUpdate(id) {
			var updateForm = $("#updateForm");
			
			updateForm.append("<input type='hidden' name='ISBN' value='" + id + "' />")
			.submit();
					 
		}


</script>
</html>