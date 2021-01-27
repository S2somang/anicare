package org.anicare.jsp.admin.dog.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static org.anicare.jsp.common.JDBCTemplate.*;

import org.anicare.jsp.admin.dog.model.dao.DogDao;
import org.anicare.jsp.admin.dog.model.vo.Adopt;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.admin.dog.model.vo.Dtitle;
import org.anicare.jsp.admin.dog.model.vo.Infomation;
import org.anicare.jsp.admin.dog.model.vo.Story;
import org.anicare.jsp.support.model.dao.SupportDao;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;









public class DogService {

		
		public ArrayList<Dog> selectList() {

			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Dog> list = new DogDao().selectList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
		}

	

	


		public int insertNewDog(Map<String, Object> infoDog) {
			System.out.println("SERVICE INSERT");
			Connection con = getConnection();
			int result = 0;
			
			result = new DogDao().insertNewDog(con, infoDog);
			
			if (result > 0) {
				commit(con);
			}
			else {
				rollback(con);
			}
			close(con);
			
			return result;
		}






		public ArrayList<Story> StorySelectList() {

			
		
			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Story> list = new DogDao().storySelectList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
		}





		public int insertStory(Map<String, Object> requestData) {

			Connection con = getConnection();
			int result =0;	
			
			DogDao dd = new DogDao();
			Story story = (Story) requestData.get("story");
			Story dcode = (Story) requestData.get("dcode");
			
			System.out.println("service story : " + story);
			
			ArrayList<Dtitle> fileList = (ArrayList<Dtitle>) requestData.get("fileList");
			
			
			int result1 = dd.insertStory(con, story);
			
			
			if(result1 > 0) {
				int stcode = dd.selectCurrval(con); 
				
				System.out.println("stcode : "+stcode);
				
				int result2 = 0;
				for(int i = 0; i<fileList.size(); i++) {
					Dtitle dt = fileList.get(i);
					
					dt.setStcode(stcode);
					result2 += dd.insertDtitle(con,dt);
				}
				
				if(result2 == fileList.size()) {
					result = 1;
					commit(con);
				}else {
					rollback(con);
				}
				
			}else{
				rollback(con);
			}
			
			
			return result;
		}






		public ArrayList<Adopt> selectAdoptList() {
			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Adopt> list = new DogDao().selectAdoptList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
		}






		public ArrayList<Dog> dogList() {
			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Dog> list = new DogDao().dogList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
		}






		public ArrayList<Dog> dogAdoptList() {

			System.out.println("service");
			
			Connection con = getConnection();
			
			ArrayList<Dog> list = new DogDao().dogAdoptList(con);
			
			close(con);
			
			System.out.println("service list :" + list);
			
			return list;
		}






		public int insertAdoptDog(Adopt a) {
			System.out.println("SERVICE INSERT");
			Connection con = getConnection();
			int result = 0;
			
			result = new DogDao().insertAdoptDog(con, a);
			
			if (result > 0) {
				commit(con);
			}
			else {
				rollback(con);
			}
			close(con);
			
			return result;
		}






		public ArrayList<Story> selectOneList() {
			Connection con = getConnection();

			ArrayList<Story> selectList = new DogDao().selectOneList(con);
			System.out.println("service list 리스트잘 나오니.. :" + selectList);

			close(con);

			return selectList;
		}






		public HashMap<String, Object> selecDetailOne(String num) {
			Connection con = getConnection();

			HashMap<String, Object> map = null;

			DogDao dd = new DogDao();

			int result = dd.updateCount(con, num);
			System.out.println("service : " + result);

			if (result > 0) {

				map = dd.selectDtitleOne(con, num);
				
				System.out.println("mpa : " + map);
				
				if (map != null) {
					commit(con);
				} else {
					rollback(con);
				}
			} else {
				rollback(con);
			}

			return map;
		}






		



	

		
	
		}

	
