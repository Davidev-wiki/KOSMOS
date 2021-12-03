package com.kosmos.common;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUploadUtil {

	private String imgfilePaths;
	private int imgfileSize;
	private String encodeType;
	private MultipartRequest mr;
	
	public FileUploadUtil(String imgfilePaths, int imgfileSize, String encodeType) {
		System.out.println("FileileUploadUtil FileUploadUtil() 생성자 진입 >>> : ");
		
		this.imgfilePaths = imgfilePaths;
		this.imgfileSize = imgfileSize;
		this.encodeType = encodeType;	
		
		System.out.println("FileileUploadUtil FileUploadUtil() 생성자 끝 >>> : ");
	}

	public boolean imgfileUpload(HttpServletRequest req) {
		System.out.println("FileileUploadUtil imgfileUpload(req) 함수 진입 >>> : ");
		
		boolean bool = imgfileUpload(req, imgfilePaths);
		
		System.out.println("FileileUploadUtil imgfileUpload(req) 함수 끝 >>> : ");
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req) {
		System.out.println("FileileUploadUtil imgfileUploadSize(req) 함수 진입 >>> : ");
		
		boolean bool = imgfileUploadSize(req, imgfilePaths);
		System.out.println("imgfileUploadSize bool >>> " + bool);
		
		System.out.println("FileileUploadUtil imgfileUploadSize(req) 함수 끝 >>> : ");
		return bool;
	}
	
	public boolean imgfileUpload(HttpServletRequest req, String filePath) {
		System.out.println("FileileUploadUtil imgfileUpload(req, filePath) 함수 진입 >>> : ");
		
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename());
			System.out.println("mr >>> : " + mr);
			bool = true;
		}catch(Exception e) {
			System.out.println("FileileUploadUtil imgfileUpload() >>> : " + mr);
		}
		System.out.println("FileileUploadUtil imgfileUpload(req, filePath) 함수 끝 >>> : ");
		return bool;
	}
	
	public boolean imgfileUploadSize(HttpServletRequest req, String filePath) {
		System.out.println("FileileUploadUtil imgfileUploadSize(req, filePath) 함수 진입 >>> : ");
		System.out.println("req >>> : " + req);
		System.out.println("filePath >>> : " + filePath);
		
		boolean bool = false;
		try {
			mr = new MultipartRequest(req, filePath, imgfileSize, encodeType, new FileRename());
			System.out.println("mr >>> : " + mr);
			System.out.println("mr.getOriginalFileName(\"bo_file\") >>> : " 
							+ mr.getOriginalFileName("bo_file"));
			System.out.println("mr.getFilesystemName(\"bo_file\") >>> : " 
							+ mr.getFilesystemName("bo_file"));
			
			ThumnailImg.thumnailFun(filePath, mr.getFilesystemName("bo_file"));
			bool = true;
		}catch(Exception e) {
			System.out.println("FileileUploadUtil imgfileUploadSize() 에러 >>> : " + mr);
		}
		System.out.println("FileileUploadUtil imgfileUploadSize(req, filePath) 함수 끝 >>> : ");
		return bool;
	}
	
	public String getParameter(String s) {
		System.out.println("FileileUploadUtil getParameter() 함수 진입 >>> : ");
		
		System.out.println("FileileUploadUtil getParameter() 함수 끝 >>> : ");
		return mr.getParameter(s);
	}
	
	public String[] getparameterValues(String s) {
		System.out.println("FileileUploadUtil getparameterValues() 함수 진입 >>> : ");
		
		
		System.out.println("FileileUploadUtil getparameterValues() 함수 끝 >>> : ");
		return mr.getParameterValues(s);
	}
	
	public String getFileName(String f) {
		System.out.println("FileileUploadUtil getFileName() 함수 진입 >>> : ");
		
		System.out.println("FileileUploadUtil getFileName() 함수 끝 >>> : ");
		return mr.getFilesystemName(f);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<String> getFileNames(){
		System.out.println("FileileUploadUtil getFileNames() 함수 진입 >>> : ");
		
		Enumeration<String> en = mr.getFileNames();
		ArrayList<String> a = new ArrayList<String>();
		
		while (en.hasMoreElements()) {
			String f = en.nextElement().toString();
			a.add(mr.getFilesystemName(f));
		}
		System.out.println("FileileUploadUtil getFileNames() 함수 끝 >>> : ");
		return a;
	}
}

