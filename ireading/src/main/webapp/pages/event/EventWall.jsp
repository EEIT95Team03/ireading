<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/css/bootstrap-theme.min.css"/>" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 最新編譯和最佳化的 JavaScript --> 
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>


<script>
function rand(min, max) {
	  return Math.floor(Math.random() * max) + min;
	}

	

</script>




<style type="text/css">
@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,800|Merriweather:300)
	;

@import url(https://markmurray.co/codepen/customstyle.css);

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

a, a:visited {
	display: block;
	text-decoration: inherit;
	color: inherit;
}

html, body {
	font-family: 'Open Sans', sans-serif;
	font-size: 100%;
	background: #e2e5eb;
}

.container {
	padding: 0.5em 1em 1em;
	max-width: calc(1400px + 1em);
	margin: 0 auto;
	overflow: hidden;
}

.container .blog-posts .featured {
	width: 100% !important;
	height: 250px !important;
	margin: 0.5em 0 1em 0 !important;
}

.container .blog-posts .featured .image {
	height: 250px !important;
}

.container .blog-posts .featured .content {
	height: 250px !important;
}

.container .blog-posts .row {
	display: flex;
}

.container .blog-posts .row .post:last-child {
	margin-right: 0 !important;
}

.container .blog-posts .post {
	flex: 1;
	overflow: hidden;
	background: white;
	height: 200px;
	-moz-box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	-webkit-box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 0 2px 0 rgba(0, 0, 0, 0.2);
	margin-right: 1em;
	margin-bottom: 1em;
}

.container .blog-posts .post:hover {
	-moz-box-shadow: 0 0 3px 2px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: 0 0 3px 2px rgba(0, 0, 0, 0.1);
	box-shadow: 0 0 3px 2px rgba(0, 0, 0, 0.1);
}

.container .blog-posts .post:hover .image {
	opacity: 0.8;
}

.container .blog-posts .post .image, .container .blog-posts .post .content
	{
	display: inline-block;
	position: relative;
	-moz-transition: all 500ms ease;
	-o-transition: all 500ms ease;
	-webkit-transition: all 500ms ease;
	transition: all 500ms ease;
}

.container .blog-posts .post .image {
	float: left;
	width: 50%;
	height: 200px;
	background-size: cover;
	background-position: center center;
}

.container .blog-posts .post .image .time {
	background: rgba(255, 255, 255, 0.5);
	width: 50px;
	text-align: center;
	padding: 0.5em 0;
	color: #444;
}

.container .blog-posts .post .image .time .date {
	font-weight: bolder;
}

.container .blog-posts .post .image .time .month {
	font-size: 0.7rem;
}

.container .blog-posts .post .content {
	padding: 0.5em 1em;
	width: 50%;
	-moz-box-shadow: -2px 0 2px -1px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: -2px 0 2px -1px rgba(0, 0, 0, 0.1);
	box-shadow: -2px 0 2px -1px rgba(0, 0, 0, 0.1);
	height: 200px;
}

.container .blog-posts .post .content:before {
	content: '';
	position: absolute;
	background: white;
	width: 10px;
	height: 10px;
	top: 20%;
	left: -5px;
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-moz-box-shadow: -1px 0 2px -1px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: -1px 0 2px -1px rgba(0, 0, 0, 0.1);
	box-shadow: -1px 0 2px -1px rgba(0, 0, 0, 0.1);
}

.container .blog-posts .post .content h1 {
	font-weight: 600;
	line-height: 2;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.container .blog-posts .post .content p {
	font-weight: 300;
	font-size: 0.7rem;
	line-height: 1.5;
	margin-bottom: 0.5em;
	font-family: 'Merriweather', sans-serif;
}

.container .blog-posts .post .content .meta .icon-comment {
	font-size: 0.7em;
	line-height: 2;
	margin-top: auto;
}

[class^="icon-"]:before {
	margin-right: 0.5em;
	color: #3498db;
}

img {
	max-width: 100%;
	height: auto;
}

@media screen and (max-width: 840px) {
	.row {
		display: block !important;
	}
	.row .post {
		width: 100%;
		margin: 0;
	}
}

@media screen and (max-width: 600px) {
	.content {
		width: 70% !important;
	}
	.image {
		width: 30% !important;
	}
	h1 {
		text-overflow: inherit;
		white-space: normal;
	}
}
/* clearfix */
.cf:before, .cf:after {
	content: " ";
	/* 1 */
	display: table;
	/* 2 */
}

.cf:after {
	clear: both;
}
</style>


<title>Insert title here</title>
</head>
<body>

 <div class='container'>
  <div class='blog-posts'>
  
    <div class='post featured'>
      <a href='#'>
        <div class='image' style='background-image: url(http://event.moc.gov.tw/public/data/633011322971.jpg)'>
          <div class='time'>
            <div class='date'>04</div>
            <div class='month'>APR</div>
          </div>
        </div>
        <div class='content'>
          <h1>Multiply created make behold fourth yielding living male very god.</h1>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas illo tempore at eveniet adipisci harum error deserunt in sint aspernatur magni asperiores explicabo corporis ratione praesentium illum magnam esse ipsa dignissimos quaerat perferendis dolor vero? Maiores hic modi optio eaque...</p>
          <div class='meta'>
            <div class='icon-comment'>22 Comments</div>
            <ul class='tags'>
              <li></li>
              <li></li>
            </ul>
          </div>
        </div>
      </a>
    </div>
    
    <div class='row cf'>
    
      <div class='post'>
        <a href='#'>
          <div class='image' style='background-image: url(https://unsplash.it/600/400/?random)'>
            <div class='time'>
              <div class='date'>
                24
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
      <div class='post'>
        <a href='#'>
          <div class='image' style='background-image: url(http://www.fcu.edu.tw/wSite/public/Data/f1305854042308.jpg)'>
            <div class='time'>
              <div class='date'>
                4
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
      <div class='post'>
        <a href='#'>
          <div class='image' style='background-image: url(http://blog.peatix.com/wp-content/uploads/2015/11/tokuraku201511_og.jpg)'>
            <div class='time'>
              <div class='date'>
                5
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
    </div>
    
    <div class='row cf'>
    
      <div class='post'>
        <a href='#'>
          <div class='image'>
            <div class='time'>
              <div class='date'>
                9
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
      <div class='post'>
        <a href='#'>
          <div class='image'>
            <div class='time'>
              <div class='date'>
                24
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
    </div>
    
    <div class='row cf'>
    
      <div class='post'>
        <a href='#'>
          <div class='image'>
            <div class='time'>
              <div class='date'>
                25
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
      <div class='post'>
        <a href='#'>
          <div class='image'>
            <div class='time'>
              <div class='date'>
                20
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
      <div class='post'>
        <a href='#'>
          <div class='image'>
            <div class='time'>
              <div class='date'>
                20
              </div>
              <div class='month'>MAR</div>
            </div>
          </div>
          <div class='content'>
            <h1>Man called gathering us great subdue unto herb sixth forth.</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam a nostrum nihil nulla hic laborum illum...</p>
            <div class='meta'>
              <div class='icon-comment'>22 Comments</div>
              <ul class='tags'>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </a>
      </div>
      
    </div>
    
  </div>
</div> 
  
  
  
</body>
</html>