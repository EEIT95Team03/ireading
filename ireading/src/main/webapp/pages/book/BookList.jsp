<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>書籍資料</title>
<style type="text/css">
table {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin-top: 45px;
	width:850px;
	text-align:center;
	border-collapse: collapse;
	position: relative;
     table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。  */ 
}

th {
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe;
	border-top: 4px solid #aabcfe;
	border-bottom: 1px solid #fff;
	color: #039;
	overflow:hidden;
	width:50px;
}

td {
	padding: 8px;
	background: #e8edff; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent; 
	width:50px;
	height:30px;
	word-break:keep-all;/* 不换行 */  
     white-space:nowrap;/* 不换行 */ 
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */  
     text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/  
}

tr:hover td {
	background: #d0dafd;
	color: #339;
}
</style>
<!-- 最新編譯和最佳化的 CSS --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> 
<!-- 選擇性佈景主題 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css"> 

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js">
</script>
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
</head>
<body>
	<div class="container">
		<div>
		
		<h3><a href="<c:url value="/pages/book/BookIndex.jsp" />">返回主頁</a></h3>
	    

			<table id="bookslist">
				<thead>
					<tr>
						<th style="text-align: center;">ISBN編號</th>
						<th style="text-align: center;">分類</th>
						<th style="text-align: center;">書名</th>
						<th style="text-align: center;">封面</th>
						<th style="text-align: center;">作者</th>
						<th style="text-align: center;">出版社</th>
						<th style="text-align: center;">語言</th>
						<th style="text-align: center;">出版日期</th>
						<th style="text-align: center;">售價</th>
						<th style="text-align: center;">書籍摘要</th>
						<th style="text-align: center;">點擊率</th>
						<th style="text-align: center;">評分平均</th>
						<th><button class="btn btn-primary btn-xs pull-right" data-toggle="modal" data-target="#newbook">新增資料</button></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="books" items="${dataLs}">
						<c:url value="/manager/books.controller" var="link">
							<c:param name="cover" value="${books.ISBN }"/>
							<c:param name="cover" value="${books.categoryID }"/>
							<c:param name="cover" value="${books.title }"/>
							<c:param name="cover" value="${books.byteArrayString }"/>
							<c:param name="cover" value="${books.author }"/>
							<c:param name="cover" value="${books.publisher }"/>
							<c:param name="cover" value="${books.language }"/>
							<c:param name="cover" value="${books.pub_Date }"/>
							<c:param name="cover" value="${books.ori_Price }"/>
							<c:param name="cover" value="${books.abstracts }"/>
							<c:param name="cover" value="${books.click }"/>
							<c:param name="cover" value="${books.rateAvg }"/>
							<c:param name="booksaction" value="getinfo" />
						</c:url>
						<tr>
						
							<td class="bid">${books.ISBN}</td>
							<td >${books.categoryID}</td>
							<td>${books.title}</td>
							<td ><img style="width: 20px" src="data:image/png;base64, ${books.byteArrayString}"/></td>
<%--  							<td ><img style="width: 20px" src="https://media.taaze.tw/showLargeImage.html?sc=${books.Img}"/></td> --%>
							<td>${books.author}</td>
							<td>${books.publisher}</td>
							<td>
							<c:if test="${books.language eq 1}"> 外文</c:if>
            				<c:if test="${books.language eq 0}"> 中文</c:if>
            				</td>
							<td>${books.pub_Date}</td>
							<td>${books.ori_Price}</td>
							<td>${books.abstracts}</td>
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
		</div>
	</div>
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
    

</body>
<script>
		$(function() {
// 	        $('#new_btn').click(function(event){
// 	        	event.preventDefault();
// 	        	var data=$('#newform').serialize();
	        	
// // 	        	$.post("/ireading/manager/books.controller/insert",data,function(data){
// 	            $.post("/ireading/manager/books.controller" ,data,function(data){
// 	        		console.info(data)
// 	        		if("Success" == data) {
// 	        			alert("新增書籍資料成功");
// 		        		location.reload();
// 					}
// 	        		else {
// 	        			alert("新增書籍資料失敗");
// 	        			$('#new_ISBN + .msg').text(data[0].ISBN);
// 	        		}
// 	        	});
// 	        });
	        
         
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
		
/*
$("#categoryID").val();
$("#categoryID").text();
$("#categoryID:selected").attr("newText");
*/
	})
	
	function excuteUpdate(id) {
			var updateForm = $("#updateForm");
			
			updateForm.append("<input type='hidden' name='ISBN' value='" + id + "' />")
			.submit();
					 
		}
        
</script>
</html>