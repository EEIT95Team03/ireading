<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享。找書</title>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/js/jquery.tablesorter.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value='/css/frontpage.css'/>">
<link rel="stylesheet" href="<c:url value='/css/bookpage.css'/>">
</head>
<body>
	<c:import url="/pages/templates/front/frontmenu.jsp"></c:import>
	<!-- 內容寫在這個區塊內(start) -->
	<form  action="<c:url value="/browse/searchBooks.controller/advanceSearch"/>" class="form-search"">
		
		<div class="container">
		<div id="searcher" class="row col-md-8 col-md-offset-5" style="display: inline-block;">
			<label for="categoryID">ISBN：</label>
			<span>
				<input type="text" id="ISBN" name="ISBN" placeholder="請輸入ISBN" class="input-medium search-query"></input>
			</span>
			
		</div>
		
		<div id="searcher" class="row col-md-8 col-md-offset-5" style="display: inline-block;">
			<label for="categoryID">書名：</label>
			<span>
				<input type="text" id="Title" name="Title" placeholder="請輸入書名" class="input-medium search-query"></input>
			</span>
			
		</div>
		
		<div id="searcher" class="row col-md-8 col-md-offset-5" style="display: inline-block;">
			
			<label for="CategoryID">分類：</label>
                            <select  id="CategoryID" name="CategoryID">
                                <option></option>
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
		
		<div id="searcher" class="row col-md-8 col-md-offset-5" style="display: inline-block;">
			<label for="categoryID">作者：</label>
			<span>
				<input type="text" id="Author" name="Author" placeholder="請輸入作者" class="input-medium search-query"></input>
			</span>
			
		</div>
		
		<div id="searcher" class="row col-md-8 col-md-offset-5" style="display: inline-block;">
			<label for="categoryID">出版社：</label>
			<span>
				<input type="text" id="Publisher" name="Publisher" placeholder="請輸入出版社" class="input-medium search-query"></input>
			</span>
			<span>
				<button class='btn btn-info btn-xs searchbtn'>享。找書</button>
			</span>
		</div>
			
		</div>
	</form>
	
	
    <!-- 內容寫在這個區塊內(end) -->
	<c:import url="/pages/templates/front/frontfooter.jsp"></c:import>
</body>

</html>