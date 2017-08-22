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
                        <fmt:parseNumber var="account"  value="${Account}" type="number" integerOnly="true"/>
                        <h1>您的享閱帳戶金額共有 <span class="account" style="color:red;">${account}</span> 元</h1>
                        
                        <div>                     
                        <div class="col-xs-12 col-sm-7 inputblock"> 
                         
                        <c:choose>
                        <c:when test="${account ge 30}">
                        <div class="col-xs-8 col-xs-offset-4"><strong>請輸入您要匯出的金額，匯出金額不得小於30元</strong></div>    
                         <div class="col-xs-4 text-right"><h4>匯出金額：</h4></div>
                        <div class="col-xs-6">
                         <input type="number" class="form-control" min="30" max="<fmt:parseNumber  value="${Account}" integerOnly="true"/>" id="output"/></div>                  
                        <div class="col-xs-2"> <button class="btn btn-warning outputbtn">匯出</button></div>
                         <div class="col-xs-8 col-xs-offset-4 msg" style="color:red;"></div>
                        </c:when>
                        <c:otherwise>
                        <h3 class="text-center"><span class="glyphicon glyphicon-exclamation-sign"></span>餘額不足，無法匯出</h3>
                        </c:otherwise>
                        </c:choose>
                       
                        
                        </div>                       
                        </div>                    
                       
                       <div>
                       <table class="col-xs-12 table">
                       <thead>
                       <tr>
                       <th class="text-center">匯出時間</th>
                        <th class="text-center">戶名</th>
                       <th class="text-center">匯出帳戶</th>
                       <th class="text-center">實收金額</th>
                       <th class="text-center">手續費</th>
                       <th class="text-center">匯出總額</th>
                       </tr>
                       </thead>
                       <tbody>
                       
                       <c:forEach var="record" items="${OutputList}">
                       <tr>
                       <td class="text-center"><fmt:formatDate value="${record.ApplyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td class="text-center">${record.AccountName}</td>
                       <td class="text-center">${record.BankID} ${record.BankAccount}</td>                       
                       <td class="text-center"><fmt:parseNumber  value="${record.TotalTransfer}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount-record.TotalTransfer}" type="number" integerOnly="true"/></td>
                       <td class="text-center"><fmt:parseNumber  value="${record.Amount}" type="number" integerOnly="true"/></td>
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
						<td class="text-center" id="check_Amount"></td>
						<td class="text-center" id="check_Fee"></td>
						<td class="text-center" id="check_Transfer" style="color:red"></td>
						</tr>
						</tbody>						
						</table>
							</div>
							<div class="form-gorup col-xs-12">
							<input class="hidden" id="TotalTransfer" name="TotalTransfer" value="">
							<input class="hidden"  id="Amount" name="Amount" value="">
								<label for="bank">銀行</label>
								<select name="BankID" required>
								<option value="004">004 – 臺灣銀行</option>
<option value="005">005 – 土地銀行</option>
<option value="006">006 – 合作商銀</option>
<option value="007">007 – 第一銀行</option>
<option value="008">008 – 華南銀行</option>
<option value="009">009 – 彰化銀行</option>
<option value="011">011 – 上海商業儲蓄銀行</option>
<option value="012">012 – 台北富邦銀行</option>
<option value="013">013 – 國泰世華銀行</option>
<option value="016">016 – 高雄銀行</option>
<option value="017">017 – 兆豐國際商業銀行</option>
<option value="018">018 – 農業金庫</option>
<option value="021">021 – 花旗(台灣)商業銀行</option>
<option value="025">025 – 首都銀行</option>
<option value="039">039 – 澳商澳盛銀行</option>
<option value="040">040 – 中華開發工業銀行</option>
<option value="050">050 – 臺灣企銀</option>
<option value="052">052 – 渣打國際商業銀行</option>
<option value="053">053 – 台中商業銀行</option>
<option value="054">054 – 京城商業銀行</option>
<option value="072">072 – 德意志銀行</option>
<option value="075">075 – 東亞銀行</option>
<option value="081">081 – 匯豐(台灣)商業銀行</option>
<option value="085">085 – 新加坡商新加坡華僑銀行</option>
<option value="101">101 – 大台北銀行</option>
<option value="102">102 – 華泰銀行</option>
<option value="103">103 – 臺灣新光商銀</option>
<option value="700">700 – 中華郵政</option>
<option value="803">803 – 聯邦商業銀行</option>
<option value="805">805 – 遠東銀行</option>
<option value="806">806 – 元大銀行</option>
<option value="807">807 – 永豐銀行</option>
<option value="808">808 – 玉山銀行</option>
<option value="809">809 – 萬泰銀行</option>
<option value="810">810 – 星展銀行</option>
<option value="812">812 – 台新銀行</option>
<option value="814">814 – 大眾銀行</option>
<option value="815">815 – 日盛銀行</option>
<option value="816">816 – 安泰銀行</option>
<option value="822">822 – 中國信託</option>				
							</select>
							</div>
							<div class="form-gorup col-xs-12">
								<label >銀行帳號 </label>
								<input type="text"
									class="form-control" name="Account" value="" required></input>
							</div>
							<div class="form-gorup col-xs-12">
								<label >戶名</label>
								<input type="text"
									class="form-control" name="AccountName" value="" required></input>
							</div>
							<div class="form-group col-xs-12">
								<button class="btn btn-danger" id="insertbtn">確定</button>
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
            $('#check_Transfer').text(output-15);
            $('#TotalTransfer').val(output-15);
             $('#check_Fee').text("15");
              $('#check_Amount').text(output);
              $('#Amount').val(output);
		}		
		
	});
	
	$('#insertbtn').click(function(event){
		event.preventDefault();
		var data=$('#outputfrom').serialize();
		$.post("/ireading/user/account/output",data,function(data){
			if(data[0].change=="1"){
				
				
				alert("匯出成功");
				location.reload()
			}
			else{
				alert("匯出失敗");
			}
			
		});
		
		
	});
	
	
})


</script>
</html>