package com.kosmos.common;

public abstract class CommonUtils {

	// 게시판
			// 경로확인 잘해야됨
			// C:\00.KOSMO93\30.Web\el_kosmos_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\kosmos\fileupload\board
		public static final String BOARD_IMG_UPLOAD_PATH = "C:\\00.KOSMO93\\30.Web\\el_kosmos_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kosmos\\fileupload\\board";
		//public static final String BOARD_IMG_UPLOAD_PATH = "C:\\00.KOSMO93\\30.Web\\el_kosmos_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kosmos\\fileupload\\board";
		public static final int BOARD_IMG_FILE_SIZE = 2*1024*1024; // 2MB
		public static final String BOARD_EN_CODE = "UTF-8";
		
		// 게시판 목록 페이징
		public static final int BOARD_PAGE_SIZE = 5;
		public static final int BOARD_GROUP_SIZE = 5;
		public static final int BOARD_CUR_PAGE = 1;
		public static final int BOARD_TOTAL_COUNT = 0;
}
