package com.kosmos.sugang.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kosmos.sugang.dao.KosmosSugangDAO;
import com.kosmos.sugang.service.KosmosSugangService;

@Controller
public class KosmosSugangController {
	

	Logger logger = Logger.getLogger(KosmosSugangService.class);
	
	private KosmosSugangService kosmosSugangService;
	private KosmosSugangDAO kosmosSugangDAO;
	
	// 생성자 오토와이어드 
	
	@Autowired(required=false)	
	public KosmosSugangController( KosmosSugangService kosmosSugangService
			               		 ,KosmosSugangDAO kosmosSugangDAO) {
		this.kosmosSugangService = kosmosSugangService;
		this.kosmosSugangDAO = kosmosSugangDAO;
	}	

}
