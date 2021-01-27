package org.anicare.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.member.model.service.MemberService;
import org.anicare.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertCompany
 */
@WebServlet("/insertMember2.me")
public class MemberInsertCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String userPwd = request.getParameter("userPwd");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 +"-"+ tel2 + "-" + tel3;
		String email = request.getParameter("email");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String address = add1 + "$" +add2;
		String bn = request.getParameter("bn");
		String uType = "ENTERPRISE";
		String status = "y";
		
		
		
	
		
		
		
		Member newMember = new Member();
		newMember.setName(name);
		newMember.setUserId(userId);
		newMember.setUserPwd(userPwd);
		newMember.setPhone(phone);
		newMember.setEmail(email);
		newMember.setAddress(address);
		newMember.setBn(bn);
		newMember.setuType(uType);
		newMember.setStatus(status);
		System.out.println("insert request member : " + newMember);
		
		int result = new MemberService().insertMemberBn(newMember);
		
		String page = "";
		if(result > 0 ) {
			page = "views/member/memberLoginForm.jsp";
			
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("message", "기업 회원가입 실패!!");
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
