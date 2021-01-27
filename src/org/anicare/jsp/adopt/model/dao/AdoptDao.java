package org.anicare.jsp.adopt.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.anicare.jsp.adopt.model.vo.AdoptDog;
import org.anicare.jsp.adopt.model.vo.Mix;
import static org.anicare.jsp.common.JDBCTemplate.*;
public class AdoptDao {

private Properties prop = new Properties();
	


	public AdoptDao() {
		String fileName = AdoptDao.class.getResource("/sql/adopt/adopt-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	

	public ArrayList<HashMap<String, Object>> selectMainMap(Connection con) {

		System.out.println("dao");
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;

		String query = prop.getProperty("selectMainMap");

		System.out.println("query : " + query);
		
		try {
			
			System.out.println("start stmt~");
			
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();
			
			

			while (rset.next()) {
				HashMap<String, Object> dmap = new HashMap<String, Object>();
				
				System.out.println("dmap" + dmap);
				
				//dogVo
				//dog table
				dmap.put("dcode", rset.getString("DCODE"));
				dmap.put("name", rset.getString("NAME"));
				dmap.put("gender", rset.getString("GENDER"));
				dmap.put("breed", rset.getString("BREED"));
				
				//info table
				dmap.put("weight", rset.getInt("WEIGHT"));
				dmap.put("fixing", rset.getString("FIXING"));
				dmap.put("age", rset.getInt("AGE"));
				dmap.put("potty", rset.getString("POTTY"));
				dmap.put("chip", rset.getString("CHIP"));
				dmap.put("personality", rset.getString("PERSONALITY"));
				
				
				//dogStroyVo
				//story table
				dmap.put("stcode", rset.getInt("STCODE"));
				dmap.put("status", rset.getString("STATUS"));
				dmap.put("content", rset.getString("CONTENT"));
				dmap.put("bcount", rset.getInt("BCOUNT"));
				dmap.put("reply", rset.getInt("REPLY"));
				dmap.put("type", rset.getInt("TYPE"));
				
				//dtitle table
				dmap.put("tcode", rset.getInt("TCODE"));
				dmap.put("originName", rset.getString("ORIGIN_NAME"));
				dmap.put("changeName", rset.getString("CHANGE_NAME"));
				dmap.put("filePath", rset.getString("FILE_PATH"));
				dmap.put("fileLevel", rset.getInt("FILE_LEVEL"));
				
				list.add(dmap);

				System.out.println("test " + dmap);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		System.out.println("list : " + list);
		return list;
	}



	public ArrayList<Mix> selectList(Connection con) {
	System.out.println("Dao");
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Mix> list = null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println("query : " + query);
		
			try {
				if(con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				System.out.println("nextQuery");
				
				list = new ArrayList<Mix>();
			
				
				while (rset.next()) {
					Mix d = new Mix();
					System.out.println("rset.next");
					//dog
					d.setDcode(rset.getString("DCODE"));
					d.setName(rset.getString("NAME"));
					d.setGender(rset.getString("GENDER"));
					d.setBreed(rset.getString("BREED"));
					d.setDate(rset.getDate("DATE"));
					d.setWeight(rset.getInt("WEIGHT"));
					d.setFixing(rset.getString("FIXING"));
					d.setAge(rset.getInt("AGE"));
					d.setPotty(rset.getString("POTTY"));
					d.setChip(rset.getString("CHIP"));
					d.setPersonality(rset.getString("PERSONALITY"));
					
					
					//story
					d.setStcode(rset.getInt("STCODE"));
					d.setStatus(rset.getString("STATUS"));
					d.setContent(rset.getString("CONTENT"));
					d.setType(rset.getInt("TYPE"));
					d.setTcode(rset.getInt("TCODE"));
					d.setOriginName(rset.getString("ORIGIN_NAME"));
					d.setChangeName(rset.getString("CHANGE_NAME"));
					d.setFilePath(rset.getString("FILE_PATH"));
					d.setFileLevel(rset.getInt("FILE_LEVEL"));
					
					list.add(d);
					
					
				}
					}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
		
			System.out.println("dao list : " + list);
		
		return list;
	}



	public ArrayList<AdoptDog> selectList2(Connection con) {
		System.out.println("select2 Dao");
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AdoptDog> list = null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println("query : " + query);
		
			try {
				if(con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				System.out.println("nextQuery");
				
				list = new ArrayList<AdoptDog>();
			
				
				while (rset.next()) {
					AdoptDog d = new AdoptDog();
					System.out.println("rset.next");
					d.setDcode(rset.getString("DCODE"));
					d.setName(rset.getString("NAME"));
					d.setGender(rset.getString("GENDER"));
					d.setBreed(rset.getString("BREED"));
					d.setDate(rset.getDate("DATE"));
					d.setWeight(rset.getInt("WEIGHT"));
					d.setFixing(rset.getString("FIXING"));
					d.setAge(rset.getInt("AGE"));
					d.setPotty(rset.getString("POTTY"));
					d.setChip(rset.getString("CHIP"));
					d.setPersonality(rset.getString("PERSONALITY"));
					list.add(d);
					
					
				}
					}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
		
			System.out.println("dao list : " + list);
		
		return list;
	}


}
