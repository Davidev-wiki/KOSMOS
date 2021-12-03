package com.kosmos.board.vo;

public class KosmosBoardVO {
	
		private String bo_num; //게시글번호
		private String ms_num;	//회원번호
		private String bo_header; // 게시판 말머리
		private String bo_subject;	// 게시판 제목
		private String bo_contents;	// 게시판 내용
		private String bo_pw;	// 게시판 비밀번호
		private String bo_file;	// 게시판 첨부파일
		private String bo_insdate;	// 게시판 등록일
		private String bo_upddate;	// 게시판 수정일
		private String bo_delyn;		// 게시판 삭제여부
	
		// 검색 구분자 및 검색어 
		private String keyfilter;
		private String keyword;
		private String startdate;
		private String enddate;
		
		// 페이징 이동 필드
		private String pageSize;
		private String groupSize;
		private String curPage;
		private String totalCount;
	
	// 생성자 
	public KosmosBoardVO() {
		
	}
	
	public KosmosBoardVO(	String bo_num, String ms_num, String bo_header, 
							String bo_subject, String bo_contents, String bo_pw,
							String bo_file, String bo_insdate, String bo_upddate, String bo_delyn,
							String keyfilter, String keyword, String startdate, 
							String enddate, String pageSize, String groupSize, 
							String curPage, String totalCount) {

	this.bo_num = bo_num;
	this.ms_num = ms_num;
	this.bo_header = bo_header;
	this.bo_subject = bo_subject;
	this.bo_contents = bo_contents;
	this.bo_pw = bo_pw;
	this.bo_file = bo_file;
	this.bo_insdate = bo_insdate;
	this.bo_upddate = bo_upddate;
	this.bo_delyn = bo_delyn;
	this.keyfilter = keyfilter;
	this.keyword = keyword;
	this.startdate = startdate;
	this.enddate = enddate;
	this.pageSize = pageSize;
	this.groupSize = groupSize;
	this.curPage = curPage;
	this.totalCount = totalCount;
	}
	// getter
	public String getBo_num() {
		return bo_num;
	}

	public String getMs_num() {
		return ms_num;
	}

	public String getBo_header() {
		return bo_header;
	}

	public String getBo_subject() {
		return bo_subject;
	}

	public String getBo_contents() {
		return bo_contents;
	}

	public String getBo_pw() {
		return bo_pw;
	}

	public String getBo_file() {
		return bo_file;
	}

	public String getBo_insdate() {
		return bo_insdate;
	}

	public String getBo_upddate() {
		return bo_upddate;
	}

	public String getBo_delyn() {
		return bo_delyn;
	}

	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public String getPageSize() {
		return pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	// setter
	public void setBo_num(String bo_num) {
		this.bo_num = bo_num;
	}

	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}

	public void setBo_header(String bo_header) {
		this.bo_header = bo_header;
	}

	public void setBo_subject(String bo_subject) {
		this.bo_subject = bo_subject;
	}

	public void setBo_contents(String bo_contents) {
		this.bo_contents = bo_contents;
	}

	public void setBo_pw(String bo_pw) {
		this.bo_pw = bo_pw;
	}

	public void setBo_file(String bo_file) {
		this.bo_file = bo_file;
	}

	public void setBo_insdate(String bo_insdate) {
		this.bo_insdate = bo_insdate;
	}

	public void setBo_upddate(String bo_upddate) {
		this.bo_upddate = bo_upddate;
	}

	public void setBo_delyn(String bo_delyn) {
		this.bo_delyn = bo_delyn;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public static void printVO(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		System.out.println("KosmosBoardVO printVO() 함수 진입 >>> : ");
		
		System.out.println("bo_num >>> : " + bvo.getBo_num());
		System.out.println("ms_num >>> : " + bvo.getMs_num());
		System.out.println("bo_header >>> : " + bvo.getBo_header());
		System.out.println("bo_subject >>> : " + bvo.getBo_subject());
		System.out.println("bo_contents >>> : " + bvo.getBo_contents());
		System.out.println("bo_pw >>> : " + bvo.getBo_pw());
		System.out.println("bo_file >>> : " + bvo.getBo_file());
		System.out.println("bo_insdate >>> : " + bvo.getBo_insdate());
		System.out.println("bo_upddate >>> : " + bvo.getBo_upddate());
		System.out.println("bo_delyn >>> : " + bvo.getBo_delyn());
		System.out.println("keyfilter >>> : " + bvo.getKeyfilter());
		System.out.println("keyword >>> : " + bvo.getKeyword());
		System.out.println("startdate >>> : " + bvo.getStartdate());
		System.out.println("enddate >>> : " + bvo.getEnddate());
		System.out.println("pageSize >>> : " + bvo.getPageSize());
		System.out.println("groupSize >>> : " + bvo.getGroupSize());
		System.out.println("curPage >>> : " + bvo.getCurPage());
		System.out.println("totalCount >>> : " + bvo.getTotalCount());
		
		
	}
	
}