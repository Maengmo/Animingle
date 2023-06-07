package com.sist.animingle.board.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.VetQnADAO;
import com.sist.animingle.board.repository.VetQnAViewDTO;

@WebServlet("/board/vetqnaview.do")
public class VetQnAView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Object id = session.getAttribute("id");
		Object isVet = session.getAttribute("isVet");
		
		String seq = req.getParameter("vq_seq");
		
		VetQnADAO dao = new VetQnADAO();
		
		if (session.getAttribute("read" + seq) == null 
				|| session.getAttribute("read" + seq).toString().equals("n")) {
			
			//읽음 증가
			dao.updateReadcount(seq);
			session.setAttribute("read" + seq, "y");
			
		}
		
		dao = new VetQnADAO();
		VetQnAViewDTO dto = dao.viewList(seq);
		List<VetQnAViewDTO> alist = dao.answerList(seq);
		
		dao = new VetQnADAO();
		List<VetQnAViewDTO> clist = dao.commentList(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("alist", alist);
		req.setAttribute("clist", clist);
		req.setAttribute("vq_seq", seq);
		req.setAttribute("id", id);
		req.setAttribute("isVet", isVet);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/vetqnaview.jsp");
		dispatcher.forward(req, resp);

	}

}
