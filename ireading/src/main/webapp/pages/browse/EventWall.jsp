<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	font-family: 微軟正黑體;;
	font-size: 90%;
	background: rgba(204, 204, 204, 0.23);
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
</head>
<body>

<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
<!-- 內容寫在這個區塊內 -->
<div class='container' style="width:450%" >
		<div class='blog-posts'>

			<!-- 第一排 -->
			<div id='eventDisplay' class='eventDisplay'>
					<div id="text">
			
			<div class='post featured' >

				
						<c:forEach var="event" items="${row1}">

							<a href='#' id="${event.EventID}" class="updatebtn">
								
								<div class='image' style='background-image: url(${event.eventImg})' value="${event.eventImg}">
									
									<div class='time'>
										<div class='date'>${event.day}</div>
										<div class='month'>${event.month}</div>
									</div>
								</div>
								<div class='content'>

									<div class="hidden eventID" id="EventID">${event.EventID}</div>
									<div class="hidden host" id="host">${event.Host}</div>
									<div class="hidden eventDate" id="eventDate"><fmt:formatDate value="${event.EventDate}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden deadline" id="deadline"><fmt:formatDate value="${event.Deadline}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden eventPhone" id="eventPhone">${event.EventPhone}</div>
									<div class="hidden eventPlace" id="eventPlace">${event.EventPlace}</div>
									<div class="hidden max" id="max">${event.max}</div>
									<div class="hidden eventName" id="eventName">${event.EventName}</div>
									<div class="hidden eventContent" id="eventContent">${event.EventContent}</div>
						
									<h1 id="eventName" class="eventName">${event.eventName}</h1>
									<p id="eventContent" class="eventContent">${event.eventContent}</p>
								</div>

							</a>
						</c:forEach>
					</div>


			<!--     第二排-3個 -->
			<div class='row cf'>
		
				<c:forEach var="event" items="${row2}">
					<div class='post'>

						<a href='#' id="${event.EventID}" class="updatebtn" >
							<div class='image' style='background-image: url(${event.eventImg})' value="${event.eventImg}">
								
								<div class='time'>
									<div class='date'>${event.day}</div>
									<div class='month'>${event.month}</div>
								</div>
							</div>
							<div class='content'>
							
									<div class="hidden eventID" id="EventID">${event.EventID}</div>
									<div class="hidden host" id="host">${event.Host}</div>
									<div class="hidden eventDate" id="eventDate"><fmt:formatDate value="${event.EventDate}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden deadline" id="deadline"><fmt:formatDate value="${event.Deadline}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden eventPhone" id="eventPhone">${event.EventPhone}</div>
									<div class="hidden eventPlace" id="eventPlace">${event.EventPlace}</div>
									<div class="hidden max" id="max">${event.max}</div>
									<div class="hidden eventName" id="eventName">${event.EventName}</div>
									<div class="hidden eventContent" id="eventContent">${event.EventContent}</div>
							
							
								<h3>${event.eventName}</h3>
								<p>${event.eventContentSub}</p>
							</div>

						</a>
					</div>
				</c:forEach>
			
			</div>
			<!-- 第二排-3個_end -->


			<!-- 第三排-2個 -->
			<div class='row cf'>
		
				<c:forEach var="event" items="${row3}">

					<div class='post'>
						<a href='#' id="${event.EventID}" class="updatebtn" >
							<div class='image' style='background-image: url(${event.eventImg})' value="${event.eventImg}">
								<div class='time'>
									<div class='date'>${event.day}</div>
									<div class='month'>${event.month}</div>
								</div>
							</div>
							<div class='content'>
							
									<div class="hidden eventID" id="EventID">${event.EventID}</div>
									<div class="hidden host" id="host">${event.Host}</div>
									<div class="hidden eventDate" id="eventDate"><fmt:formatDate value="${event.EventDate}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden deadline" id="deadline"><fmt:formatDate value="${event.Deadline}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden eventPhone" id="eventPhone">${event.EventPhone}</div>
									<div class="hidden eventPlace" id="eventPlace">${event.EventPlace}</div>
									<div class="hidden max" id="max">${event.max}</div>
									<div class="hidden eventName" id="eventName">${event.EventName}</div>
									<div class="hidden eventContent" id="eventContent">${event.EventContent}</div>
							
								<h3>${event.eventName}</h3>
								<p>${event.eventContentSub}</p>
							</div>
						</a>
					</div>

				</c:forEach>
		
			</div>
			<!-- 第三排-2個_end -->

			<!-- 第四排-3個 -->
			<div class='row cf'>
	
				<c:forEach var="event" items="${row4}">

					<div class='post'>
						<a href='#' id="${event.EventID}" class="updatebtn" >
							<div class='image' style='background-image: url(${event.eventImg})' value="${event.eventImg}">
								<div class='time'>
									<div class='date'>${event.day}</div>
									<div class='month'>${event.month}</div>
								</div>
							</div>
							<div class='content'>
							
									<div class="hidden eventID" id="EventID">${event.EventID}</div>
									<div class="hidden host" id="host">${event.Host}</div>
									<div class="hidden eventDate" id="eventDate"><fmt:formatDate value="${event.EventDate}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden deadline" id="deadline"><fmt:formatDate value="${event.Deadline}" pattern="yyyy-MM-dd HH:mm"/></div>
									<div class="hidden eventPhone" id="eventPhone">${event.EventPhone}</div>
									<div class="hidden eventPlace" id="eventPlace">${event.EventPlace}</div>
									<div class="hidden max" id="max">${event.max}</div>
									<div class="hidden eventName" id="eventName">${event.EventName}</div>
									<div class="hidden eventContent" id="eventContent">${event.EventContent}</div>
							
								<h4>${event.eventName}</h4>
								<p>${event.eventContentSub}</p>
							</div>
						</a>
					</div>

				</c:forEach>
				</div>

			<!-- 第四排-3個_end -->
		</div>
	</div>
	</div>
	</div>



	<!-- Modal-Dialog 報名活動 對話框 -->
	<div class="modal fade" id="updateEvent" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">報名活動</h3>
				</div>

				<div class="modal-body" style="overflow: auto;">

					<!--content goes here -->
					<form id="updateform">			
					<input type="text" readonly="readonly"
								 class="form-control hidden" id="new_EventID"
								name="EventID" value="">
					
						<div class="form-group col-xs-12">
							<label for="EventName">活動名稱</label> <h3
								 id="new_EventName"></h3>
								 
						</div>
