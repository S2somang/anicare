package org.anicare.jsp.admin.dog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.anicare.jsp.admin.dog.model.service.DogService;
import org.anicare.jsp.admin.dog.model.vo.Adopt;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.admin.dog.model.vo.Infomation;

/**
 * Servlet implementation class InsertDogAdoptServlet
 */
@WebServlet("/insertAdopt")
public class InsertDogAdoptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDogAdoptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		System.out.println("START SERVLET INSERT");
		
		String dcode = request.getParameter("dcode");
		String user_id = request.getParameter("user_id");
		String fin = request.getParameter("fin");
		String status = request.getParameter("status");
		String acode = request.getParameter("acode");


		HttpSession session = request.getSession();

		Adopt a = new Adopt();

		a.setDcode(dcode);
		a.setuser_id(user_id);
		a.setFin(fin);
		a.setStatus(status);
		a.setAcode(acode);

		

		int result = new DogService().insertAdoptDog(a);

		String path = "";
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectNewDog.ma;");
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "게시물 등록 실패");
			request.getRequestDispatcher(path).forward(request, response);
		}
	}


	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
