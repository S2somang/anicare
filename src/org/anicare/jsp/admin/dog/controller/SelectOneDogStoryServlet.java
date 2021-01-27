package org.anicare.jsp.admin.dog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.admin.dog.model.service.DogService;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.admin.dog.model.vo.Story;


/**
 * Servlet implementation class SelectOneDogStoryServlet
 * @param <Dtitle>
 */
@WebServlet("/selectDetail.ma")
public class SelectOneDogStoryServlet<Dtitle> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneDogStoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		HashMap<String, Object> map = new DogService().selecDetailOne(num);
		
	System.out.println("num : " + num);
		
		String path ="";
		if(map != null) {
			Story story = (Story) map.get("story");
			Dog dog = (Dog) map.get("Dog");
			System.out.println(story);
			System.out.println(dog);
			
			
			ArrayList<Dtitle> fileList = (ArrayList<Dtitle>) map.get("Dtitle");
			System.out.println(fileList);
			
			request.setAttribute("story", story);
			request.setAttribute("dog", dog);
			request.setAttribute("Dtitle", fileList);
			
			path ="views/admin/support/adminDogDetail.jsp";
		}else {
			request.setAttribute("message", "세부사항 불러오기실패");
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
