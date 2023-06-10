package com.sist.animingle.board.find;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.find.repository.FindDAO;
import com.sist.animingle.board.find.repository.FindDTO;

@WebServlet("/board/findlist.do")
public class FindList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		session.getAttribute("id");
		//session.setAttribute("id", "pecan789");)
		session.setAttribute("read", "n");
		
		String page= req.getParameter("page");
		
		
		int nowPage = 0;	//현재 페이지 번호
		int totalCount = 0; //총 게시물 수
		int pageSize = 5;	//한페이지에서 출력할 게시물 수
		int totalPage = 0;	//총 페이지 수
		int begin = 0;
		int end = 0;
		int n = 0;
		int loop = 0;
		int blockSize = 5;	//한번에 보여질 페이지 개수
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		String word = req.getParameter("word");
		String prefix = req.getParameter("prefix");
		String search = "n";
				
		
		if (( word == null)
	             ||  word.equals("")) {
	         search = "n";
	      } else {
	         search = "y";
	      }
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("word", word);
		map.put("prefix", prefix);
		map.put("search", search);
		
		FindDAO dao = new FindDAO();
		
		List<FindDTO> list = dao.list(map);
		
		totalCount = dao.getTotalCount();
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		StringBuilder sb = new StringBuilder();
		
        loop = 1; //루프 변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 번호
		
		//이전 10페이지x
		if (n == 1) {
			sb.append(String.format("<a href=\"#!\">&lt;</a>"));
		} else {
			sb.append(String.format("<a href=\"/animingle/board/findlist.do?page=%d&prefix=%s&prefix%s\">&lt;</a>", n-1, prefix, word));
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				sb.append(String.format("<a href=\"#!\" style='color:tomato';> %d </a>", n));
			} else {
				sb.append(String.format("<a href=\"/animingle/board/findlist.do?page=%d&prefix=%s&word=%s\"> %d </a>", n, prefix, word, n));
			}
			
			loop++;
			n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			sb.append(String.format("<a href=\"#!\">&gt;</a>"));
		} else {	
			sb.append(String.format("<a href=\"/animingle/board/findlist.do?page=%d&prefix=%s&word=%s\">&gt;</a>", n, prefix, word));
		}
						
		req.setAttribute("list",list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagination", sb);
		req.setAttribute("map", map);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/find/findlist.jsp");
		dispatcher.forward(req, resp);

	}
}