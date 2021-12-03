package com.kosmos.school.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmos.school.service.KosmosSchoolService;
import com.kosmos.school.vo.KosmosSchoolVO;

@Controller
public class KosmosSchoolController {

	Logger logger = Logger.getLogger(KosmosSchoolController.class);
	
	private KosmosSchoolService kosmosSchoolService;
	
	@Autowired(required=false)
	public KosmosSchoolController(KosmosSchoolService kosmosSchoolService) {
		this.kosmosSchoolService = kosmosSchoolService;
	}
	
	// 시간표
	@GetMapping("timetable")
	public String timetable(KosmosSchoolVO svo, Model model) {
		logger.info("KosmosSchoolController timetable() 함수 진입 >>> : ");
		
		// 회원번호 받아오기
		String ms_num = "1";
		svo.setMs_num(ms_num);
		
		// 1교시 세팅
		List<KosmosSchoolVO> aList1 = kosmosSchoolService.timetable1(svo);
		// 2교시 세팅
		List<KosmosSchoolVO> aList2 = kosmosSchoolService.timetable2(svo);
		// 3교시 세팅
		List<KosmosSchoolVO> aList3 = kosmosSchoolService.timetable3(svo);
		// 4교시 세팅
		List<KosmosSchoolVO> aList4 = kosmosSchoolService.timetable4(svo);
		// 5교시 세팅
		List<KosmosSchoolVO> aList5 = kosmosSchoolService.timetable5(svo);
		// 6교시 세팅
		List<KosmosSchoolVO> aList6 = kosmosSchoolService.timetable6(svo);
		// 7교시 세팅
		List<KosmosSchoolVO> aList7 = kosmosSchoolService.timetable7(svo);
		
		model.addAttribute("aList1", aList1);
		model.addAttribute("aList2", aList2);
		model.addAttribute("aList3", aList3);
		model.addAttribute("aList4", aList4);
		model.addAttribute("aList5", aList5);
		model.addAttribute("aList6", aList6);
		model.addAttribute("aList7", aList7);
		
		// 6교시까지 셀렉트 성공하면 sugang_timetable로
		if(aList1.size() > 0 && aList2.size() > 0 && aList3.size() > 0 && 
				aList4.size() > 0 && aList5.size() > 0 && aList6.size() > 0
				&& aList7.size() > 0) {
			return "school/school_timetable";
		}
		return "school/checkfail";
	}
}
