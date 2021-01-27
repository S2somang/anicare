package org.anicare.jsp.education.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.education.model.service.EventService;
import org.anicare.jsp.introduction.model.vo.PageInfo;

/**
 * Servlet implementation class SelectEducationEventAdminServlet
 */
@WebServlet("/selectEventAdmin.ed")
public class SelectEducationEventAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectEducationEventAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//search process
		String searchTitle = "";
		if(request.getParameter("searchTitle") != null) {
			searchTitle = request.getParameter("searchTitle");
		}
		String searchContent = "";
		if(request.getParameter("searchContent") != null) {
			searchContent = request.getParameter("searchContent");
		}
		
		//page process
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 50;
		
		EventService es = new EventService();
		int listCount = es.getSearchListCount(searchTitle, searchContent);
		
		maxPage = (int)((double)listCount / limit + 0.98);
		startPage = (((int)((double)currentPage / limit + 0.98) - 1) * 10 + 1);
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		System.out.println(pi);
		
		ArrayList<HashMap<String, Object>> list = es.selectEvent(searchTitle, searchContent, pi);

		String path = "";
		if(list != null) {
			path = "views/admin/education/adminSelectEvent.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("searchTitle", searchTitle);
			request.setAttribute("searchContent", searchContent);
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "반려동물교육 불러오기 실패");
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
