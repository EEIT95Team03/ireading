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
       .media-body
        {background-color:#87acab;
         padding:15px;
         border-radius:15px;
        
        }
        .bookcase {
        margin-bottom:30px;
        }
        .btnblock {
        line-height:50px;
        }

        .dropbtn {
        margin-left:30px;
        }

      .dropbox  {
        background-color: rgb(216, 216, 216);
    padding: 10px;
    border-radius: 15px;
    padding-bottom:30px;
        }


        .bookbox {
            margin-top:30px;
        background-color:white;
        padding:15px;
        border-radius:10px;
        }
        .title-row {
        margin-top:10px;
        height: 40px;
        }
</style>
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

                     <div class="col-lg-12">
                 <!--    內容寫這 -->
                    
                        
                        <h1><span class="glyphicon glyphicon-book"></span> 我的書櫃</h1> <br>
                        <div><a class="btn btn-lg btn-success"  data-toggle="modal" data-target="#newBC"><span class="glyphicon glyphicon-plus"></span>新增書櫃</a></div>           
                       <br>
<c:forEach var="bookcase" items="${bookCases}" varStatus="index">
            <div class="bookcase col-xs-12">                                                 
            <div class="col-xs-12 media-body">
                <div class="col-xs-12 col-md-8"><h4 class="head-title label bookCaseName">${bookcase.BCName}</h4></div>               				
							<div class="text-right col-xs-12 col-md-4 btnblock">
                                <a class="btn btn-success editbtn" data-toggle="modal" data-target="#updatebc">
									<span class="glyphicon glyphicon-pencil"></span>
								</a>
                                <a class="btn btn-danger deletebookcase">
									<span class="glyphicon glyphicon-trash"></span>
								</a>
								<a data-toggle="collapse" data-parent="#media-accordion" href="#booklist${index.count}" aria-expanded="true" aria-controls="collapseOne" class="btn btn-info dropbtn">
									<span class="glyphicon glyphicon-chevron-down"></span>
								</a>
							</div>
					</div><!--/.media-->
				  
			
			<div id="booklist${index.count}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			  <div class="panel-body dropbox">
                  <div class="booklist">
                  <div class="col-xs-4 col-md-3 col-lg-2" style="padding-top: 110px;padding-bottom:100px"><div class="text-center"><button class="btn btn-lg btn-primary addbook" data-toggle="modal" data-target="#newBCD"><span class="glyphicon glyphicon-plus"></span><br />加入書籍</button></div></div>
                  </div>
                 
                   </div>
			</div><!--/.media-collapse-3 -->
			
			
			<div class="data hidden">
						<div value="BCID">${bookcase.BCID}</div>
						<div value="MemberID">${bookcase.memberID}</div>
						<div value="BCName">${bookcase.BCName}</div>
						<div value="CaseRank">${bookcase.caseRank}</div>
						<div value="Display">${bookcase.display}</div>
					</div>
         </div>                   
        </c:forEach>            
 
 
 
<!--  新增書櫃                    -->
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
								class="form-control" id="new_BCName" name="BCName" value="" required/>
						</div>

						<div class="form-group col-xs-12 hidden">
							<label for="caseRank">優先排序</label> <select name="caserank">
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>

						<div class="form-group col-xs-12 hidden">
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
                    
<!--        修改書櫃              -->
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
								class="form-control" id="update_BCName" name="BCName" value="" required/>
						</div>

						<div class="form-group col-xs-12 hidden">
							<label for="caseRank">優先排序</label> <select name="update_caserank">
								<option class="true" value="0">是</option>
								<option class="false" value="1">否</option>
							</select>
						</div>

						<div class="form-group col-xs-12 hidden">
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
<!--                     end -->


