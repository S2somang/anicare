package org.anicare.jsp.support.model.service;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.anicare.jsp.support.model.dao.SupportDao;
import org.anicare.jsp.support.model.vo.PageInfo;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.anicare.jsp.support.model.vo.SuDog;

public class SupportService {

	// 개 정보조회
	public ArrayList<SuDog> selectList() {

		Connection con = getConnection();

		ArrayList<SuDog> list = new SupportDao().selectList(con);

		System.out.println("ㅅㅂ스 " + list);

		close(con);

		return list;
	}

	// 파일 삽입
	public int insertSupport(Map<String, Object> requestData) {

		Connection con = getConnection();
		int result = 0;

		SupportDao sd = new SupportDao();
		SuBoard sBoard = (SuBoard) requestData.get("suBoard");

		ArrayList<SuAttachment> fileList = (ArrayList<SuAttachment>) requestData.get("fileList");

		int result1 = sd.insertSupportContent(con, sBoard);
		System.out.println("잘실행되는즤..");

		if (result1 > 0) {
			int stcode = sd.selectCurrval(con);

			System.out.println("stcode : " + stcode);

			int result2 = 0;
			for (int i = 0; i < fileList.size(); i++) {
				SuAttachment st = fileList.get(i);

				st.setStcode(stcode);
				System.out.println("st st s t :" + st);
				result2 += sd.insertAttachment(con, st);
			}
			System.out.println("reuslt2  " + result2);
			System.out.println("fileList :" + fileList.size());

			if (result2 == fileList.size()) {
				result = 1;
				System.out.println("ㅅ정상적으로 됨..일단..");
				commit(con);
			} else {
				System.out.println("롤백..롤백..");
				rollback(con);
			}

		} else {
			System.out.println("롤백 롤백 ");
			rollback(con);
		}

		return result;
	}

	public ArrayList<SuBoard> oneSelectList(PageInfo pi) {

		Connection con = getConnection();

		ArrayList<SuBoard> selectList = new SupportDao().oneSelectList(con,pi);
		System.out.println("service list 리스트잘 나오니.. :" + selectList);

		close(con);

		return selectList;
	}

	public HashMap<String, Object> selectAttachmentOne(int num) {

		Connection con = getConnection();

		HashMap<String, Object> hmap = null;

		SupportDao sd = new SupportDao();

		int result = sd.updateCount(con, num);

		if (result > 0) {

			hmap = sd.selectAttachmentOne(con, num);
			if (hmap != null) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		return hmap;
	}

	//
	// public int updateStory(Map<String, Object> updateInfo) {
	//
	// Connection con = getConnection();
	//
	// SupportDao sd = new SupportDao();
	// //수정되면 행의갯수 반환
	// int result = sd.updateCount(con,updateInfo);
	//
	// if(result > 0 ) {
	// int story = new SupportDao().updateStory(con,updateInfo);
	// commit(con);
	// }else {
	// rollback(con);
	// }
	//
	// return result;
	// }
	//
	//
	//
	//
	// public int updateDtitle(int num) {
	//
	// Connection con = getConnection();
	//
	// int result = new SupportDao().updateDtitle(con, num);
	//
	//
	//
	// close(con);
	//
	// return result;
	// }

	public int updateInfo(Map<String, Object> updateInfo) {

		int result5 = 0;
		Connection con = getConnection();

		int result = new SupportDao().updateInfo(con, updateInfo);
		System.out.println("서비스 result  update  : " + result);
		ArrayList<SuAttachment> fileList = (ArrayList<SuAttachment>) updateInfo.get("fileList");

		int result2 = 0;
		int result3 = 0; // elseㅁ들어올떄마자 체크

		if (result > 0) {

			for (int i = 0; i < fileList.size(); i++) {
				if (fileList.get(i).getOriginName() == null) {
					System.out.println("null 몇개");
				} else {
					result3 += 1;
					result2 += new SupportDao().updateFile(con, fileList.get(i));
				}

			}
			System.out.println("result2 : " + result2);
			System.out.println("result3 : " + result3);

			if (result2 == result3) {
				commit(con);
				result5 = 1;
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		return result5;
	}

	public int supportDelete(int num) {

		Connection con = getConnection();
		int result = 0;
		ArrayList<SuAttachment> sa = new SupportDao().deleteFiles(con, num);
		System.out.println("파일 삭제의 attach" + sa);
		if (sa != null) {
			// 위에 조회된 파일이 있다면? -> 지움, 없으면 지우지마..?? 없어도 지워야지...
			result = new SupportDao().SupportDelete(con, num);

			if (result > 0) {
				System.out.println("테이블 둘다 삭제 ");

				 System.out.println("파일 지우기전 " + sa.size());
				
				 for(int i= 0; i<sa.size(); i++) {
					 File deleteFile = new File(sa.get(i).getFilePath() + sa.get(i).getOriginName());
					 System.out.println("deleteFile");
					 deleteFile.delete();
				 }
				 System.out.println("파일 지워졋니? " + sa.size());

				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	
	
	public int getListcount() {
		
		Connection con = getConnection();
		
		int listCount = new SupportDao().getListCount(con);
			
		
		close(con);
		
		return listCount;
	}

	public ArrayList<SuBoard> searchName(String name) {
		
		
		Connection con = getConnection();
			
		
		ArrayList<SuBoard> list = new SupportDao().searchName(con, name);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> viewsOneSelectList(PageInfo pi) {
		
		Connection con = getConnection();


		HashMap<String, Object> hmap = null;

		ArrayList<SuBoard> selectList = new SupportDao().ViewsOneSelectList(con,pi);
		System.out.println("service list 리스트잘 나오니.. :" + selectList); //13개잘나옴 
//		ArrayList<SuDog> selectDog = new SupportDao().selectDog(con);
//		System.out.println("dogList : " +selectDog );
		
		if(selectList != null ) {
			SupportDao sd = new SupportDao();
			
				
				hmap = sd.viewsSelectAttachmentOne(con,pi);
				if (hmap != null) {
					hmap.put("board", selectList);
					//hmap.put("dog", selectDog);
					commit(con);
				} else {
					rollback(con);
				}
		} else {
			rollback(con);
		}
		System.out.println("서비스의 hmap : " + hmap);

		return hmap;
	}

}