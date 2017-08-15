<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享閱-ireading</title>

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
 <link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
 <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
<style type="text/css">

/* 首頁 */
.video-part
{
	width: 100%;
	position: relative;
	overflow: inherit;
	margin-top:-21px;
}
.video-part video
{
	margin-top: -15%;
	width: 100%;


}
.video-part-content
{
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	padding-top: 8%;
	background:rgba(146, 146, 146, 0.47) ;

}

.video-part-content .carousel-caption
{
	position: relative !important;
	left: 0%;
	right: 0%;
}
.video-part-content .carousel-indicators
{
	top: 316px;
}
.video-part-content .carousel-caption h1
{
font-size: 50px;
}
.video-part-content .carousel-caption p
{
font-size: 20px;
}
.affix
{
	width: 100%;
	transition: ease 0.5s;
	background: #fff !important;
  border-bottom: 2px solid #5775bd !important;
}
.btn-info
{
	background: #5674bc;
	border: 1px solid #5674bc;
	border-radius: 0px;
		transition: ease 0.5s;
}
.btn-info
{
	color: #5674bc;
	transition: ease 0.5s;
}
.full-width
{
	width: 100%;
	float: left;
}
.video-part-content .btn-info:hover {
  color: #fff;
  border: 1px solid #fff;
  transition: ease 0.5s;
  background: transparent;
}

.btn-info {
    background: rgb(128, 190, 176) none repeat scroll 0 0;
    border: 1px solid rgb(128, 190, 176);
    border-radius: 0;
    color: #fff;
    transition: all 0.5s ease 0s;
        border-radius: 10px;
}
        .searchblock {
        }
#searchbox{
	font-size:50px;
	height: 70px;
        background-color: rgba(228, 228, 228, 0.5);
    border: 2px solid white;
    color: white;
    border-radius: 10px;
	
}

@-webkit-keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
}

@-webkit-keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
  animation-delay:1s;
  animation-duration:2s;
}


/*block2*/

        .homeblock2 {
          background: url("/ireading/images/homepic2.png") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  margin-top:-20px;
  height:800px;
  vertical-align:middle;
        }

     .homeblock2 .row { padding-top: 150px;
       color: white;
    font-weight: 800;
        }
</style>

</head>
<body>
<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
<!-- 內容寫在這個區塊內 -->
 <section >
<div class="video-part">
<div class="embed-responsive embed-responsive-16by9"> <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/SKVcQnyEIT8?version=3&loop=1&&playlist=SKVcQnyEIT8&autoplay=1&controls=0&showinfo=0"></iframe>
</div>

<div class="container">
<div class="video-part-content">
          
      <div class="col-xs-12 animated fadeInUp searchblock">
       
      	<div  class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3 text-center">
              <h1 style="color:white">享受閱讀，與書香共舞</h1>
              <form  action="<c:url value="/browse/searchBooks.controller/searchBooksList"/>">
     <h1> <input type="text" class="form-control" id="searchbox"  name="search" placeholder="請輸入書名或作者"/></h1>
      <button type="submit" class="btn btn-info btn-lg"><h1><span class="glyphicon glyphicon-search"></span> 找書趣</h1></button>
      </form>
      </div>
           </div>
     
      </div>	



</div>
 </div>

<div class="homeblock2" >
      <div class="row text-center  col-xs-12 col-md-8 col-md-offset-2">
      <h1>加入享閱你可以</h1>
      <h3>以最划算的價格買到想看得二手書</h3>
      <h3>看完的書，拿來這裡換現金</h3>
      <h3>擁有個人書櫃，建立個人書單</h3>
      <h3>撰寫與瀏覽書評，和大家一同交流你的想法</h3>
      <h3>參加會員獨享活動</h3>
       <a  class="btn btn-info btn-lg" data-toggle="modal" data-target="#LoginBlock"><h1>快加入享閱</h1></a>
      </div>
  </div>

</section>
<c:import url="/pages/templates/front/frontfooter(noCart).jsp"></c:import>
</body>
<script src="<c:url value="/js/login.js"/>"></script>


</html>