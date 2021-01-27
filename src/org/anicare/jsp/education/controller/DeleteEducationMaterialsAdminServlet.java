package org.anicare.jsp.education.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.common.MyFileRenamePolicy;
import org.anicare.jsp.education.model.service.EventService;
import org.anicare.jsp.education.model.service.MaterialsService;
import org.anicare.jsp.education.model.vo.BoardAttachment;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class DeleteEducationMaterialsAdminServlet
 */
@WebServlet("/deleteMaterialsAdmin.ed")
public class DeleteEducationMaterialsAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEducationMaterialsAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root + "resources/images/education";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int bCode = Integer.parseInt(multiRequest.getParameter("bCode"));
			HashMap<String, Object> hmap = new EventService().selectDetailEvent(bCode);
			ArrayList<BoardAttachment> fileList = (ArrayList<BoardAttachment>) hmap.get("boardAttachment");
			
			int result = new MaterialsService().deleteMaterials(bCode);
			
			if(result > 0) {
				for(int i = 0; i <fileList.size(); i++) {
					File faildFile = new File(filePath + fileList.get(i));
					
					faildFile.delete();
				}
				response.sendRedirect(request.getContextPath() + "/selectMaterialsAdmin.ed");
			} else {
				request.setAttribute("message", "자료 게시판 삭제 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
	}

}
