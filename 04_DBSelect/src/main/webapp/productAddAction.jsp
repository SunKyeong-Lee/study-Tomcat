<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDTO" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = null;
	int count = 0;

	if(request.getParameter("name") != "") {
		name = (String) request.getParameter("name");
	}
	if(request.getParameter("count") != "") {
		count = Integer.parseInt(request.getParameter("count"));
	}
	
	if( name ==null || count == 0 ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	// 값이 제대로 들어왔을때 > 쿼리문 사용 : DAO
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.addProduct(name, count);
	
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터가 product테이블에 들어갔습니다');");
		script.println("location.href='index.html'");
		script.println("</script>");
		script.close();
		return;
	}
%>