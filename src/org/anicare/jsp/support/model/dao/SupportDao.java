package org.anicare.jsp.support.model.dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.anicare.jsp.support.model.vo.PageInfo;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.anicare.jsp.support.model.vo.SuDog;

public class SupportDao {

	private Properties prop = new Properties();

	public SupportDao() {
		String fileName = SupportDao.class.getResource("/sql/support/support-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<SuDog> selectList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<SuDog> list = null;
		
		String query = prop.getProperty("selectList");
		//String query = "SELECT D.DCODE, D.NAME, D.GENDER, D.BREED, I.HEIGHT, I.WEIGHT, I.FIXING, I.AGE, I.POTTY FROM DOG D JOIN INFOMATION I ON(I.DCODE = D.DCODE) ";
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<SuDog>();
			//System.out.println(rset.next()); --한줄이 씹힘..
			while(rset.next()){
				SuDog sd = new SuDog();
				sd.setDcode(rset.getString("DCODE"));
				sd.setName(rset.getString("NAME"));
				sd.setGender(rset.getString("GENDER"));
				sd.setBreed(rset.getString("BREED"));
//				sd.setDate(rset.getDate("DATE"));
				
				sd.setWeight(rset.getInt("WEIGHT"));
				sd.setFixing(rset.getString("FIXING"));
				sd.setAge(rset.getInt("AGE"));
				sd.setPotty(rset.getString("POTTY"));
//				sd.setPersonality(rset.getString("PERSONALITY"));
				
			//System.out.println(sd);
				list.add(sd);
				
			}
			//System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int insertSupportContent(Connection con, SuBoard sBoard) {

		PreparedStatement pstmt = null;
		int result = 0;


		String query = prop.getProperty("insertSupportOne");

		try {
			pstmt = con.prepareStatement(query);
			// 개이름때문에 select에서 where..개이름이랑 일치하는 dcode..
			
			pstmt.setString(1, sBoard.getContent());
			pstmt.setString(2, sBoard.getDcode());
			
			result = pstmt.executeUpdate();
			
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("board insert "+result);

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
			
			if(rset.next()) {
				stcode = rset.getInt("CURRVAL");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return stcode;
	}

	public int insertAttachment(Connection con, SuAttachment st) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("getOriginName"+st.getOriginName());
		System.out.println("getChangeName"+st.getChangeName());
		System.out.println("getFilePath"+st.getFilePath());
		System.out.println("getFileLevel"+st.getFileLevel());
		System.out.println("getStcode"+st.getStcode());
		System.out.println("getDcode"+st.getDcode()); //진짜 얘문제..웅...얘가...이.망할..
		
		
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, st.getOriginName());
			pstmt.setString(2, st.getChangeName());
			pstmt.setString(3, st.getFilePath());
			pstmt.setInt(4, st.getFileLevel());
//			pstmt.setInt(4, st.getStcode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		System.out.println("dao: " + result);
		
		return result;
	}

	public ArrayList<SuBoard> oneSelectList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SuBoard> list = null;

		String query = prop.getProperty("oneSelectListPaging");

		
		try {
			
			pstmt = con.prepareStatement(query);
			
			int startRow =(pi.getCurrentPage() -1 ) * pi.getLimit() +1;
			int endRow = startRow + pi.getLimit()-1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<SuBoard>();
			
			while(rset.next()) {
				
				SuBoard sb = new SuBoard();
				sb.setStCode(rset.getInt("STCODE"));
				sb.setStatus(rset.getString("STATUS"));
				sb.setContent(rset.getString("CONTENT"));
				sb.setbCount(rset.getInt("BCOUNT"));
				sb.setDcode(rset.getString("DCODE"));
				sb.setType(rset.getInt("TYPE"));
				sb.setName(rset.getString("NAME"));
				
				
				list.add(sb);
			}
			
//			stmt = con.createStatement();
//			
//			rset = stmt.executeQuery(query);
//			
//			list = new ArrayList<SuBoard>();
//			
//			while(rset.next()) {
//				
//				SuBoard sb = new SuBoard();
//				sb.setStCode(rset.getInt("STCODE"));
//				sb.setStatus(rset.getString("STATUS"));
//				sb.setContent(rset.getString("CONTENT"));
//				sb.setbCount(rset.getInt("BCOUNT"));
//				sb.setDcode(rset.getString("DCODE"));
//				sb.setType(rset.getInt("TYPE"));
//				sb.setName(rset.getString("NAME"));
//				
//				
//				list.add(sb);
//			}
//			System.out.println("아이고 dao list " + list);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int updateCount(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}

	public HashMap<String, Object> selectAttachmentOne(Connection con, int num) {
		
		
			PreparedStatement pstmt = null;
			ResultSet rset = null; 
			HashMap<String,Object> hmap = null;
			
			String query = prop.getProperty("selectAttachmentOne");
			//이미지로 어떤걸 보여ㅇ주려하는지
			//수정또는 다운로드할때도 뭐가 필요한지 생각해야함
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				
				rset = pstmt.executeQuery();//조회니까
				
				hmap = new HashMap<String, Object>();
				
				ArrayList<SuAttachment> list = new ArrayList<SuAttachment>();
				SuBoard sb = new SuBoard(); 
				SuDog sd = new SuDog();
				//board하나에 여러개 조회하려고! 
				 
				while(rset.next()) {				
					
					sb.setStCode(rset.getInt("STCODE"));
					sb.setStatus(rset.getString("STATUS"));
					sb.setContent(rset.getString("CONTENT"));
					sb.setbCount(rset.getInt("BCOUNT"));
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
					

					
					SuAttachment  sa = new SuAttachment();
					sa.settCode(rset.getInt("tcode"));
					sa.setOriginName(rset.getString("origin_name"));
					sa.setChangeName(rset.getString("change_name"));
					sa.setFilePath(rset.getString("file_path"));
					
					list.add(sa);
				}
				
				
				hmap.put("SuBoard",sb);
				hmap.put("SuDog", sd);
				hmap.put("SuAttachment", list); 
				System.out.println("dao hmap :" +hmap);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			
			return hmap;
	}

	
//
//	public int updateDtitle(Connection con, int num) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

//	
//	public int updateStory(Connection con, int num, String content) {
//		
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query =prop.getProperty("updateStory");
//		System.out.println("updateStory query 문 : " +query);
//		try {
//			pstmt = con.prepareStatement(query);
//			
//			pstmt.setString(1, content);
//			pstmt.setInt(2, num);
//			
//			result = pstmt.executeUpdate();
//			
//			System.out.println("수정 잘되었는지,,?  (story) " +result);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//			
//		}
//		
//		
//		
//		return 0;
//	}

	public int updateInfo(Connection con, Map<String, Object> updateInfo) {
	
		PreparedStatement pstmt = null;
		int result1 = 0;
		int result2 = 0;
		
		String query1 = prop.getProperty("updateStory");
		System.out.println(query1);
		try {
			pstmt= con.prepareStatement(query1);
			//괄호 미쳤구만~!~
			pstmt.setString(1, ((SuBoard) updateInfo.get("su")).getContent());
			pstmt.setInt(2, ((SuBoard) updateInfo.get("su")).getStCode());
			
			result1 = pstmt.executeUpdate();
			
			close(pstmt);
			
			
//			ArrayList<SuAttachment> fileList = (ArrayList<SuAttachment>) updateInfo.get("fileList");
//			System.out.println("update dao 의 fileList "  + fileList);
//				
//				System.out.println("fileList.Size() : "+ fileList.size());
//				for(int i = 0; i<fileList.size(); i++) {
//					//그러면 이거는 쿼리 실행 결과를 누적한다음에
//					//리스트 사이즈랑 비교해야대 전부 다 삽입됐는지 확인하려면
//				
//					String query2  = prop.getProperty("updateAttachment");
//					System.out.println(query2);
//					pstmt = con.prepareStatement(query2);
//					
//					
//						pstmt.setString(1, fileList.get(i).getOriginName());
//						pstmt.setString(2, fileList.get(i).getChangeName());
//						pstmt.setInt(3, ((SuBoard) updateInfo.get("su")).getStCode());
//						pstmt.setInt(4, fileList.get(i).gettCode());
//						result2 += pstmt.executeUpdate();
//						System.out.println("null이 아닌" + fileList);
//					
//					
//				}
			
			System.out.println(result1 +" , " +result2 );
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	
		
		
		return ( result1 >0 || result2>0 ) ? 1:0 ;	
		
	}

	public int updateFile(Connection con, SuAttachment suAttachment) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		System.out.println("dao :  "+suAttachment.getChangeName());
		System.out.println("dao :  "+suAttachment.getOriginName());
		System.out.println("dao :  "+suAttachment.gettCode());
		
		try {
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, suAttachment.getOriginName());
			pstmt.setString(2, suAttachment.getChangeName());
			pstmt.setInt(3, suAttachment.gettCode());
			
			result= pstmt.executeUpdate();
					
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
	
		
		return result;
	}

	
	
	public ArrayList<SuAttachment> deleteFiles(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<SuAttachment> list = null;
		
		String query = prop.getProperty("deleteFiles");
	
		System.out.println("deleteFiles : " + query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<SuAttachment>();
			
			while(rset.next()) {
				SuAttachment su = new SuAttachment();
				su.setFilePath(rset.getString("FILE_PATH"));
				su.setOriginName(rset.getString("CHANGE_NAME"));
				
				list.add(su);			
			}
			System.out.println("delete file에서 사진list 조회 : "+ list);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;

	}	
	
	
	public int SupportDelete(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		int result1 = 0; int result2= 0;
		
		String query1 = prop.getProperty("deleteDtitle"); 
		String query2 = prop.getProperty("deleteStory");
		
		try {
			pstmt = con.prepareStatement(query1);
			
			pstmt.setInt(1, num);
			
			result1 = pstmt.executeUpdate();
			
			
			pstmt= con.prepareStatement(query2);
			
			pstmt.setInt(1, num);
			
			result2 = pstmt.executeUpdate();
			
			
			
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return (result1 >0 && result2>0) ? 1: 0;
		
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount =0;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		
		return listCount;
	}

	public ArrayList<SuBoard> searchName(Connection con, String name) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SuBoard> list = null;
		String query = prop.getProperty("searchName");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,"%"+name+"%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				SuBoard sb = new SuBoard();
				sb.setStCode(rset.getInt("STCODE"));
				sb.setStatus(rset.getString("STATUS"));
				sb.setContent(rset.getString("CONTENT"));
				sb.setbCount(rset.getInt("BCOUNT"));
				sb.setDcode(rset.getString("DCODE"));
				sb.setType(rset.getInt("TYPE"));
				sb.setName(rset.getString("NAME"));
				
				
				list.add(sb);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	
	

	public ArrayList<SuBoard> ViewsOneSelectList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SuBoard> list = null;
		
		String query = prop.getProperty("oneSelectListPaging2");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			int startRow =(pi.getCurrentPage() -1 ) * pi.getLimit() +1;
			int endRow = startRow + pi.getLimit()-1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<SuBoard>();
			
			while(rset.next()) {
				
				SuBoard sb = new SuBoard();
				sb.setStCode(rset.getInt("STCODE"));
				sb.setStatus(rset.getString("STATUS"));
				sb.setContent(rset.getString("CONTENT"));
				sb.setbCount(rset.getInt("BCOUNT"));
				sb.setDcode(rset.getString("DCODE"));
				sb.setType(rset.getInt("TYPE"));
				sb.setName(rset.getString("NAME"));
				
				
				list.add(sb);
			}
			//여기까지는 13개 잘나옴 
			System.out.println("dao list : " + list); 

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	
	public HashMap<String, Object> viewsSelectAttachmentOne(Connection con, PageInfo pi) {
		
		Statement stmt = null;
		ResultSet rset = null; 
		HashMap<String,Object> hmap = null;
		ArrayList<SuDog> sdList = null;
		String query = prop.getProperty("ViewsSelectAttachmentOne");
		//이미지로 어떤걸 보여ㅇ주려하는지
		//수정또는 다운로드할때도 뭐가 필요한지 생각해야함
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			hmap = new HashMap<String, Object>();
			
			ArrayList<SuAttachment> list = new ArrayList<SuAttachment>();
			SuBoard sb = new SuBoard(); 
			sdList = new ArrayList<SuDog>();
			//board하나에 여러개 조회하려고! 
			 
			while(rset.next()) {				
				
				sb.setStCode(rset.getInt("STCODE"));
				sb.setStatus(rset.getString("STATUS"));
				sb.setContent(rset.getString("CONTENT"));
				sb.setbCount(rset.getInt("BCOUNT"));
				sb.setDcode(rset.getString("DCODE"));
				sb.setType(rset.getInt("TYPE"));
				sb.setName(rset.getString("NAME"));

				SuDog sd = new SuDog();
				sd.setDcode(rset.getString("DCODE"));
				sd.setName(rset.getString("NAME"));
				sd.setGender(rset.getString("GENDER"));
				sd.setBreed(rset.getString("BREED"));
				
				sd.setWeight(rset.getInt("WEIGHT"));
				sd.setFixing(rset.getString("FIXING"));
				sd.setAge(rset.getInt("AGE"));
				sd.setPotty(rset.getString("POTTY"));
				

				
				SuAttachment  sa = new SuAttachment();
				sa.settCode(rset.getInt("tcode"));
				sa.setOriginName(rset.getString("origin_name"));
				sa.setChangeName(rset.getString("change_name"));
				sa.setFilePath(rset.getString("file_path"));
				
				list.add(sa);
				
				sdList.add(sd);
				
			}
			
			
			hmap.put("SuBoard",sb);
			hmap.put("SuDog", sdList);
			hmap.put("SuAttachment", list); 
			System.out.println("hmap dog" + sdList);
			System.out.println("dao hmap :" +hmap); //순서 이상하지만...일단..
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return hmap;
		
	}

	public ArrayList<SuDog> selectDog(Connection con) {
		
		Statement stmt =null;
		ResultSet rset = null;
		
		String query=prop.getProperty("selectDog");
		ArrayList<SuDog> dogList = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			dogList = new ArrayList<SuDog>();
			while(rset.next()) {
				
				SuDog sd = new SuDog();
				sd.setDcode(rset.getString("DCODE"));
				sd.setName(rset.getString("NAME"));
				sd.setGender(rset.getString("GENDER"));
				sd.setBreed(rset.getString("BREED"));
				
				sd.setWeight(rset.getInt("WEIGHT"));
				sd.setFixing(rset.getString("FIXING"));
				sd.setAge(rset.getInt("AGE"));
				sd.setPotty(rset.getString("POTTY"));
				
				dogList.add(sd);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return dogList;

	}
	

}
