package com.sist.animingle.board.adoption;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.adoption.repository.AdoptionDAO;
import com.sist.animingle.board.adoption.repository.AdoptionDTO;

@WebServlet("/board/adoptionlist.do")
public class AdoptionList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AdoptionList.java
		String page= req.getParameter("page");
		
		int nowPage = 0;	//현재 페이지 번호
		int totalCount = 0; //총 게시물 수
		int pageSize = 12;	//한페이지에서 출력할 게시물 수
		int totalPage = 0;	//총 페이지 수
		int begin = 0;
		int end = 0;
		int n = 0;
		int loop = 0;
		int blockSize = 5;	//한번에 보여질 페이지 개수
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
			
			
		AdoptionDAO dao = new AdoptionDAO(); 
		
		List<AdoptionDTO> list = dao.apiContent((nowPage-1) * pageSize + 1);
		
		
		totalCount = dao.getTotal();
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
		StringBuilder sb = new StringBuilder();
		
        loop = 1; //루프 변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 번호
		
		//이전 10페이지x
		if (n == 1) {
			sb.append(String.format("<a href=\"#!\">&lt;</a>", blockSize));
		} else {
			sb.append(String.format("<a href=\"/animingle/board/adoptionlist.do?page=%d\">&lt;</a>", n-1, blockSize));
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				sb.append(String.format("<a href=\"#!\" style='color:tomato';> %d </a>", n));
			} else {
				sb.append(String.format("<a href=\"/animingle/board/adoptionlist.do?page=%d\"> %d </a>", n, n));
			}
			
			loop++;
			n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			sb.append(String.format("<a href=\"#!\">&gt;</a>", blockSize));
		} else {
			sb.append(String.format("<a href=\"/animingle/board/adoptionlist.do?page=%d\">&gt;</a>", n, blockSize));
		}
		
        
		req.setAttribute("list", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagination", sb);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/adoption/adoptionlist.jsp");
		dispatcher.forward(req, resp);

	}

}
