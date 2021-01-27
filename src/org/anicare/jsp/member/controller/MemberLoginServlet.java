package org.anicare.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.anicare.jsp.member.model.service.MemberService;
import org.anicare.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
      
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		Member requestMember = new Member();
		requestMember.setUserId(userId);
		requestMember.setUserPwd(userPwd);
		
		Member loginUser = new MemberService().loginCheck(requestMember);
		
		System.out.println(loginUser);
		
		String path="";
		if(loginUser !=null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			path = "index.jsp";
			response.sendRedirect(path);
		} else {
			request.setAttribute("message", "로그인 실패!");
			
			path = "views/common/errorPage.jsp";
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
