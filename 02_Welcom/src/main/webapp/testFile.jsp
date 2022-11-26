<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 파일</title>
</head>
<body>
	<h1>JSP 파일에서의 html 내용입니다</h1>
	<% String name = "홍길동"; %>
	<p><%= name %></p>
</body>
</html>