<div class="col-xs-6"><img id="Eventimg" class="img-responsive" src=""><br>
<label for="EventContent">活動內容</label><h4 id="new_EventContent"></h4><br>

</div>
<div class="col-xs-6">
<div class="form-group col-xs-12">
							<label for="EventDate">活動日期</label><h4 id="new_EventDate"></h4><br>
						    <label for="Deadline">截止日期</label><h3 style="color:red" id="new_Deadline"></h3><br>
						    <label for="Max">上限人數</label><h3 style="color:red" id="new_Max"></h3><br>
						    <label for="Host">活動單位</label><h4 id="new_Host"></h4><br>
						<label for="EventPlace">活動地點</label>
						<h4 id="new_EventPlace"></h4>
<img id="new_EventPlace_img" class="img-responsive" src=""/><br>
						</div>
						
						</div>
						<div class="form-group col-xs-12 text-center">
							<button class="btn btn-primary btn-lg" id="up_btn">享。參加</button>
							<!-- 							<button class="btn btn-default" data-dismiss="modal">取消</button> -->
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="confirmBlock" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">X</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title">報名活動</h3>
				</div>

				<div id='returnMsg' class="modal-body" style="overflow: auto;">
					<br/><button id='ok'>好的。確定</button>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	
	
<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>
<script src="/ireading/js/login.js"></script>
<script src="<c:url value="/js/cart.js"/>"></script>
<script>

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				var cookieout = c.substring(name.length, c.length);
				return cookieout;
			}
		}
		return "";
	}
	

	$(function() {
		$('#ok').click(function(event) {
			event.preventDefault();
			$('#confirmBlock').modal('toggle');
		});

		$('#up_btn').click(
				function(event) {
					event.preventDefault();
					var EventID = $('#new_EventID').val();
					$.post("/ireading/user/joinevent.controller/join",{EventID:EventID},
							function(data) {
						
								console.log(data[0].insertResult);
								if (data[0].insertResult == "success") {
									alert("您報名成功");
								
									$('#confirmBlock').modal('toggle');
								} else if (data[0].insertResult == "failed") {
									alert("您已報名活動");
								}
							});
					location.reload();
				});
	});
</script>

<!--  更新活動  塞值-->
<script>
	$(function() {
		$("#eventDisplay").on(
				"click",
				".updatebtn",
				function(event) {
					
					if(getCookie("login_id")!=""){
					var content = $(this).children('.content');
					var image = $(this).children('.image');
				$("#updateEvent").find("#new_EventID").attr("value",content.children('.eventID').text());
					
					$("#updateEvent").find("#new_EventName").text(
							content.children('.eventName').text());
				$("#updateEvent").find("#Eventimg").attr("src",
						image.attr("value"));
				
					$("#updateEvent").find("#new_EventDate").text(
							content.children('.eventDate').text());
					
					$("#updateEvent").find("#new_Host").text(
							content.children('.host').text());
 					$("#updateEvent").find("#new_Host").append(
 							$("<a class='btn btn-success'><span class='glyphicon glyphicon-earphone'></span></a>").attr("href","tel:"+content.children('.eventPhone').text()));
 						
 					$("#updateEvent").find("#new_Deadline").text(
 							content.children('.deadline').text());
 					
 					$("#updateEvent").find("#new_Max").text(
 							content.children('.max').text());
 							
 					$("#updateEvent").find("#new_EventContent").text(
 							content.children('.eventContent').text());
 					var place=content.children('.eventPlace').text();
 					console.log(place);
 					var url="https://maps.googleapis.com/maps/api/staticmap?center="+place;
 					url=url+"&zoom=17&scale=false&size=400x400&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C";
 					url=url+place+"&key=AIzaSyBmqG3DNRwwpPfpvuT3XWhRlbWJ0BfmO1Y";
 					
 					$("#updateEvent").find("#new_EventPlace").text(place);
 					$("#updateEvent").find("#new_EventPlace_img").attr("src",url);
 					
 				
					$('#updateEvent').modal();
					}else{
						$('#LoginBlock').modal();
						
					}

				});
	})
</script>
</html>