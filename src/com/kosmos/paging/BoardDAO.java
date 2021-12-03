package com.kosmos.paging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class BoardDAO {

	// 페이지 이동 처리
	private int pageSize = 0;
	private int groupSize = 0;
	private int curPage = 0;
	private int totalCount = 0;
	
	// select list
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList selectList(int pageSize, int curPage) throws Exception{
		System.out.println("BoardDAO selectList() 함수 진입 >>> : ");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		HashMap data = null;
		ArrayList data_list = new ArrayList();
		
		String sqls = null;
		
		StringBuffer sql = new StringBuffer();
			sql.append("\n	SELECT										");
			sql.append("\n			*									");
			sql.append("\n	FROM (										");
			sql.append("\n			SELECT								");
			sql.append("\n					A.MNUM,			-- 글번호		");
			sql.append("\n					A.MTITLE,		-- 제목		");
			sql.append("\n					A.MNAME,		-- 작성자		");
			sql.append("\n					A.MEMAIL,		-- 이메일		");
			sql.append("\n					A.MAREA,		-- 글내용		");
			sql.append("\n					A.MPASS,		-- 비밀번호	");
			sql.append("\n					A.MREF,			-- REF		");
			sql.append("\n					A.MSTEP,		-- STEP		");
			sql.append("\n					A.MDEPTH,		-- DEPTH	");
			sql.append("\n					TO_CHAR(A.MWRITEDAY, 'YYYY-MM-DD') MWRITEDAY,	-- 작성일	");
			sql.append("\n					A.MHITS,		-- 조회수		");
			sql.append("\n					CEIL(ROW_NUMBER() OVER(ORDER BY A.MNUM)/?) PAGENO, ");
			sql.append("\n					COUNT(MNUM) OVER() AS TOTALCOUNT	");
			sql.append("\n			FROM								");
			sql.append("\n					SE_BOARD A					");
			sql.append("\n		)										");
			sql.append("\n	WHERE										");
			sql.append("\n			PAGENO = ?							");
			
			sqls = sql.toString();
		
		try {
			conn = ConnProperty.getConnection();
			pstmt = conn.prepareStatement(sqls);
			
			pstmt.setInt(1, pageSize);
			pstmt.setInt(2, curPage);
			
			rsRs = pstmt.executeQuery();
			
			if (rsRs != null) {
				while(rsRs.next()) {
					data = new HashMap();
					
					data.put("mnum", rsRs.getString("MNUM"));
					data.put("mtitle", rsRs.getString("MTITLE"));
					data.put("mname", rsRs.getString("MNAME"));
					data.put("memail", rsRs.getString("MEMAIL"));
					data.put("marea", rsRs.getString("MAREA"));
					data.put("mpass", rsRs.getString("MPASS"));
					data.put("mref", rsRs.getString("MREF"));
					data.put("mstep", rsRs.getString("MSTEP"));
					data.put("mdepth", rsRs.getString("MDEPTH"));
					data.put("mwriteday", rsRs.getString("MWRITEDAY"));
					data.put("mhits", rsRs.getString("MHITS"));
					data.put("PAGENO", rsRs.getString("PAGENO"));
					data.put("TOTALCOUNT", rsRs.getString("TOTALCOUNT"));
					
					data_list.add(data);
				}
			}
			ConnProperty.conClose(conn, pstmt, rsRs);
		}catch(Exception e) {
			System.out.println("selectList DB 에러 >>> : " + e);
		}finally {
			ConnProperty.conClose(conn, pstmt, rsRs);
		}
		
		System.out.println("BoardDAO selectList() 함수 끝 >>> : ");
		return data_list;
	}
}
