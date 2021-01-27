package org.anicare.jsp.admin.dog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.anicare.jsp.admin.dog.model.service.DogService;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.admin.dog.model.vo.Infomation;
import org.anicare.jsp.member.model.vo.Member;

/**
 * Servlet implementation class InsertNewDog
 */
@WebServlet("/insertNewDog.ma")
public class InsertNewDogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertNewDogServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		System.out.println("START SERVLET INSERT");
		
		String dcode = request.getParameter("dcode");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String breed = request.getParameter("breed");
		int weight = Integer.parseInt(request.getParameter("weight"));
		String fixing = request.getParameter("fixing");
		int age = Integer.parseInt(request.getParameter("age"));
		String potty = request.getParameter("potty");
		String chip = request.getParameter("chip");
		String personality = request.getParameter("personality");

		System.out.println(name);
		System.out.println(gender);
		System.out.println(breed);

		HttpSession session = request.getSession();

		Dog d = new Dog();

		d.setDcode(dcode);
		d.setName(name);
		d.setGender(gender);
		d.setBreed(breed);

		Infomation i = new Infomation();
		i.setWeight(weight);
		i.setFixing(fixing);
		i.setAge(age);
		i.setPotty(potty);
		i.setChip(chip);
		i.setPersonality(personality);

		Map<String, Object> infoDog = new HashMap<>();
		infoDog.put("DOG", d);
		infoDog.put("INFOMATION", i);

		System.out.println("servlet" + name);
		System.out.println("servlet" + weight);
		System.out.println("servlet" + fixing);
		System.out.println("servlet" + age);
		System.out.println("servlet" + potty);
		System.out.println("servlet" + chip);
		System.out.println("servlet" + personality);

		System.out.println("infoDog : " + infoDog);

		int result = new DogService().insertNewDog(infoDog);

		String path = "";
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectNewDog.ma;");
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "게시물 등록 실패");
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

}
