package org.anicare.jsp.support.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.PageInfo;
import org.anicare.jsp.support.model.vo.SuBoard;

/**
 * Servlet implementation class supportOneSelectList
 */
@WebServlet("/oneSelectList.sp")
public class supportOneSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supportOneSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//pagin중 안되면 걍 이거 써
		//ArrayList<SuBoard> list = new SupportService().oneSelectList();
		
		
		//System.out.println("리스트 조회값 (서블릿: /"+list);
		
		
		
//		response.setContentType("application/json; charset=UTF-8");
//		
//		new Gson().toJson(list, response.getWriter());
		
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		limit = 8;
		
		SupportService ss = new SupportService();
		
		int listCount = ss.getListcount();
		
		System.out.println("전체 게시물 목록 갯수" + listCount);
		
		System.out.println("currentPage가 뭐ㅑ? :" +currentPage);
		//maxPage =(int)((double) listCount /limit + 1.6);
		maxPage = listCount/limit == 0 ? listCount/limit : (listCount/limit)+1; 
		if(maxPage ==0 ) {
			maxPage =1;
		}
		System.out.println("maxPage : " +maxPage);
		
		startPage = (((int)((double) currentPage/ limit + 0.875))-1) *10 +1;
		// 1/7 -> 0.14 +0.9 = 1 -> 1-1 == 0 +1 
		
		System.out.println(" startPage : " + startPage);
		
		endPage = startPage + 5 -1;  //버튼이 5개 보여질거라..
		
		System.out.println("endPage : "+ endPage); 
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<SuBoard> list = new SupportService().oneSelectList(pi);
		
		
		String path ="";
		if(list != null) {
			path="views/admin/support/adminSupportOneOnOne.jsp";
			request.setAttribute("list",list);
			request.setAttribute("pi", pi);
		}else {
			path="views/common/errorPage.jsp";
			request.setAttribute("message","조회실패");
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
