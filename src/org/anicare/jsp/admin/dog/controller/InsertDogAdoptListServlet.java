package org.anicare.jsp.admin.dog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import org.anicare.jsp.admin.dog.model.vo.List;

/**
 * Servlet implementation class InsertDogAdoptListServlet
 */
@WebServlet("/listAdopt.ma")
public class InsertDogAdoptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDogAdoptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	
		
		ArrayList<Dog> list = new DogService().dogAdoptList();
		
		

		String path = "";
	;
			if(list != null) {
				path = "/views/admin/dog/adminDogAdoptInsertForm.jsp";
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
