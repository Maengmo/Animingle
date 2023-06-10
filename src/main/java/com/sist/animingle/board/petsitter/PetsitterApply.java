package com.sist.animingle.board.petsitter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.PetsitterApplyDTO;
import com.sist.animingle.board.repository.PetsitterDAO;

@WebServlet("/board/petsitterapply.do")
public class PetsitterApply extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String isPet = (String) session.getAttribute("isPet");
		String psr_seq = req.getParameter("psr_seq");
		String page = req.getParameter("page");
		
		PetsitterApplyDTO dto = new PetsitterApplyDTO();
		
		dto.setPs_id(id);
		dto.setPsr_seq(psr_seq);
		
		PetsitterDAO dao = new PetsitterDAO();
		List<PetsitterApplyDTO> dlist = dao.checkDuplication(psr_seq);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter writer = resp.getWriter();
		
		for (PetsitterApplyDTO d : dlist) {
			
			if (d.getPs_id().equals(id)) {
				
				writer.print("<script>alert('이미 신청기록이 있습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
				return;
			}
			
		}
		
		if (id != null && isPet.equals("Y")) {
			dao = new PetsitterDAO();
			int result = dao.petApply(dto);
			
			if (result == 1) {
				writer.print("<script>alert('신청을 완료했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
				
			} else {
				writer.print("<script>alert('신청을 실패했습니다.');</script>");
				writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
				
				writer.close();
			}
	        
		} else {
	        writer.print("<script>alert('펫시터 계정만 신청이 가능합니다.');</script>");
			writer.print("<script>location.href='/animingle/board/petsitterview.do?psr_seq=" + psr_seq + "&page=" + page + "'</script>");
			
			writer.close();
		}

	}

}
