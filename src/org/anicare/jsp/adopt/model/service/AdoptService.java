package org.anicare.jsp.adopt.model.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import static org.anicare.jsp.common.JDBCTemplate.*;
import org.anicare.jsp.admin.dog.model.dao.DogDao;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.adopt.model.dao.AdoptDao;
import org.anicare.jsp.adopt.model.vo.AdoptDog;
import org.anicare.jsp.adopt.model.vo.Mix;


public class AdoptService {

	
	public ArrayList<HashMap<String, Object>> selectMainMap() {

		
		System.out.println("service1");
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new AdoptDao().selectMainMap(con);
		
		close(con);
		
		System.out.println("service list : " + list);
	
		return list;

		
		

	}

	public ArrayList<Mix> SelectList() {
	

			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Mix> list = new AdoptDao().selectList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
	}

	public ArrayList<AdoptDog> selectList2() {
		System.out.println("service3");
		
		Connection con = getConnection();
		
		ArrayList<AdoptDog> list2 = new AdoptDao().selectList2(con);
		
		close(con);
		
		System.out.println("service list :" + list2);
		
		return list2;
	}



}
