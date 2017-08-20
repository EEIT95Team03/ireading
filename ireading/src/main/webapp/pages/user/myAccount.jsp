<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
     .inputblock{
     padding: 10px;
    background-color: rgba(109, 139, 191, 0.43);
    border-radius: 10px;
    margin-top: 10px;
    margin-bottom: 20px;}
     </style>
</head>
<body>
 <c:import url="/pages/templates/user/usermenu.jsp"></c:import>

                    <div  class="col-lg-11 col-lg-offset-1" style="padding-bottom: 50px;">
                 <!--    內容寫這 -->
                    
                        <h1><span class="glyphicon glyphicon-credit-card"></span>我的帳戶</h1>  
                        <h1>您的享閱帳戶金額共有 <span class="account" style="color:red;"><fmt:parseNumber  value="${Account}" type="number" integerOnly="true"/></span> 元</h1>
                        
                        <div>                     
                        <div class="col-xs-12 col-sm-7 inputblock"> 
                        <div class="col-xs-8 col-xs-offset-4"><strong>請輸入您要匯出的金額，匯出金額不得小於30元</strong></div>     
                        <div class="col-xs-4 text-right"><h4>匯出金額：</h4></div>
                        <div class="col-xs-6">
                         <input type="number" class="form-control" min="30" max="<fmt:parseNumber  value="${Account}" integerOnly="true"/>" id="output"/></div>                  
                        <div class="col-xs-2"> <button class="btn btn-warning outputbtn">匯出</button></div>
                         <div class="col-xs-8 col-xs-offset-4 msg" style="color:red;"></div>
                        
                        </div>                       
                        </div>                    
                       
                       <div>
                       <table class="col-xs-12">
                       <thead>
                       <tr>
                       <th class="text-center">匯出時間</th>
                       <th class="text-center">匯出帳號</th>
                       <th class="text-center">實收金額</th>
                       <th class="text-center">手續費</th>
                       <th class="text-center">匯出總額</th>
                       </tr>
                       </thead>
                       <tbody>
                       
                       <c:forEach var="record" items="${OutputList}">
                       <tr>
                       <td class="text-center"><fmt:formatDate value="${record.ApplyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <td class="text-center">${record.BankAccount}</td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount-record.TotalTransfer}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.TotalTransfer}" type="number" integerOnly="true"/></td>
                       </tr>
                       
                       
                       </c:forEach>
                       
                       
                       </tbody>
                       
                       </table>
                       </div>
                       
                       
                       
       <!-- DIALOG 匯出金額對話框 -->
		<div class="modal fade" id="outputModal" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">X <span class="sr-only">Close</span>
							</span>
						</button>
						<h3 class="modal-title">匯出帳戶</h3>
					</div>
					<div class="modal-body" style="overflow: auto;">
						<form id="outputfrom">
						<div class="form-gorup col-xs-12">
						<table class="table">
						<thead>
						<tr>
						<th class="text-center">匯出金額</th>
						<th class="text-center">手續費</th>
						<th class="text-center">實收金額</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<td class="text-center" id="check_Transfer"></td>
						<td class="text-center" id="check_Fee"></td>
						<td class="text-center" id="check_Amount" style="color:red"></td>
						</tr>
						</tbody>						
						</table>
							</div>
							<div class="form-gorup col-xs-12">
								<label for="bank">銀行</label>
								<select name="bank">
								<option value="700">中華郵政</option>
								<option value="004">臺灣銀行</option>
								<option value="005">土地銀行</option>
								<option value="006">合作金庫</option>
								<option value="007">第一銀行</option>
								<option value="008">華南銀行</option>
								<option value="012">台北富邦</option>
								<option value="013">國泰世華</option>
								<option value="050">台灣企銀</option>
								<option value="808">玉山銀行</option>
								<option value="812">台新銀行</option>
								<option value="822">中國信託</option>						
								</select>
							</div>
							<div class="form-gorup col-xs-12">
								<label for="rate">銀行帳戶 </label>
								<input type="text"
									class="form-control" name="account" value=""></input>
							</div>
							<div class="form-gorup col-xs-12">
								<label for="rate">戶名</label>
								<input type="text"
									class="form-control" name="name" value=""></input>
							</div>
							<div class="form-group col-xs-12">
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

</body>
<script type="text/javascript" src="<c:url value="/js/slidemenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/login.js"/>"></script>
<script>
$(function(){
	
	$('.outputbtn').click(function(event){
		var max=parseInt($('.account').text());
		var min=30;
		var str=$('#output').val();
		var output=parseInt(str);
		
        if(str==""){
        	$('.msg').text("請輸入金額");			
        }
        else if(output<min)
			{
			$('.msg').text("金額不得小於30元");			
			}
		else if(output>max){
			$('.msg').text("金額不得大於帳戶金額");
		}
		else{
			$('.msg').text("");
            $('#outputModal').modal();
            $('#output').val("");
            $('#check_Transfer').text(output);
             $('#check_Fee').text("15");
              $('#check_Amount').text(output-15);
		}
		
		
		
		
	})
	
	
	
	
})


</script>
</html>