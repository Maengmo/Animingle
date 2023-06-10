package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterDAO;
import com.sist.animingle.board.repository.PetsitterAddDTO;

@WebServlet("/board/petsitteradd.do")
public class PetsitterAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/petsitter/petsitteradd.jsp");
        dispatcher.forward(req, resp);

    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");
    	
    	HttpSession session = req.getSession();
    	
    	Object id = session.getAttribute("id");
    	
    	String title = req.getParameter("title");
    	String address = req.getParameter("address");
    	String startDate = req.getParameter("start-date");
    	String endDate = req.getParameter("end-date");
    	String text = req.getParameter("text");
    	System.out.println(text);
    	
    	PetsitterAddDTO dto = new PetsitterAddDTO();
    	
    	dto.setPsr_writer(id + "");
    	dto.setPsr_subject(title);
    	dto.setPsr_content(text);
    	System.out.println(dto.getPsr_content());
    	dto.setPsr_fromdate(startDate);
    	dto.setPsr_todate(endDate);
    	dto.setPsr_region(address);
    	
    	PetsitterDAO dao = new PetsitterDAO();
    	
    	if (id != null) {
    		
    		int result = dao.petRecruitmentAdd(dto);
    		resp.sendRedirect("/animingle/board/petsitter.do");
    		
    	} else {
    		resp.setContentType("text/html;charset=UTF-8");
		    PrintWriter out = resp.getWriter();
		    out.println("<script>alert('로그인 후 이용가능합니다.');</script>");
		    resp.sendRedirect("/animingle/board/petsitter.do");
    	}
    	
    	
    	
    }

}