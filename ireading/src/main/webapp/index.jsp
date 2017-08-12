<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ireading</title>
</head>

<body>

<h1>歡迎進入專題的無底深淵</h1>
<hr>
<h1>Servlet測試</h1>
<a href="<c:url value='/user/test.controller'/>">controller測試</a><br>
<a href="<c:url value='/manager/order.controller'/>">order測試</a><br>
<a href="<c:url value='/order.servlet'/>">servlet測試</a><br>

登入畫面<br>
<a href="<c:url value='/pages/templates/frontpage.jsp'/>">登入畫面</a><br>
<br>
使用者畫面<br>
<a href="<c:url value='/user/myorder/getOrders'/>">User MyOrder頁面</a><br>
<a href="<c:url value='/user/product/sellout'/>">User SelloutProduct頁面</a><br>
<a href="<c:url value='/user/product/sellBook'/>">User SellBook頁面</a><br>
<a href="<c:url value='/user/bookcase'/>">User BookCase頁面</a><br>

<h2>Servlet測試成功 Console會顯示訊息</h2>

<hr>
<h1>已下為JNDI連線測試(使用DB為java)，可以顯示資料代表資料庫連線正常</h1>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
//Context ctx = new InitialContext();
//DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/JavaDB");
//Connection conn = dataSource.getConnection();
// Statement stmt = conn.createStatement();
// ResultSet rset = stmt.executeQuery("use ireadDB select * from Event");
// while(rset.next()) {
//     String col1 = rset.getString(1);
//     String col2 = rset.getString(2);
//     out.println("<h3>"+col1+":"+col2+"</h3>");
// }
// rset.close();
// stmt.close();
// conn.close();

%>

</body>
</html>