package org.anicare.jsp.introduction.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.introduction.model.service.NoticeService;
import org.anicare.jsp.introduction.model.vo.IntroNotice;

/**
 * Servlet implementation class SelectOneIntroductionNotice
 */
@WebServlet("/selectOneNotice.in")
public class SelectOneIntroductionNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneIntroductionNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		IntroNotice notice = new NoticeService().selectOneNoticeByNcode(num);
		
		String page = "";
		if(notice != null) {
			page = "views/introduction/introductionNoticeDetail.jsp";
			request.setAttribute("notice", notice);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("message", "공지사항 상세 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}
