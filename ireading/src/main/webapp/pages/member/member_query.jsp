<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
.margin-top-20 {
	margin-top: 20px;
}

body {
	background:
		url('http://www.wallpaperup.com/uploads/wallpapers/2012/08/30/12087/3574f899daef41d2f145eba13ff7840f.jpg');
	background-size: 100% 100%;
	background-attachment: fixed;
	background-repeat: no-repeat;
	font-family: 微軟正黑體;
	padding-bottom: 40px;
}

.auth h1 {
	color: #fff !important;
	font-weight: 300;
	font-family: 'Open Sans', sans-serif;
}

.auth h1 span {
	font-size: 21px;
	display: block;
	padding-top: 20px;
}

.auth .auth-box legend {
	color: #fff;
	border: none;
	font-weight: 300;
	font-size: 24px;
}

.auth .auth-box {
	background-color: #fff;
	max-width: 600px;
	margin: 0 auto;
	border: 1px solid rgba(255, 255, 255, 0.4);;
	background-color: rgba(255, 255, 255, 0.2);
	background: rgba(255, 255, 255, 0.2);
	margin-top: 40px;
	-webkit-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.32);
	-moz-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.32);
	box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.32);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-transition: background 1s ease-in-out;
	-moz-transition: background 1s ease-in-out;
	-ms-transition: background 1s ease-in-out;
	-o-transition: background 1s ease-in-out;
	transition: background 1s ease-in-out;
}

@media ( max-width :460px) {
	.auth .auth-box {
		margin: 0 10px;
	}
}

.auth .auth-box input::-webkit-input-placeholder { /* WebKit browsers */
	color: #fff;
	font-weight: 300;
}

.auth .auth-box input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	color: #fff;
	font-weight: 300;
}

.auth .auth-box input::-moz-placeholder { /* Mozilla Firefox 19+ */
	color: #fff;
	font-weight: 300;
}

.auth .auth-box input:-ms-input-placeholder {
	/* Internet Explorer 10+ */
	color: #fff;
	font-weight: 300;
}

.auth span.input-group-addon, .input-group-btn button {
	border: none;
	background: #fff !important;
	color: #000 !important;
}

.auth form {
	font-weight: 200 !important;
}

.auth form input[type="text"], .auth form input[type="password"], .auth form input[type="email"],
	.auth form input[type="search"] {
	border: none;
	padding: 10px 0 10px 0;
	background-color: rgba(255, 255, 255, 0) !important;
	background: rgba(255, 255, 255, 0);
	color: #fff;
	font-size: 16px;
	border-bottom: 1px dotted #fff;
	border-radius: 0;
	box-shadow: none !important;
	height: auto;
}

.auth textarea {
	background-color: rgba(255, 255, 255, 0) !important;
	color: #fff !important;
}

.auth input[type="file"] {
	color: #fff;
}

.auth form label {
	color: #fff;
	font-size: 21px;
	font-weight: 300;
}
/*for radios & checkbox labels*/
.auth .radio label, .auth label.radio-inline, .auth .checkbox label,
	.auth label.checkbox-inline {
	font-size: 14px;
}

.auth form .help-block {
	color: #fff;
}

.auth form select {
	background-color: rgba(255, 255, 255, 0) !important;
	background: rgba(255, 255, 255, 0);
	color: #fff !important;
	border-bottom: 1px solid #fff !important;
	border-radius: 0;
	box-shadow: none;
}

.auth form select option {
	color: #000;
}
/*multiple select*/
.auth select[multiple] option, .auth select[size] {
	color: #fff !important;
}

/*Form buttons*/
.auth form .btn {
	background: none;
	-webkit-transition: background 0.2s ease-in-out;
	-moz-transition: background 0.2s ease-in-out;
	-ms-transition: background 0.2s ease-in-out;
	-o-transition: background 0.2s ease-in-out;
	transition: background 0.2s ease-in-out;
}

.auth form .btn-default {
	color: #fff;
	border-color: #fff;
}

.auth form .btn-default:hover {
	background: rgba(225, 225, 225, 0.3);
	color: #fff;
	border-color: #fff;
}

.auth form .btn-primary:hover {
	background: rgba(66, 139, 202, 0.3);
}

.auth form .btn-success:hover {
	background: rgba(92, 184, 92, 0.3);
}

.auth form .btn-info :hover {
	background: rgba(91, 192, 222, 0.3);
}

.auth form .btn-warning:hover {
	background: rgba(240, 173, 78, 0.3);
}

.auth form .btn-danger:hover {
	background: rgba(217, 83, 79, 0.3);
}

.auth form .btn-link {
	border: none;
	color: #fff;
	padding-left: 0;
}

.auth form .btn-link:hover {
	background: none;
}

