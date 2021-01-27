package org.anicare.jsp.support.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuBoard;

import com.google.gson.Gson;

/**
 * Servlet implementation class SupportOneSearchServlet
 */
@WebServlet("/searchName.sp")
public class SupportOneSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportOneSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String name = request.getParameter("search");
		
		System.out.println("검색 조건 :" + name);
		
		
		ArrayList<SuBoard> slist = new SupportService().searchName(name);
		System.out.println("검색 결과 " + slist );
//		
		
		response.setContentType("application/json; charset=UTF-8"); 
		
		new Gson().toJson(slist, response.getWriter());
		
		
		
//		String path = "";
//		if(list != null) {
//			System.out.println("성ㄷ공한거겠지? ");
//			path="views/admin/support/adminSupportOneOnOne.jsp";
//			request.setAttribute("list",list);
//		}else {
//			path ="views/common/erorPage.jsp";
//			request.setAttribute("message", "검색 조회 실풰 ");
//			
//			
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//		
//		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
