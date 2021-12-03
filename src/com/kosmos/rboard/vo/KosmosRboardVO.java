package com.kosmos.rboard.vo;

public class KosmosRboardVO {

	private String co_num;
	private String bo_num;
	private String ms_num;
	private String co_contents;
	private String co_pw;
	private String co_insdate;
	private String co_delyn;
	
	public KosmosRboardVO () {
		
	}
	
	public KosmosRboardVO (	String co_num, String bo_num, String ms_num, 
							String co_contents, String co_pw, 
							String co_insdate, String co_delyn) {
		
		this.co_num = co_num;
		this.bo_num = bo_num;
		this.ms_num = ms_num;
		this.co_contents = co_contents;
		this.co_pw = co_pw;
		this.co_insdate = co_insdate;
		this.co_delyn = co_delyn;
	}
	//getter
	public String getCo_num() {
		return co_num;
	}

	public String getBo_num() {
		return bo_num;
	}

	public String getMs_num() {
		return ms_num;
	}

	public String getCo_contents() {
		return co_contents;
	}

	public String getCo_pw() {
		return co_pw;
	}

	public String getCo_insdate() {
		return co_insdate;
	}

	public String getCo_delyn() {
		return co_delyn;
	}
	//setter
	public void setCo_num(String co_num) {
		this.co_num = co_num;
	}

	public void setBo_num(String bo_num) {
		this.bo_num = bo_num;
	}

	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}

	public void setCo_contents(String co_contents) {
		this.co_contents = co_contents;
	}

	public void setCo_pw(String co_pw) {
		this.co_pw = co_pw;
	}

	public void setCo_insdate(String co_insdate) {
		this.co_insdate = co_insdate;
	}

	public void setCo_delyn(String co_delyn) {
		this.co_delyn = co_delyn;
	}
	
}
