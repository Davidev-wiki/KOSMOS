package com.kosmos.paging;



	/*
	-- 데이타 1000000 건을 넣기위해 수정
	CREATE TABLE SE_BOARD(
		mnum		NUMBER(8)			NOT NULL,
		mtitle		VARCHAR2(50)		NOT NULL,
		mname		VARCHAR2(20)		NOT NULL,
		memail		VARCHAR2(50)		NOT NULL,
		marea		VARCHAR2(2000)		NOT NULL,
		mpass		VARCHAR2(20)		NOT NULL,
		mref		NUMBER(8)			NULL,
		mstep		NUMBER(8)			NULL,
		mdepth		NUMBER(8)			NULL,
		mwriteday	DATE				DEFAULT SYSDATE,
		mhits		NUMBER(8)			NULL
	);

	CREATE SEQUENCE B_SEQ INCREMENT BY 1 START WITH 1;

	*-----------------------------------------------------------------------
	* descripton
	* mref     :	원본 게시물 번호
	* mstep    :	같은 원본 게시물에 대한 답변글 내에서의 순서 
	* mdepth   :	답변의 단계 (예, 원본=0, 원본의 답변=1, 답변의 답변=2, ...)
	*-----------------------------------------------------------------------
	*
	*/

import java.sql.Connection;
import java.sql.Statement;

public class InsertData {

	public void insertData() throws Exception{
		System.out.println("InsertData insertData() 함수 진입 >>> : ");
		
		Connection conn = ConnProperty.getConnection();
		Statement stmt = conn.createStatement();
		String sqls = null;
		
		// i < 1000000
		for(long i=0; i < 5; i++) {
			sqls = "INSERT INTO KOSMOS_BOARD VALUES ( "
										+ "B_SEQ.NEXTVAL, "
										+ "'" + i + "', "
										+ "'" + i + "', "
										+ "'" + i + "', "
										+ " , "
										+ "'1234', "
										+ " 'Y', SYSDATE, SYSDATE)";
			
			int nCount = stmt.executeUpdate(sqls);
			// if(nCount % 1000 == 0) conn.commit();
			if(nCount % 2 == 0) conn.commit();
		}
		
		conn.commit();
		stmt.close(); stmt = null;
		conn.close(); conn = null;
		
		System.out.println("InsertData insertData() 함수 끝 >>> : ");
	}
	
	public static void main(String args[]) throws Exception {
		System.out.println("InsertData main() 함수 진입 >>> : ");
		
		new InsertData().insertData();
		
		System.out.println("InsertData main() 함수 끝 >>> : ");
	}
}
