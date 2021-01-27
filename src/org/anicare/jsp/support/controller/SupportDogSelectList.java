package org.anicare.jsp.support.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuDog;

/**
 * Servlet implementation class SupportDogSelectList
 */
@WebServlet("/dogSelect.sp")
public class SupportDogSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportDogSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<SuDog> list = new SupportService().selectList();
		
		System.out.println("dog list 조회 ?" +list);
		
		String path ="";
		
		if(list != null) {
			path = "views/admin/support/adminSupportOneInsertForm.jsp";
			request.setAttribute("list",list);
			
		}else {
			path ="views/common/errorPage.jsp";
			request.setAttribute("message", "리스트 조회 실패");
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
