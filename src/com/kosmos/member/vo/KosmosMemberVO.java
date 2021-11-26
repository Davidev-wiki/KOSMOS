package com.kosmos.member.vo;

import org.apache.log4j.Logger;

public class KosmosMemberVO {
private static Logger logger = Logger.getLogger(KosmosMemberVO.class);
	
	private String me_num; //회원번호
	private String me_id; //아이디(이메일)
	private String me_name; //이름
	private String me_gen; //성별
	private String me_birth; // 생년월일
	private String me_pw; // 비밀번호
	private String me_cp; // 핸드폰번호
	private String me_zipcode; // 우편번호
	private String me_doro; // 도로명 주소
	private String me_photo; // 사진
	private String me_insdate; //등록일
	private String me_upddate; // 수정일
	private String me_delyn; // 삭제여부
	
	// 아이디 찾기 메일 인증 
	private String tempauthmemail;
	private String tempauthnum;
	
	//학생 관련 컬럼
	private String st_admyear; // 입학년도
	private String st_grade; // 학생 학년
	private String st_class; // 학생반
	private String st_number; // 학생 번호
	
	
	
	
	public KosmosMemberVO() {
		
	}
	

	public KosmosMemberVO(String me_num, String me_id, String me_name, 
						  String me_gen, String me_birth, String me_pw,
						  String me_cp, String me_zipcode, String me_doro, 
						  String me_photo, String me_admin, String me_insdate,
						  String me_upddate,  String me_delyn, String tempauthmemail,
						  String tempauthnum) {
		
		this.me_num = me_num;
		this.me_id = me_id;
		this.me_name = me_name;
		this.me_gen = me_gen;
		this.me_birth = me_birth;
		this.me_pw = me_pw;
		this.me_cp = me_cp;
		this.me_zipcode = me_zipcode;
		this.me_doro = me_doro;
		this.me_photo = me_photo;
		this.me_insdate = me_insdate;
		this.me_upddate = me_upddate;
		this.me_delyn = me_delyn;
		this.tempauthmemail = tempauthmemail;
		this.tempauthnum = tempauthnum;
	}
	
	
	
	public KosmosMemberVO(String st_admyear, String st_grade, 
						  String st_class, 	String st_number) {
		
		this.st_admyear = st_admyear;
		this.st_grade = st_grade;
		this.st_class = st_class;
		this.st_number = st_number;
	}


	public String getMe_num() {
		return me_num;
	}
	public void setMe_num(String me_num) {
		this.me_num = me_num;
	}
	public String getMe_id() {
		return me_id;
	}
	public void setMe_id(String me_id) {
		this.me_id = me_id;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getMe_gen() {
		return me_gen;
	}
	public void setMe_gen(String me_gen) {
		this.me_gen = me_gen;
	}
	public String getMe_birth() {
		return me_birth;
	}
	public void setMe_birth(String me_birth) {
		this.me_birth = me_birth;
	}
	public String getMe_pw() {
		return me_pw;
	}
	public void setMe_pw(String me_pw) {
		this.me_pw = me_pw;
	}

	public String getMe_cp() {
		return me_cp;
	}
	public void setMe_cp(String me_cp) {
		this.me_cp = me_cp;
	}
	public String getMe_zipcode() {
		return me_zipcode;
	}
	public void setMe_zipcode(String me_zipcode) {
		this.me_zipcode = me_zipcode;
	}
	public String getMe_doro() {
		return me_doro;
	}
	public void setMe_doro(String me_doro) {
		this.me_doro = me_doro;
	}
	public String getMe_photo() {
		return me_photo;
	}
	public void setMe_photo(String me_photo) {
		this.me_photo = me_photo;
	}
	public String getMe_insdate() {
		return me_insdate;
	}
	public void setMe_insdate(String me_insdate) {
		this.me_insdate = me_insdate;
	}
	public String getMe_upddate() {
		return me_upddate;
	}
	public void setMe_upddate(String me_upddate) {
		this.me_upddate = me_upddate;
	}
	public String getMe_delyn() {
		return me_delyn;
	}
	public void setMe_delyn(String me_delyn) {
		this.me_delyn = me_delyn;
	}
	public String getTempauthmemail() {
		return tempauthmemail;
	}
	public void setTempauthmemail(String tempauthmemail) {
		this.tempauthmemail = tempauthmemail;
	}
	public String getTempauthnum() {
		return tempauthnum;
	}
	public void setTempauthnum(String tempauthnum) {
		this.tempauthnum = tempauthnum;
	}
	
	////학생관련
	public String getSt_admyear() {
		return st_admyear;
	}
	public void setSt_admyear(String st_admyear) {
		this.st_admyear = st_admyear;
	}
	public String getSt_grade() {
		return st_grade;
	}
	public void setSt_grade(String st_grade) {
		this.st_grade = st_grade;
	}
	public String getSt_class() {
		return st_class;
	}
	public void setSt_class(String st_class) {
		this.st_class = st_class;
	}
	public String getSt_number() {
		return st_number;
	}
	public void setSt_number(String st_number) {
		this.st_number = st_number;
	}

	// 매개변수 확인
	public static void printVO(KosmosMemberVO mvo){
		logger.info("SpringMemberVO 데이터 확인 시작 >>>");
			
		logger.info("회원번호 >>> : " + mvo.getMe_num());
		logger.info("회원이름 >>> : " + mvo.getMe_id());
		logger.info("아이디 >>> : " + mvo.getMe_name());
		logger.info("비밀번호 >>> : " + mvo.getMe_gen());
		logger.info("성별 >>> : " + mvo.getMe_birth());	
		logger.info("생년월일 >>> : " + mvo.getMe_pw());
		logger.info("핸드폰 번호 >>> : " + mvo.getMe_cp());
		logger.info("전화번호 >>> : " + mvo.getMe_zipcode());
		logger.info("이메일 >>> : " + mvo.getMe_doro());		
		logger.info("우편번호(도로명) >>> : " + mvo.getMe_photo());		
		logger.info("주소(도로명) >>> : " + mvo.getMe_insdate());
		logger.info("주소(지번주소) >>> : " + mvo.getMe_upddate());
		logger.info("취미 >>> : " + mvo.getMe_delyn());
		logger.info("취미 >>> : " + mvo.getSt_admyear());
		logger.info("취미 >>> : " + mvo.getSt_grade());
		logger.info("취미 >>> : " + mvo.getSt_number());
		logger.info("취미 >>> : " + mvo.getSt_class());
		
		logger.info("아이디찾기  이메일 >>> : " + mvo.getTempauthmemail());
		logger.info("아이디찾기  인증번호 >>> : " + mvo.getTempauthnum());
		
		logger.info("SpringMemberVO 데이터 확인 끝  >>> : ");	
	}
}
