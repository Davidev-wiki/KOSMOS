package com.kosmos.sugang.vo;

public class KosmosSugangVO {

	private String Sbnum;
	private String Sbsubject;
	private String Sbname;
	private String Sbcontent;
	
	
	public KosmosSugangVO() {
		
	}
		
	public KosmosSugangVO(String Sbnum, String sbsubject, String sbname, String sbcontent) {
		super();
		this.Sbnum = Sbnum;
		Sbsubject = sbsubject;
		Sbname = sbname;
		Sbcontent = sbcontent;
	}
	
	public String getSbnum() {
		return Sbnum;
	}
	public String getSbsubject() {
		return Sbsubject;
	}
	public String getSbname() {
		return Sbname;
	}
	public String getSbcontent() {
		return Sbcontent;
	}
	public void setSbnum(String Sbnum) {
		this.Sbnum = Sbnum;
	}
	public void setSbsubject(String sbsubject) {
		Sbsubject = sbsubject;
	}
	public void setSbname(String sbname) {
		Sbname = sbname;
	}
	public void setSbcontent(String sbcontent) {
		Sbcontent = sbcontent;
	}
	
	
}
