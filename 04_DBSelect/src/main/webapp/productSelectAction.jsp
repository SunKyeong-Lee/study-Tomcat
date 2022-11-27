<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // DTO, DAO 임포트 %>
<%@ page import="product.ProductDTO" %>
<%@ page import="product.ProductDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>검색 결과 확인</title>
</head>
<body>
<%
	// post를 이용해서 찾아올 때 필요
	// request로 온 값을 UTF-8로 값을 출력
	request.setCharacterEncoding("UTF-8");
	
	// request로 전달된 name 값 가져오기
	String name = request.getParameter("name");
	
	// 데이터베이스에 연결해서 값 가져오기
	// 1. 값을 저장할 공간 선언
	ProductDTO dto = null;
	// 2. 쿼리문을 사용해서 값 넣어주기
	// dao객체를 만들어서 selectProduct 메소드 실행 > 그 결과를 dto에 넣기
	ProductDAO dao = new ProductDAO();
	dto = dao.selectProduct(name);
	
	if (dto == null) {
%>
	조회결과가 없습니다.
<%
	} else {
%>
	조회결과 <br>
	물건이름 : <%= dto.getName() %> <br>
	물건개수 : <%= dto.getCount() %>
<%
	}
%>
</body>
</html>