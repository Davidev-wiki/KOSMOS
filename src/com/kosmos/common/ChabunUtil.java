package com.kosmos.common;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_B 	= "B"; // 
	public static final String BIZ_GUBUN_RB = "RB"; // 
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N : 
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}

	// 게시판 댓글 글 번호
	public static String getRboardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_RB.concat(ChabunUtil.numPad(type, memNum));
	}
	
	// 게시판 글 번호
	public static String getBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_B.concat(ChabunUtil.numPad(type, memNum));
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("ChabunUtil main() 함수 진입 >>> : ");
		
		String c = "1";
		System.out.println(">>> : " + ChabunUtil.getBoardChabun("N", c));
		System.out.println(">>> : " + ChabunUtil.getRboardChabun("N", c));
		
	}
}

