<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>frontfooter</title>
</head>
<body>
 <div id="footer">
    <div class="container">
        <div class="row">
            <br>
              <div class="col-md-4">
                <center>
                  <br>
                  <h4 class="footertext"><a target="_blank" href="/ireading/pages/report/Profile.jsp">關於：享。閱</a></h4>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <br>
                  <h4 class="footertext"><a target="_blank" href="/ireading/pages/report/Profile.jsp#team">我們是：享。閱</a></h4>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <br>
                  <h4 class="footertext"><a target="_blank" href="/ireading/pages/report/Profile.jsp#contact">聯絡我們</a></h4>
                </center>
              </div>
            </div>
            <div class="row">
            <p><center><p id="lasttext" ><a href="<c:url value="/manager/login.manager/page"/>"><i class="glyphicon glyphicon-copyright-mark"></i></a>資策會EEIT95 第三組 享閱二手書交易平台</p></center></p>
        </div>
    </div>  
     <a  type="button" class="btn btn-primary btn-circle btn-xl" id="cart" value="<c:url value="/browse/cart/show"/>"><i class="glyphicon glyphicon-shopping-cart"></i><span class="badge">0</span></a>
</div>

</body>
</html>