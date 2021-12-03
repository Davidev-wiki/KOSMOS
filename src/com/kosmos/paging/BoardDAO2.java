package com.kosmos.paging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO2 {

	// 페이지 이동 처리
	private int pageSize = 0;
	private int groupSize = 0;
	private int curPage = 0;
	private int totalCount = 0;
	
	// select list
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList selectList(BoardVO bvo) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList data_list = null;
		
		String sqls = null;
		
		StringBuffer sql = new StringBuffer();
			sql.append("\n	SELECT										");
			sql.append("\n		*										");
			sql.append("\n	FROM (										");
			sql.append("\n		SELECT									");
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
			sql.append("\n					CEIL(ROW_NUMBER() OVER(ORDER BY A.MNUM)/?) PAGESIZE, ");
			sql.append("\n					COUNT(MNUM) OVER() AS TOTALCOUNT	");
			sql.append("\n			FROM								");
			sql.append("\n					SE_BOARD A					");
			sql.append("\n		)										");
			sql.append("\n	WHERE										");
			sql.append("\n			PAGESIZE = ?						");
			
			sqls = sql.toString();
			
		try {
			conn = ConnProperty.getConnection();
			pstmt = conn.prepareStatement(sqls);
			
			// pstmt.setInt(1, pageSize);
			// pstmt.setInt(2, curPage);
			pstmt.setInt(1, Integer.parseInt(bvo.getPageSize()));
			pstmt.setInt(2, Integer.parseInt(bvo.getCurPage()));
			System.out.println("sqls >>> : \n" + sqls);
			
			rsRs = pstmt.executeQuery();
			
			if(rsRs != null) {
				data_list = new ArrayList();
				
				while(rsRs.next()) {
					BoardVO _bvo = new BoardVO();
					
					_bvo.setMnum(rsRs.getString("MNUM"));
					_bvo.setMtitle(rsRs.getString("MTITLE"));
					_bvo.setMname(rsRs.getString("MNAME"));
					_bvo.setMemail(rsRs.getString("MEMAIL"));
					_bvo.setMarea(rsRs.getString("MAREA"));
					_bvo.setMpass(rsRs.getString("MPASS"));
					_bvo.setMref(rsRs.getString("MREF"));
					_bvo.setMstep(rsRs.getString("MSTEP"));
					_bvo.setMdepth(rsRs.getString("MDEPTH"));
					_bvo.setMwriteday(rsRs.getString("MWRITEDAY"));
					_bvo.setMhits(rsRs.getString("MHITS"));
					_bvo.setPageSize(rsRs.getString("PAGESIZE"));
					_bvo.setTotalCount(rsRs.getString("TOTALCOUNT"));
					//data.put("PAGENO", rsRs.getString("PAGENO"));
					//data.put("TOTALCOUNT", rsRs.getString("TOTALCOUNT"));
					
					data_list.add(_bvo);
				}
			}
			ConnProperty.conClose(conn, pstmt, rsRs);
		}catch(Exception e) {
			System.out.println("selectList DB 연결 문제 >>> : " + e.getMessage());
		}finally {
			ConnProperty.conClose(conn, pstmt, rsRs);
		}

		return data_list;
	}
}