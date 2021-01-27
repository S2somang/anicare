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
 * Servlet implementation class SelectOneForUpdateIntroductionNoticeAdminServlet
 */
@WebServlet("/selectOneForUpdateNoticeAdmin.in")
public class SelectOneForUpdateIntroductionNoticeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneForUpdateIntroductionNoticeAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		IntroNotice notice = new NoticeService().selectOneNoticeByNcode(num);
		
		String path = "";
		if(notice != null) {
			path = "views/admin/introduction/adminUpdateNotice.jsp";
			request.setAttribute("notice", notice);
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "공지수정용 상세보기 실패");
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
