package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.user.repository.UserDAO;
import com.sist.animingle.user.repository.VetQnADTO;
import com.sist.animingle.user.repository.VeterinarianDTO;

@WebServlet("/user/veterinary.do")
public class Veterinary extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String isVet = (String)session.getAttribute("isVet");
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		if (isVet == null || isVet.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('수의사 회원이 아니면 접근할 수 없습니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		UserDAO dao = new UserDAO();
		
		VeterinarianDTO dto = dao.getVetInfo(id);
		
		List<String> vclist = dao.getVClist(id);
		List<VetQnADTO> vqlist = dao.getVQlist(id);
		
		for (VetQnADTO vqdto : vqlist) {
			
			String subject = vqdto.getVq_subject();
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			vqdto.setVq_subject(subject);
			
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("vclist", vclist);
		req.setAttribute("vqlist", vqlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/veterinary.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");

		
		String vet_clinic = req.getParameter("vet_clinic");
		String vet_address = req.getParameter("vet_address");
		String vet_addressdetail = req.getParameter("vet_addressdetail");
		String[] vet_careers = req.getParameterValues("vet_career");
		String vet_major = req.getParameter("vet_major");
		
		UserDAO dao = new UserDAO();
		VeterinarianDTO dto = new VeterinarianDTO();
		
		dto.setVet_seq(id);
		dto.setVet_clinic(vet_clinic);
		dto.setVet_address(vet_address);
		dto.setVet_addressdetail(vet_addressdetail);
		dto.setVet_major(vet_major);

		//수의사 정보 수정
		int result1 = dao.editVetInfo(dto);
		//수의사 커리어 일단 다 날림
		int result2 = dao.delVClist(id);
		//수의사 커리어 받아온 데이터로 새로 추가
		int result3 = 0;
		
		if (vet_careers != null) {
			
			for (String vet_career : vet_careers) {
				
				result3 = dao.addVClist(id, vet_career);
				
			}
			
		} else {
			result3 = 1;
		}
		
		if (result1 == 1 && result2 != -1 && result3 == 1) {
			
			resp.sendRedirect("/animingle/user/veterinary.do");
			
		} else {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('수정에 실패하였습니다.');history.back();</script>");
			writer.close();
			
		}
		
		
	}
}
