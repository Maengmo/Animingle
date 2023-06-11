package com.sist.animingle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.animingle.board.find.repository.FindDAO;
import com.sist.animingle.board.find.repository.FindDTO;
import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;

@WebServlet("/index.do")
public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		WagleDAO wdao = new WagleDAO();
		FindDAO fdao = new FindDAO();
		
		List<WagleDTO> wlist = wdao.indexList();
		List<FindDTO> flist = fdao.indexList();
		
		req.setAttribute("wlist", wlist);
		req.setAttribute("flist", flist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(req, resp);

	}

}
