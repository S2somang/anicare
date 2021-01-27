package org.anicare.jsp.support.controller;

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

import org.anicare.jsp.common.MyFileRenamePolicy;
import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SupportInsertOneServlet
 */
@WebServlet("/insertOne.sp")
public class SupportInsertOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportInsertOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 이미지랑 내용작성한거 db에 추가하고
		//2. 다시 조회
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 30;  
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);///Users/baegayeong/git/team2-semi-project/web/
			
			// 폴더위치 여부 팀원에게 공개 필요
			String filePath = root + "resources/uploadFiles/supportOneUploadFiles/"; 
			
			
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
			ArrayList<String> saveFiles = new ArrayList<>();
			
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			
			while(files.hasMoreElements()) {
				
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				
				originFiles.add(multiRequest.getOriginalFileName(name));
			
			}
			System.out.println("savefile name : " + saveFiles);
			System.out.println("originfile name : " + originFiles);
			
			
			String con1 = multiRequest.getParameter("meet");
			String con2 = multiRequest.getParameter("friend");
			String con3 = multiRequest.getParameter("support");
			String con4 = multiRequest.getParameter("sad");
			String dcode = multiRequest.getParameter("dcode");
			
			System.out.println(con1 + con2 +con3 +con4); //내가쓴거 확인
			
			String content = con1+"-$"+con2+"-$"+con3+"-$"+con4;
			
			System.out.println("dcode : " +dcode);
			
			//String writer = "admin";
			
			SuBoard sb = new SuBoard();
			
//			sb.setCon1(con1);
//			sb.setCon1(con2);
//			sb.setCon1(con3);
//			sb.setCon1(con4);
			sb.setContent(content);
			sb.setDcode(dcode);
			
			
			
			ArrayList<SuAttachment> fileList = new ArrayList<>();
			
			for(int i = originFiles.size() -1; i>=0; i--) {
				SuAttachment sa = new SuAttachment();
				sa.setFilePath(filePath);
				
				sa.setOriginName(originFiles.get(i));
				sa.setChangeName(saveFiles.get(i));
				sa.setDcode(dcode);
				
				if(i == originFiles.size() -1 ) {
					sa.setFileLevel(0);
				}else {
					sa.setFileLevel(1);
				}
				
				fileList.add(sa);
				
			}
			
			Map<String, Object> requestData = new HashMap<String, Object>();
			
			requestData.put("suBoard" , sb);
			requestData.put("fileList", fileList);
			
			int result = new SupportService().insertSupport(requestData);
			
			System.out.println("result 확인 :" + result);
			
			String path ="";
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/oneSelectList.sp");
			}else {
				for(int i =0; i<saveFiles.size(); i++) {
					File faildFile = new File(filePath + saveFiles.get(i));
					
					faildFile.delete();
				}
				path ="views/common/errorPage.jsp";
				request.setAttribute("message", "사진 게시판 등록 실패");
				request.getRequestDispatcher(path).forward(request, response);
			}
			
			
			
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
