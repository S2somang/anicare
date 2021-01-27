package org.anicare.jsp.admin.dog.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.anicare.jsp.admin.dog.model.vo.Adopt;
import org.anicare.jsp.admin.dog.model.vo.Dog;
import org.anicare.jsp.admin.dog.model.vo.Dtitle;
import org.anicare.jsp.admin.dog.model.vo.Infomation;
import org.anicare.jsp.admin.dog.model.vo.Story;
import org.anicare.jsp.board.model.vo.Board;
import org.anicare.jsp.board.model.vo.Missing;
import org.anicare.jsp.introduction.model.vo.PageInfo;

import static org.anicare.jsp.common.JDBCTemplate.*;

public class DogDao {
	private Properties prop = new Properties();

	public DogDao() {
		String fileName = DogDao.class.getResource("/sql/admin/dog-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Dog> selectList(Connection con) {

		System.out.println("Dao");

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Dog> list = null;

		String query = prop.getProperty("selectList");

		System.out.println("query : " + query);

		try {
			if (con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				System.out.println("nextQuery");

				list = new ArrayList<Dog>();

				while (rset.next()) {
					Dog d = new Dog();
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

	public int insertNewDog(Connection con, Map<String, Object> infoDog) {

		PreparedStatement pstmt = null;
		int check1 = 0, check2 = 0;

		System.out.println("Dao : " + infoDog);

		try {
			if (con != null) {
				String query = prop.getProperty("insertDogBase");
				pstmt = con.prepareStatement(query);

				Dog d = (Dog) infoDog.get("DOG");

				pstmt.setString(1, d.getName());
				pstmt.setString(2, d.getGender());
				pstmt.setString(3, d.getBreed());
				check1 = pstmt.executeUpdate();
				close(pstmt);

				query = prop.getProperty("insertDogInfo");
				pstmt = con.prepareStatement(query);

				Infomation i = (Infomation) infoDog.get("INFOMATION");
				pstmt.setInt(1, i.getWeight());
				pstmt.setString(2, i.getFixing());
				pstmt.setInt(3, i.getAge());
				pstmt.setString(4, i.getPotty());
				pstmt.setString(5, i.getChip());
				pstmt.setString(6, i.getPersonality());
				check2 = pstmt.executeUpdate();

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return (check1 > 0 && check2 > 0) ? 1 : 0;
	}

	public ArrayList<Story> storySelectList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		ArrayList<Story> list = new ArrayList<Story>();
		String query = prop.getProperty("storySelectList");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			Story s = new Story();

			while (rset.next()) {

				// dog
				s.setDcode(rset.getString("DCODE"));
				s.setName(rset.getString("NAME"));

				// info
				s.setAge(rset.getInt("AGE"));
				s.setChip(rset.getString("CHIP"));
				s.setBreed(rset.getString("BREED"));

				// story
				s.setStcode(rset.getInt("STCODE"));
				s.setContent(rset.getString("CONTENT"));
				s.setBcount(rset.getInt("BCOUNT"));
				s.setReply(rset.getInt("REPLY"));
				s.setType(rset.getInt("TYPE"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int insertStory(Connection con, Story story) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertStory");
		System.out.println(query);

		try {
			System.out.println("try");
			pstmt = con.prepareStatement(query);
			System.out.println("story test cont : " + story.getContent());
			System.out.println("story test dcode : " + story.getDcode());

			pstmt.setString(1, story.getContent());
			pstmt.setString(2, story.getDcode());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("story insert " + result);

		return result;
	}

	public int selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		int stcode = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				stcode = rset.getInt("CURRVAL");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return stcode;
	}

	public int insertDtitle(Connection con, Dtitle dt) {
		System.out.println("insertat");
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertDtitle");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, dt.getOriginName());
			pstmt.setString(2, dt.getChangeName());
			pstmt.setString(3, dt.getFilePath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		System.out.println("dao: " + result);

		return result;
	}

	public ArrayList<Adopt> selectAdoptList(Connection con) {

		System.out.println("Dao");

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Adopt> list = null;

		String query = prop.getProperty("selectAdoptList");

		System.out.println("query : " + query);

		try {
			if (con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				System.out.println("nextQuery");

				list = new ArrayList<Adopt>();

				while (rset.next()) {
					Adopt a = new Adopt();
					System.out.println("rset.next");
					a.setDcode(rset.getString("DCODE"));
					a.setuser_id(rset.getString("USER_ID"));
					a.setStatus(rset.getString("STATUS"));
					a.setFin(rset.getString("FIN"));
					a.setPhone(rset.getString("PHONE"));
					// a.setDate(rset.getDate("DATE"));
					list.add(a);

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

	public ArrayList<Dog> dogList(Connection con) {
		System.out.println("Dao");

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Dog> list = null;

		String query = prop.getProperty("dogList");

		System.out.println("query : " + query);

		try {
			if (con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				System.out.println("nextQuery");

				list = new ArrayList<Dog>();

				while (rset.next()) {
					Dog d = new Dog();
					System.out.println("rset.next");
					d.setDcode(rset.getString("DCODE"));
					d.setName(rset.getString("NAME"));
					d.setGender(rset.getString("GENDER"));
					d.setBreed(rset.getString("BREED"));
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

	public ArrayList<Dog> dogAdoptList(Connection con) {
		System.out.println("Dao");

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Dog> list = null;

		String query = prop.getProperty("dogAdoptList");

		System.out.println("query : " + query);

		try {
			if (con != null) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				System.out.println("nextQuery");

				list = new ArrayList<Dog>();

				while (rset.next()) {
					Dog d = new Dog();
					System.out.println("rset.next");
					d.setDcode(rset.getString("DCODE"));
					d.setName(rset.getString("NAME"));
					d.setGender(rset.getString("GENDER"));
					d.setBreed(rset.getString("BREED"));
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

	public int insertAdoptDog(Connection con, Adopt a) {
		PreparedStatement pstmt = null;
		int result = 0;

		Adopt adopt = new Adopt();

		String query = prop.getProperty("insertAdopt");
		System.out.println(query);

		try {
			System.out.println("try");
			pstmt = con.prepareStatement(query);
			System.out.println("story test user : " + adopt.getuser_id());
			System.out.println("story test dcode : " + adopt.getDcode());

			pstmt.setString(1, adopt.getuser_id());
			pstmt.setString(2, adopt.getDcode());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("adopt insert " + result);

		return result;
	}

	public ArrayList<Story> selectOneList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Story> list = null;
		System.out.println("test dao");
		String query = prop.getProperty("oneSelectList");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			list = new ArrayList<Story>();

			while (rset.next()) {

				Story st = new Story();
				st.setStcode(rset.getInt("STCODE"));
				st.setStatus(rset.getString("STATUS"));
				st.setBcount(rset.getInt("BCOUNT"));
				st.setDcode(rset.getString("DCODE"));
				st.setType(rset.getInt("TYPE"));
				st.setName(rset.getString("NAME"));

				list.add(st);
			}
			System.out.println("아이고 dao list " + list);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public int updateCount(Connection con, String num) {
		PreparedStatement pstmt = null;
		int result = 0;

		System.out.println("daod cupp");
		String query = prop.getProperty("checkCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, num);
			pstmt.setString(2, num);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public HashMap<String, Object> selectDtitleOne(Connection con, String num) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;

		System.out.println("dao dititik");

		String query = prop.getProperty("selectOne");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);

			rset = pstmt.executeQuery();

			hmap = new HashMap<String, Object>();

			ArrayList<Dtitle> list = new ArrayList<Dtitle>();
			Story sb = new Story();
			Dog sd = new Dog();
			// board하나에 여러개 조회하려고!

			while (rset.next()) {

				sb.setStcode(rset.getInt("STCODE"));
				sb.setStatus(rset.getString("STATUS"));
				sb.setContent(rset.getString("CONTENT"));
				sb.setBcount(rset.getInt("BCOUNT"));
				sb.setDcode(rset.getString("DCODE"));
				sb.setType(rset.getInt("TYPE"));
				sb.setName(rset.getString("NAME"));

				sd.setDcode(rset.getString("DCODE"));
				sd.setName(rset.getString("NAME"));
				sd.setGender(rset.getString("GENDER"));
				sd.setBreed(rset.getString("BREED"));

				sd.setWeight(rset.getInt("WEIGHT"));
				sd.setFixing(rset.getString("FIXING"));
				sd.setAge(rset.getInt("AGE"));
				sd.setPotty(rset.getString("POTTY"));

				Dtitle sa = new Dtitle();
				sa.setTcode(rset.getInt("tcode"));
				sa.setOriginName(rset.getString("origin_name"));
				sa.setChangeName(rset.getString("change_name"));
				sa.setFilePath(rset.getString("file_path"));

				list.add(sa);
			}

			hmap.put("Story", sb);
			hmap.put("Dog", sd);
			hmap.put("Dtitle", list);
			System.out.println("dao hmap :" + hmap);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return hmap;
	}

}
