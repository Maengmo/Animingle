package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterAddDTO;
import com.sist.animingle.board.repository.PetsitterDAO;
import com.sist.animingle.board.repository.PetsitterEditDTO;

@WebServlet("/board/petsitteredit.do")
public class PetsitterEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String psr_seq = req.getParameter("psr_seq");
		String page = req.getParameter("page");
		
		PetsitterDAO dao = new PetsitterDAO();
		PetsitterEditDTO dto = dao.getEditData(psr_seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("psr_seq", psr_seq);
		req.setAttribute("page", page);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/petsitter/petsitteredit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    	req.setCharacterEncoding("UTF-8");
    	
    	HttpSession session = req.getSession();
    	
    	String id = (String) session.getAttribute("id");
    	String psr_writer = req.getParameter("psr_writer");
    	String psr_seq = req.getParameter("psr_seq");
    	String psr_subject = req.getParameter("title");
    	String psr_region = req.getParameter("address");
    	String psr_fromdate = req.getParameter("start-date");
    	String psr_todate = req.getParameter("end-date");
    	String psr_content = req.getParameter("content");
    	String page = req.getParameter("page");
    	
    	System.out.println(psr_content);
    	
    	PetsitterAddDTO dto = new PetsitterAddDTO();
    	dto.setPsr_writer(psr_writer);
    	dto.setPsr_subject(psr_subject);
    	dto.setPsr_region(psr_region);
    	dto.setPsr_fromdate(psr_fromdate);
    	dto.setPsr_todate(psr_todate);   
    	dto.setPsr_content(psr_content);
    	
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter writer = resp.getWriter();
    	
    	if (id.equals(psr_writer) && id != null) {
    		
    		PetsitterDAO dao = new PetsitterDAO();
    		int result = dao.petRecruitmentEdit(psr_seq, dto);
    		
    		if (result == 1) {
    	        writer.print("<script>alert('수정에 성공했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
    	        
    		} else {
    	        writer.print("<script>alert('수정에 실패했습니다.');</script>");
				writer.print("<script>location.href='/animingle/index.do'");
				
				writer.close();
    		}
    		
    	} else {
    		writer.print("<script>location.href='/animingle/index.do'");
			
			writer.close();
    	}
		
	}

}
