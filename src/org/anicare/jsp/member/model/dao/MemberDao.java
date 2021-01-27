package org.anicare.jsp.member.model.dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.anicare.jsp.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
	String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

	 try {
		prop.load(new FileReader(fileName));
	
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}   
	}
	public Member loginCheck(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query =prop.getProperty("loginSelect");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getUserId());
			pstmt.setString(2, requestMember.getUserPwd());
			
			rset =pstmt.executeQuery();
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
			System.out.println("loginUser : " + loginUser);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}

		return loginUser;
	}
	public int selectMemberCountby(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectMemberCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}
	public int selectMemberCount(Connection con, String pwd) {
			PreparedStatement pstmt = null;
			ResultSet rset =null;
			int result = 0;
			String query =prop.getProperty("chpwd");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, pwd);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					result = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			
			
		return result;
	}
	
	
	public int insertMember(Connection con, Member newMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newMember.getUserId());
			pstmt.setString(2, newMember.getName());
			pstmt.setString(3, newMember.getPhone());
			pstmt.setString(4, newMember.getEmail());
			pstmt.setString(5, newMember.getAddress());
			pstmt.setString(6, newMember.getUserPwd());
			pstmt.setString(7, newMember.getuType());
			pstmt.setString(8, newMember.getSsn());
			pstmt.setString(9, newMember.getBn());
			pstmt.setString(10, newMember.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		return result;
	}
	public int insertMemberBn(Connection con, Member newMember) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("insertMemberBn");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newMember.getUserId());
			pstmt.setString(2, newMember.getName());
			pstmt.setString(3, newMember.getPhone());
			pstmt.setString(4, newMember.getEmail());
			pstmt.setString(5, newMember.getAddress());
			pstmt.setString(6, newMember.getUserPwd());
			pstmt.setString(7, newMember.getuType());
			pstmt.setString(8, newMember.getSsn());
			pstmt.setString(9, newMember.getBn());
			pstmt.setString(10, newMember.getStatus());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		close(pstmt);	
		}
	
		return result;
	}

}
