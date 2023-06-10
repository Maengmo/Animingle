package com.sist.animingle.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/fileupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int maxRequestSize = 1024 * 1024 * 50;

	public FileServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String path = "/asset/pic/boardpic"; // 개발자 지정 폴더
		String real_save_path = request.getServletContext().getRealPath(path);
		
		MultipartRequest multi = new MultipartRequest(request, real_save_path, maxRequestSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String fileName = multi.getOriginalFileName("upload"); // ckeditor5 static const
		
		JSONObject outData = new JSONObject();
		
		outData.put("uploaded", true);
		outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/animingle" + path
				+ "/" + fileName);
		
		System.out.println(outData.toString());
		System.out.println(request.getRealPath("/asset/pic"));
		
		response.setContentType("application/json");
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
		
	}

}
