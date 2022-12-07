<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%  // JSON test %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="product.ProductDAO" %>

<%
	// request method는 항상 GET으로 들고온다는 조건하에 작성
	
	// request로 온 값을 UTF-8로 값을 출력
	request.setCharacterEncoding("UTF-8");
	
	// request GET으로 전달된 name 값 가져오기
	String name = request.getParameter("name");
	
	// 데이터베이스에 연결해서 값 가져오기
	// 1. dao객체를 만들어서 selectProduct 메소드 실행
	ProductDAO dao = new ProductDAO();
	// 2. 그 결과를 dto에 넣기
	ProductDTO dto = dao.selectProduct(name);
	
	if (dto != null) {
		// dto에 값이 들어갔을 때 출력되는 내용
		JSONObject jobj = new JSONObject();
		jobj.put("name", dto.getName());
		jobj.put("count", dto.getCount());
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
	} else {
		JSONObject jobj = new JSONObject();
		jobj.put("result", "fail");
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
	}
	// 서버측 CORS 허용
	response.addHeader("Access-Control-Allow-Origin", "*");
%>