.auth label.label-floatlabel {
	font-weight: 300;
	font-size: 11px;
	color: #fff;
	left: 0 !important;
	top: 1px !important;
}
</style>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}

	(function(e, t, n, r) {
		function o(t, n) {
			this.$element = e(t);
			this.settings = e.extend({}, s, n);
			this.init()
		}
		var i = "floatlabel", s = {
			slideInput : true,
			labelStartTop : "20px",
			labelEndTop : "10px",
			transitionDuration : .3,
			transitionEasing : "ease-in-out",
			labelClass : "",
			typeMatches : /text|password|email|number|search|url/
		};
		o.prototype = {
			init : function() {
				var e = this;
				var n = {
					"-webkit-transition" : "all "
							+ this.settings.transitionDuration + "s "
							+ this.settings.transitionEasing,
					"-moz-transition" : "all "
							+ this.settings.transitionDuration + "s "
							+ this.settings.transitionEasing,
					"-o-transition" : "all " + this.settings.transitionDuration
							+ "s " + this.settings.transitionEasing,
					"-ms-transition" : "all "
							+ this.settings.transitionDuration + "s "
							+ this.settings.transitionEasing,
					transition : "all " + this.settings.transitionDuration
							+ "s " + this.settings.transitionEasing
				};
				if (this.$element.prop("tagName").toUpperCase() !== "INPUT") {
					return
				}
				if (!this.settings.typeMatches.test(this.$element.attr("type"))) {
					return
				}
				var r = this.$element.attr("id");
				if (!r) {
					r = Math.floor(Math.random() * 100) + 1;
					this.$element.attr("id", r)
				}
				var i = this.$element.attr("placeholder");
				var s = this.$element.data("label");
				var o = this.$element.data("class");
				if (!o) {
					o = ""
				}
				if (!i || i === "") {
					i = "You forgot to add placeholder attribute!"
				}
				if (!s || s === "") {
					s = i
				}
				this.inputPaddingTop = parseFloat(this.$element
						.css("padding-top")) + 10;
				this.$element
						.wrap('<div class="floatlabel-wrapper" style="position:relative"></div>');
				this.$element
						.before('<label for="'+r+'" class="label-floatlabel '+this.settings.labelClass+" "+o+'">'
								+ s + "</label>");
				this.$label = this.$element.prev("label");
				this.$label.css({
					position : "absolute",
					top : this.settings.labelStartTop,
					left : this.$element.css("padding-left"),
					display : "none",
					"-moz-opacity" : "0",
					"-khtml-opacity" : "0",
					"-webkit-opacity" : "0",
					opacity : "0"
				});
				if (!this.settings.slideInput) {
					this.$element.css({
						"padding-top" : this.inputPaddingTop
					})
				}
				this.$element.on("keyup blur change", function(t) {
					e.checkValue(t)
				});
				t.setTimeout(function() {
					e.$label.css(n);
					e.$element.css(n)
				}, 100);
				this.checkValue()
			},
			checkValue : function(e) {
				if (e) {
					var t = e.keyCode || e.which;
					if (t === 9) {
						return
					}
				}
				var n = this.$element.data("flout");
				if (this.$element.val() !== "") {
					this.$element.data("flout", "1")
				}
				if (this.$element.val() === "") {
					this.$element.data("flout", "0")
				}
				if (this.$element.data("flout") === "1" && n !== "1") {
					this.showLabel()
				}
				if (this.$element.data("flout") === "0" && n !== "0") {
					this.hideLabel()
				}
			},
			showLabel : function() {
				var e = this;
				e.$label.css({
					display : "block"
				});
				t.setTimeout(function() {
					e.$label.css({
						top : e.settings.labelEndTop,
						"-moz-opacity" : "1",
						"-khtml-opacity" : "1",
						"-webkit-opacity" : "1",
						opacity : "1"
					});
					if (e.settings.slideInput) {
						e.$element.css({
							"padding-top" : e.inputPaddingTop
						})
					}
				}, 50)
			},
			hideLabel : function() {
				var e = this;
				e.$label.css({
					top : e.settings.labelStartTop,
					"-moz-opacity" : "0",
					"-khtml-opacity" : "0",
					"-webkit-opacity" : "0",
					opacity : "0"
				});
				if (e.settings.slideInput) {
					e.$element.css({
						"padding-top" : parseFloat(e.inputPaddingTop) - 10
					})
				}
				t.setTimeout(function() {
					e.$label.css({
						display : "none"
					})
				}, e.settings.transitionDuration * 1e3)
			}
		};
		e.fn[i] = function(t) {
			return this.each(function() {
				if (!e.data(this, "plugin_" + i)) {
					e.data(this, "plugin_" + i, new o(this, t))
				}
			})
		}
	})(jQuery, window, document)

	$(document).ready(function() {
		//Floatlabel
		$('input').floatlabel();
		$('a, button').click(function(e) {
			e.preventDefault();
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料維護</title>
</head>
<body>
	<div class="container auth">
		<div id="big-form" class="well auth-box">
			<div class="form-group">
				<form action="<c:url value="/manager/member.controller"/>" method="POST" enctype= "multipart/form-data">
				<fieldset>
				<legend>會員資料</legend>
				
						<div class="btn-group">
							<a href="<c:url value="/pages/member/member_add.jsp"/>" class="btn btn-default">新增會員資料</a>
							<a href="<c:url value="/pages/member/member_update.jsp"/>" class="btn btn-default">更新會員資料</a>
<!-- 							<a href="example2.html" class="btn btn-default">刪除會員資料</a> -->
<%-- 							<a href="<c:url value="/pages/member/member_query.jsp"/>" class="btn btn-default">查詢會員資料</a> --%>
						</div>

						<div class="form-group">
						<label class=" control-label" for="textinput1">會員編號</label>
						<div class="">
							<input id="textinput1" type="text" name="memberID" value="${param.memberID}"
								class="form-control input-md"> <span
								class="help-block">${errors.id}</span>
						</div>
					</div>



						<div class="form-group">
							<label class=" control-label" for="button1id">選擇管理項目</label>
							<div class="">
<!-- 								<button type="submit" id="button1id" name="memaction" class="btn btn-success" value="Insert">新增會員資料</button> -->
<!-- 								<button type="submit" id="button2id" name="memaction" class="btn btn-success" value="Update">更新會員資料</button> -->
								<button type="submit" id="button3id" name="memaction" class="btn btn-success" value="Show">查詢會員資料</button>
<!-- 								<button type="submit" id="button4id" name="memaction" class="btn btn-danger" value="Delete">刪除會員資料</button> -->
								<button type="reset" class="btn btn-danger">清除</button>
							</div>
						</div>
					
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>