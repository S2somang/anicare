package org.anicare.jsp.admin.dog.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.adopt.model.service.AdoptService;
import org.anicare.jsp.adopt.model.vo.Mix;


/**
 * Servlet implementation class SelectAdoptListServlet
 */
@WebServlet("/selectAdopt.ad")
public class SelectAdoptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdoptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hihi main");
		ArrayList<Mix> list = new AdoptService().SelectList();
		
		System.out.println("Main list : " + list);
	
		
		String path ="";
		if(list != null) {
			
			path = "/views/admin/dog/adoptMain.jsp";
			request.setAttribute("list", list);
		
		}
		else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "게시판 조회 실패!");
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
