package org.anicare.jsp.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.member.model.vo.Member;
import org.anicare.jsp.myPage.model.sevice.MyPageService;
import org.anicare.jsp.myPage.model.vo.MyPage;


/**
 * Servlet implementation class MyPageResource
 */
@WebServlet("/MyPageResource")
public class MyPageResource extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageResource() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member LoginUser = (Member) request.getSession().getAttribute("loginUser");
		String requestId =LoginUser.getUserId();
		
		MyPage mp = new MyPageService().getMySupportInfo(LoginUser);
		
		System.out.println(mp);
		
		String path = "";
		if(mp != null) {
			path = "views/member/memberMyPage.jsp"; 
			request.setAttribute("myPage", mp);
			request.getRequestDispatcher(path).forward(request, response);
			
		}else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "마이페이지 입장 실패 ㅜㅜ");
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