<!-- DIALOG 書籍對話框 -->
		<div class="modal fade" id="newBCD" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">X <span class="sr-only">Close</span>
							</span>
						</button>
						<h3 class="modal-title">新增書籍</h3>
					</div>
					<div class="modal-body" style="overflow: auto">
					<div class="bcid hidden"></div>
						<form id="neBookform">							
							<div class="form-gorup col-xs-12" '>
							<div class="col-xs-6"><input placeholder="請輸入書名"
									style="width: 25em;height:4em;" type="text"
									class="form-control" id="searchbook" name="search" value="" /></div>
							<div class="col-xs-6"><button type="submit" class="searchB btn btn-info btn-sm"
									name="action" value="basic">
									<h4>
										<div style="height:1.5em;"class="glyphicon glyphicon-search"></div> 找書趣
									</h4>									
								</button></div>
								
										
							</div>						
													
							
							<div class='result'></div>
						
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

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
<script>
$(function() {
	
	//新增書櫃
	$('#new_btn').click(
			function(event) {
				if($('#new_BCName').val()!=""){
				event.preventDefault();
			var data = $('#newform').serialize();
			$.post("/ireading/user/bookcase/insert", data,
			function(data) {console.info(data)
			if ("1" == data) {
				alert("新增書籍資料成功");
				location.reload();
			} else {
				lert("新增書籍資料失敗");
			}
		    });
			}
			
			else{
				alert("請輸入書櫃名稱");
			}
	});
	
	
	
	//更新書櫃 塞資料
	$(".bookcase").on("click",".editbtn",function(event) {
				console.log($(this).html());
				var div = $(this).parents(".bookcase").children('.data');
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
	
	
	
	
// 	修改書櫃


	$('#up_btn').click(function(event) {
		if($('#update_BCName').val()!=""){
		event.preventDefault();
		var data = $('#updateform').serialize();
		$.post("/ireading/user/bookcase/update", data,function(data) {
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
				});}else{
					alert("請輸入書櫃名稱");
				}
	});
	
	
	
	
	//刪除書櫃
	$('.bookcase').on('click','.deletebookcase',function() {
		var bcid = $(this).parents(".bookcase").find('div[value="BCID"]').text();
		console.log(bcid);
		if (confirm("確定要刪除此書櫃？")) {
		$.post("/ireading/user/bookcase/delete", {BCID : bcid}, 
			function(data) {
			if (data[0].change == 1) {
				location.reload();
				} else {alert("BCID" + data[0].bcid + " 刪除失敗");
			location.reload();
			}
			});
		}
	});
	
	
	
	//刪除一本書
	$('.bookcase').on('click','.deletebook',function(){
		if(confirm("確定要刪除這本書嗎?")){
		var btn=$(this);
		var isbn = $(this).parents(".bookbox").find(".isbn").text();
		var bcid=$(this).parents(".bookcase").find('div[value="BCID"]').text();
		$.post("/ireading/user/bookcase/deleteBCD", {ISBN : isbn,BCID:bcid},
			function(data) {
			if(data[0].change == 1){
				btn.parents(".bookblock").remove();	
			}else{ alert("ISBN" + data[0].isbn + " 刪除失敗")
				location.reload();
			}				
		});}
	});
	
	
// 	書櫃明細 放到書櫃 
	$(".data").each(function() {
	var bcid = $(this).children('div[value="BCID"]').text();
	var booklist = $(this).parents(".bookcase").find('.booklist');
	console.log(bcid);
	$.post("/ireading/user/bookcase.controller/getBCD",{BCID : bcid},function(data) {
	console.log(data);
	$.each(data,function(i,bc) {
	var div = $('<div  class="col-xs-4 col-md-3 col-lg-2 bookblock"></div>')
	var bookbox=$('<div class="bookbox"></div>');
	var remove=$('<div class="text-right"><a class="btn btn-danger btn-xs deletebook"><span class="glyphicon glyphicon-remove"></span></a></div>');
	var imga=$(' <div class="row cover-row"></div>').append($('<a class="center-block"></a>').attr("href","#").append($('<img style="width:100px;height:150px;" class="img-responsive bookcover center-block">').attr("src","data:image/png;base64,"+bc.Cover)));
	var titlea=$('<div class="title-row row text-center"></div>').append($('<a class="booktitle"></a>').attr("href","#").text(bc.booksBean.title.substring(0,15)));
	var isbn=$('<div class="isbn hidden"></div>').text(bc.booksBean.ISBN);
	div.append(bookbox.append([remove,imga,titlea,isbn]));
	booklist.prepend(div);
	});

});		
});

//新增書籍塞值(BCID)

$('.addbook').click(function(event){
	var BCID=$(this).parents(".bookcase").find('div[value="BCID"]').text();
	console.log(BCID);
	$('#newBCD .bcid').text(BCID);
});



//新增書籍查詢
	$('.searchB').click(function(e) {
		e.preventDefault();
		$('#newBCD .result').empty();
		var BCID=$('#newBCD .bcid').text();
		var query=$('#searchbook').val();
		$.get("/ireading/user/bookcase.controller/searchBooksList",{search:query,BCID:BCID},function(data){
			console.log(data);
			var result = $('.result');
			$.each(data,function(i,book){
				console.log(book.Title);
				console.log(book.Author);
				var Cover="data:image/png;base64,"+book.Cover;
				
				var div = $('<div  class="col-xs-4 col-md-3 col-lg-2 bookblock"></div>')
				var bookbox=$('<div class="bookbox"></div>');				
				var imga=$(' <div class="row cover-row"></div>').append($('<a class="center-block"></a>').append($('<img style="width:100px;height:150px;" class="img-responsive bookcover center-block">').attr("src",Cover)));
				var titlea=$('<div class="title-row row text-center"></div>').append($('<a class="booktitle"></a>').text(book.Title.substring(0,15)));
				var add=$('<div class="text-center"><a class="btn btn-success btn-xs addbookbtn"><span class="glyphicon glyphicon-plus"></span>加入書櫃</a></div>');
				var isbn=$('<div class="isbn hidden"></div>').text(book.ISBN);
				bookbox.append([imga,titlea,add,isbn]);
				result.append(div.append(bookbox));				
								
			});
		});
	});
	
	
	$('#newBCD').on('click','.addbookbtn',function(event){
		isbn=$(this).parents('.bookbox').find('.isbn').text();
		BCID=$('#newBCD').find('.bcid').text();
		console.log(isbn+":"+BCID);
		$.post("/ireading/user/bookcase.controller/addbook",{BCID:BCID,ISBN:isbn},function(data){
			if(data[0].change=="1"){alert("加入書櫃成功");
			location.reload();
			}
			else{alert("加入書櫃失敗");
			location.reload();
			}
			
		});
		
	})
			
})

</script>
</html>