package org.anicare.jsp.admin.dog.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.anicare.jsp.admin.dog.model.service.DogService;
import org.anicare.jsp.admin.dog.model.vo.Dtitle;
import org.anicare.jsp.admin.dog.model.vo.Story;
import org.anicare.jsp.common.MyFileRenamePolicy;
import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertDogStoryServlet
 */
@WebServlet("/insertStory.ma")
public class InsertDogStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertDogStoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("insert Stroy Servlet");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 30;

			String root = request.getSession().getServletContext().getRealPath("/");

			System.out.println(root);

			String filePath = root + "resources/uploadFiles/Dog/";

			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			ArrayList<String> saveFiles = new ArrayList<>();

			ArrayList<String> originFiles = new ArrayList<>();

			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {

				String file = files.nextElement();

				saveFiles.add(multiRequest.getFilesystemName(file));

				originFiles.add(multiRequest.getOriginalFileName(file));

			}

			System.out.println("savefile name : " + saveFiles);
			System.out.println("originfile name : " + originFiles);

			String con1 = multiRequest.getParameter("meet"); 
			String con2 = multiRequest.getParameter("friend");
			String con3 = multiRequest.getParameter("support");
			String con4 = multiRequest.getParameter("sad");
			String dcode = multiRequest.getParameter("dcode");

			System.out.println(con1 + "," + con2 + "," + con3 + "," + con4);

			String content = con1 + "-$" + con2 + "-$" + con3 + "-$" + con4;

			System.out.println("Dcode: " + dcode);
			System.out.println("content : " + content);
			
			Story st = new Story();

			st.setContent(content);
			st.setDcode(dcode);
			
			System.out.println("story : " + st);
			ArrayList<Dtitle> fileList = new ArrayList<>();

			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Dtitle dt = new Dtitle();
				dt.setFilePath(filePath);

				dt.setOriginName(originFiles.get(i));
				dt.setChangeName(saveFiles.get(i));
				dt.setDcode(dcode);

				if (i == originFiles.size() - 1) {
					dt.setFileLevel(0);
				} else {
					dt.setFileLevel(1);
				}

				fileList.add(dt);

			}

			Map<String, Object> requestData = new HashMap<String, Object>();

			requestData.put("story", st);
			requestData.put("dcode", st);
			requestData.put("fileList", fileList);
			System.out.println("check : " + st);
			
			System.out.println("map : " + requestData);

			int result = new DogService().insertStory(requestData);

			System.out.println("result 확인 :" + result);

			
			
			String path = "";
			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectStroy.ma");
			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File faildFile = new File(filePath + saveFiles.get(i));

					faildFile.delete();
				}
				path = "views/common/errorPage.jsp";
				request.setAttribute("message", "게시판 등록 실패");
				request.getRequestDispatcher(path).forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
