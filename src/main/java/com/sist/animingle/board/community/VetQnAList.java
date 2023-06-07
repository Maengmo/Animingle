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
import com.sist.animingle.board.repository.VetQnAListDTO;

@WebServlet("/board/vetqnalist.do")
public class VetQnAList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int currentPage = 1;	// 현재 페이지 번호
		int itemsPerPage = 5;	// 페이지당 항목
		
		String pageParam = req.getParameter("page");
		if (pageParam != null) {
			currentPage = Integer.parseInt(pageParam);
		}
		
		HttpSession session = req.getSession();
		Object id = session.getAttribute("id");
		
		VetQnADAO dao = new VetQnADAO();
		
		// 모든 게시물의 수를 담는다
		int totalDataCount = dao.getTotalDataCount();
		
		// 현재 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalDataCount / itemsPerPage);
		
		// 모든 게시글 목록을 리스트에 담는다
        List<VetQnAListDTO> list = dao.getBoardContent(currentPage, itemsPerPage);
        
        dao = new VetQnADAO();
        List<VetQnAListDTO> clist = dao.getCommentCnt();
		
        //페이징 이전 페디 불러오는 코드
		//List<VetQnAListDTO> list = dao.list();
        
        int maxPage = 5; // 한 번에 표시할 최대 페이지 수
        int startPage = Math.max(currentPage - (maxPage / 2), 1);
        int endPage = Math.min(startPage + maxPage - 1, totalPage);
		
        req.setAttribute("id", id);
		req.setAttribute("list", list);
		req.setAttribute("clist", clist);
		req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/vetqnalist.jsp");
		dispatcher.forward(req, resp);

	}

}