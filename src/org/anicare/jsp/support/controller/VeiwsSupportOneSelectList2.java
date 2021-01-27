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
import org.anicare.jsp.support.model.vo.PageInfo;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.anicare.jsp.support.model.vo.SuDog;

import com.google.gson.Gson;

/**
 * Servlet implementation class supportOneSelectList
 */
@WebServlet("/ViewsSupportList.sp")
public class VeiwsSupportOneSelectList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VeiwsSupportOneSelectList2() {
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
		
		limit = 12;
		
		SupportService ss = new SupportService();
		
		int listCount = ss.getListcount();
		
		System.out.println("전체 게시물 목록 갯수" + listCount);
		
		System.out.println("currentPage가 뭐ㅑ? :" +currentPage);
		//maxPage =(int)((double) listCount /limit - 1.6);
		maxPage = listCount/limit == 0 ? listCount/limit : (listCount/limit)-1; 
		if(maxPage == 0 ) {
			maxPage =1;
		}
		System.out.println("maxPage : " +maxPage);
		
		startPage = (((int)((double) currentPage/ limit + 0.916667))-1) *10 +1;
		// 1/7 -> 0.14 +0.9 = 1 -> 1-1 == 0 +1 
		
		System.out.println(" startPage : " + startPage);
		
		endPage = startPage + 5 -1;  //버튼이 5개 보여질거라..
		
		System.out.println("endPage : "+ endPage); 
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//ArrayList<SuBoard> list = new SupportService().viewsOneSelectList(pi);
		
		
		//게시글 번호 가져와... 
//				int num = Integer.parseInt(request.getParameter("num"));
//				
//				System.out.println("num " + num);
				
			
				HashMap<String, Object> hmap = new SupportService().viewsOneSelectList(pi);
				System.out.println("pi : " + pi);
				System.out.println("잘 조회 해왔는감.. hamp :" + hmap); //여기서 자꾸 9를 가져옴
				
				String path ="";
				if(hmap != null) {
					SuBoard suboard = (SuBoard) hmap.get("SuBoard");
					//SuDog dog = (SuDog) hmap.get("SuDog");
					//System.out.println(suboard);
					//System.out.println(sudog);
					
					
					
					ArrayList<SuAttachment> fileList = (ArrayList<SuAttachment>) hmap.get("SuAttachment");
					System.out.println("몇개야 fileList : "+fileList);
					System.out.println("몇개야 fileList?? : "+fileList.size());
					ArrayList<SuBoard> list =  (ArrayList<SuBoard>) hmap.get("board");
					ArrayList<SuDog> dog = (ArrayList<SuDog>) hmap.get("SuDog");
					System.out.println("SuBoard  : " + list);
					System.out.println("dog : " + dog);
					System.out.println("9가 왜나와!!? :" +list);
					
					
					//request.setAttribute("suboard", suboard);
					//request.setAttribute("sudog",sudog);
					request.setAttribute("suattachment", fileList);
					request.setAttribute("pi", pi);
					request.setAttribute("boardList",list);
					request.setAttribute("dog", dog);
					request.setAttribute("hmap",hmap);
					path ="views/support/supportOneOnOne.jsp";
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
