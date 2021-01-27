package org.anicare.jsp.support.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.anicare.jsp.support.model.vo.SuDog;

/**
 * Servlet implementation class SupportSelectOneInfoServlet
 */
@WebServlet("/reInsert.sp")
public class SupportSelectOneInfoServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportSelectOneInfoServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//게시글 번호 가져와... 
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("num " + num);
		
		HashMap<String, Object> hmap = new SupportService().selectAttachmentOne(num);
		
		System.out.println("d이게뭐 hamp :" + hmap);
		
		String path ="";
		if(hmap != null) {
			SuBoard suboard = (SuBoard) hmap.get("SuBoard");
			SuDog sudog = (SuDog) hmap.get("SuDog");
			System.out.println(suboard);
			System.out.println(sudog);
			
			
			ArrayList<SuAttachment> fileList = (ArrayList<SuAttachment>) hmap.get("SuAttachment");
			System.out.println(fileList);
			
			request.setAttribute("suboard", suboard);
			request.setAttribute("sudog",sudog);
			request.setAttribute("suattachment", fileList);
			
			path ="views/admin/support/adminSupportOneInsertForm2.jsp";
		}else {
			request.setAttribute("message", "사진 디테일 불러오기 실패");
			path ="views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
