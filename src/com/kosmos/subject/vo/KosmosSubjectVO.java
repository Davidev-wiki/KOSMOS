package com.kosmos.subject.vo;

import org.apache.log4j.Logger;

public class KosmosSubjectVO {
	private static Logger logger = Logger.getLogger(KosmosSubjectVO.class);
	
	private String sb_num;
	private String sb_group;
	private String sb_code;
	private String sb_type;
	private String sb_name;
	
	private String sb_creditunit;
	private String sb_grade;
	private String sb_year;
	private String sb_semester;
	private String sb_teacher;
	
	private String sb_maxstu;
	private String sb_day;
	private String sb_time;
	private String sb_beforeyn;
	private String sb_beforename;
	
	private String sb_insdate;
	private String sb_upddate;
	private String sb_delyn;
	
	public KosmosSubjectVO() {
		
	}

	public KosmosSubjectVO(String sb_num, String sb_group, String sb_code, String sb_type, String sb_name,
					 String sb_creditunit, String sb_grade, String sb_year, String sb_semester, String sb_teacher,
					 String sb_maxstu, String sb_day, String sb_time, String sb_beforeyn, String sb_beforename,
					 String sb_insdate, String sb_upddate, String sb_delyn) {
		
		this.sb_num = sb_num;
		this.sb_group = sb_group;
		this.sb_code = sb_code;
		this.sb_type = sb_type;
		this.sb_name = sb_name;
		this.sb_creditunit = sb_creditunit;
		this.sb_grade = sb_grade;
		this.sb_year = sb_year;
		this.sb_semester = sb_semester;
		this.sb_teacher = sb_teacher;
		this.sb_maxstu = sb_maxstu;
		this.sb_day = sb_day;
		this.sb_time = sb_time;
		this.sb_beforeyn = sb_beforeyn;
		this.sb_beforename = sb_beforename;
		this.sb_insdate = sb_insdate;
		this.sb_upddate = sb_upddate;
		this.sb_delyn = sb_delyn;
	}

	public String getSb_num() {
		return sb_num;
	}

	public void setSb_num(String sb_num) {
		this.sb_num = sb_num;
	}

	public String getSb_group() {
		return sb_group;
	}

	public void setSb_group(String sb_group) {
		this.sb_group = sb_group;
	}

	public String getSb_code() {
		return sb_code;
	}

	public void setSb_code(String sb_code) {
		this.sb_code = sb_code;
	}

	public String getSb_type() {
		return sb_type;
	}

	public void setSb_type(String sb_type) {
		this.sb_type = sb_type;
	}

	public String getSb_name() {
		return sb_name;
	}

	public void setSb_name(String sb_name) {
		this.sb_name = sb_name;
	}

	public String getSb_creditunit() {
		return sb_creditunit;
	}

	public void setSb_creditunit(String sb_creditunit) {
		this.sb_creditunit = sb_creditunit;
	}

	public String getSb_grade() {
		return sb_grade;
	}

	public void setSb_grade(String sb_grade) {
		this.sb_grade = sb_grade;
	}

	public String getSb_year() {
		return sb_year;
	}

	public void setSb_year(String sb_year) {
		this.sb_year = sb_year;
	}

	public String getSb_semester() {
		return sb_semester;
	}

	public void setSb_semester(String sb_semester) {
		this.sb_semester = sb_semester;
	}

	public String getSb_teacher() {
		return sb_teacher;
	}

	public void setSb_teacher(String sb_teacher) {
		this.sb_teacher = sb_teacher;
	}

	public String getSb_maxstu() {
		return sb_maxstu;
	}

	public void setSb_maxstu(String sb_maxstu) {
		this.sb_maxstu = sb_maxstu;
	}

	public String getSb_day() {
		return sb_day;
	}

	public void setSb_day(String sb_day) {
		this.sb_day = sb_day;
	}

	public String getSb_time() {
		return sb_time;
	}

	public void setSb_time(String sb_time) {
		this.sb_time = sb_time;
	}

	public String getSb_beforeyn() {
		return sb_beforeyn;
	}

	public void setSb_beforeyn(String sb_beforeyn) {
		this.sb_beforeyn = sb_beforeyn;
	}

	public String getSb_beforename() {
		return sb_beforename;
	}

	public void setSb_beforename(String sb_beforename) {
		this.sb_beforename = sb_beforename;
	}

	public String getSb_insdate() {
		return sb_insdate;
	}

	public void setSb_insdate(String sb_insdate) {
		this.sb_insdate = sb_insdate;
	}

	public String getSb_upddate() {
		return sb_upddate;
	}

	public void setSb_upddate(String sb_upddate) {
		this.sb_upddate = sb_upddate;
	}

	public String getSb_delyn() {
		return sb_delyn;
	}

	public void setSb_delyn(String sb_delyn) {
		this.sb_delyn = sb_delyn;
	}
	
	public static void subjectPrintVO(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectVO 데이터 체크 시작 >>> : ");
		logger.info("svo.getSb_num() >>> : " + svo.getSb_num());;
		logger.info("svo.getSb_group() >>> : " + svo.getSb_group());
		logger.info("svo.getSb_code() >>> : " + svo.getSb_code());
		logger.info("svo.getSb_type() >>> : " + svo.getSb_type());
		logger.info("svo.getSb_name() >>> : " + svo.getSb_name());
		
		logger.info("getSb_creditunit() >>> : " + svo.getSb_creditunit());
		logger.info("svo.getSb_grade() >>> : " + svo.getSb_grade());
		logger.info("svo.getSb_year() >>> : " + svo.getSb_year());
		logger.info("svo.getSb_semester() >>> : " + svo.getSb_semester());
		logger.info("svo.getSb_teacher() >>> : " + svo.getSb_teacher());
		
		logger.info("svo.getSb_maxstu() >>> : " + svo.getSb_maxstu());
		logger.info("svo.getSb_day() >>> : " + svo.getSb_day());
		logger.info("svo.getSb_time() >>> : " + svo.getSb_time());
		logger.info("svo.getSb_beforename() >>> : " + svo.getSb_beforename());
		
		logger.info("KosmosSubjectVO 데이터 체크 끝 >>> : ");
	}
	
}
