package org.anicare.jsp.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.anicare.jsp.member.model.vo.Member;
import org.anicare.jsp.myPage.model.sevice.MyPageService;

/**
 * Servlet implementation class modifyMemberMyPage
 */
@WebServlet("/modifyMyPage.me")
public class ModifyMemberMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberMyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member LoginUser = (Member) request.getSession().getAttribute("loginUser");
		String requestId = LoginUser.getUserId();
		
		String phone = request.getParameter("phone");
		String email  = request.getParameter("email");
		String address =request.getParameter("address");
		
		
		
	   Member Loginuser = new Member();
		
	   Loginuser.setPhone(phone);
	   Loginuser.setAddress(address);
	   Loginuser.setEmail(email);
		System.out.println("담긴 내용 : " + Loginuser);
		
		Member loginUser = new MyPageService().updateMyInfo(Loginuser , requestId);
		
		String page = "";
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			page = "views/member/myPageChangeInfo.jsp";
			response.sendRedirect(page);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("message", "회원 수정 실패");
			request.getRequestDispatcher(page).forward(request, response);
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
