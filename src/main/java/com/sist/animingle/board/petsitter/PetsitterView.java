package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterDAO;
import com.sist.animingle.board.repository.PetsitterViewDTO;

@WebServlet("/board/petsitterview.do")
public class PetsitterView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session = req.getSession();
    	
    	String psr_seq = req.getParameter("psr_seq");
    	String page = req.getParameter("page");
    	
    	Object id = session.getAttribute("id");
    	Object isPet = session.getAttribute("isPet");
    	
    	PetsitterViewDTO dto = new PetsitterViewDTO();
    	
    	PetsitterDAO dao = new PetsitterDAO();
    	dto = dao.petView(psr_seq);
    	
    	dao = new PetsitterDAO();
    	List<PetsitterViewDTO> plist = dao.petLog(psr_seq);

    	req.setAttribute("dto", dto);
    	req.setAttribute("id", id);
    	req.setAttribute("isPet", isPet);
    	req.setAttribute("page", page);
    	req.setAttribute("plist", plist);
    	req.setAttribute("psr_seq", psr_seq);
    	
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/petsitter/petsitterview.jsp");
        dispatcher.forward(req, resp);

    }

}