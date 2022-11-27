<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // 임포트 DTO, DAO // java.io.PrintWriter : 자바스크립트 출력용 %>
<%@ page import="book.BookDTO" %>
<%@ page import="book.BookDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%  
	// 현재 페이지는 자바를 이용하여 데이터를 DB에 넣어주는 페이지
	// 받아온 값을 utf-8로 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//받아온 값을 DTO에 저장하기 위해 선언
	String title = null;
	int count = 0;
	
	// title의 값과 count의 값을 request에서 받아와서 넣기
	if(request.getParameter("title") != null) {
		// getParameter("title") form에서보낸 title 값으로 호출
		title = (String) request.getParameter("title");
	}
	if(request.getParameter("count") != null && request.getParameter("count") != "") {
		// getParameter("count") form에서보낸 count 값으로 호출
		// request.getParameter()은 항상 문자열 > 문자열을 숫자로 바꾸기위해 parseInt사용
		count = Integer.parseInt(request.getParameter("count"));
	}
	
	// 값이 다 들어오지 않았을 때
	// 자바스트립트(alert)로 값이 없음을 안내
	if(title == null || count == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 되지 않은 사항이 있습니다')");
		script.println("history.back();"); // 뒤로가기
		script.println("</script>");
		script.close();
		return;
	}
	
	// 데이터 베이스에 값이 들어왔을 때
	// 값이 다 들어온것을 확인 후에, DAO를 통해서 데이터베이스에 쿼리문 작성
	BookDAO bookdao = new BookDAO();
	// result에 쿼리문을 실행하고 그 결과가 숫자값으로 들어옴 1 or -1
	int result = bookdao.addBook(title, count);
	// 자바스트립트(alert)로 값이 들어갔음을 안내
	if(result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스에 book값이 들어갔습니다');");
		script.println("location.href='./index.html'");
		script.println("</script>");
		script.close();
		return;
	}
%>