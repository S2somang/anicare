package org.anicare.jsp.myPage.model.dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import org.anicare.jsp.member.model.vo.Member;
import org.anicare.jsp.myPage.model.vo.Info;
import org.anicare.jsp.myPage.model.vo.MyPage;

public class MyPageDao {
	private Properties prop = new Properties();
	
	public MyPageDao() { 
		
		String path = MyPageDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public MyPage getMySupportInfo(Connection con, Member loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyPage mp = null;
		int[] check = new int[4];
		int pCount = 0;
		int pMoney = 0;
		int tMoney = 0;
		Date date = null;
		try {
			String query = prop.getProperty("getMyPagePcount");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserId());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				check[0] = 1;
				pCount = rset.getInt(1);
			}
			close(rset);
			close(pstmt);
			
			query = prop.getProperty("getMyPagePmoney");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserId());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				check[1] = 1;
				pMoney = rset.getInt(1);
			}
			close(rset);
			close(pstmt);
			
			query = prop.getProperty("getMyPageFDate");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserId());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				check[2] = 1;
				date = rset.getDate(1);
			}
			close(rset);
			close(pstmt);
			
			query = prop.getProperty("getMyPageTMoney");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserId());
			rset = pstmt.executeQuery();
			if  (rset.next()) {
				check[3] = 1;
				tMoney = rset.getInt(1);
			}
			
			if (check[0] > 0 && check[1] > 0 && check[2] > 0 && check[3] >0 ) {
				mp = new MyPage();
				mp.setpCount(pCount);
				mp.setpMoney(pMoney);
				mp.setDate(date);
				mp.settMoney(tMoney);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}

		
		return mp;
	}

	public Member updateMyInfo(Connection con, Member Loginuser, String requestId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("updateUserInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Loginuser.getPhone());
			pstmt.setString(2, Loginuser.getEmail());
			pstmt.setString(3, Loginuser.getAddress());
			pstmt.setString(4, requestId);
			rset =pstmt.executeQuery();
			close(rset);
			close(pstmt);
			
			query = prop.getProperty("updateSession");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestId);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
			
				
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setName(rset.getString("NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setuType(rset.getString("UTYPE"));
				loginUser.setSsn(rset.getString("SSN"));
				loginUser.setBn(rset.getString("BN"));
				loginUser.setStatus(rset.getString("STATUS"));
				
				
				
			}
			System.out.println("loginUSer : "+ loginUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}

	public ArrayList<Info> history(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Info> list = null;
		
		String query = prop.getProperty("info");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Info>();
			
			while(rset.next()) {
				Info n = new Info();
				n.setsDate(rset.getString("S_DATE"));
				n.setSt(rset.getString("st"));
				n.setMoney(rset.getString("MONEY"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
