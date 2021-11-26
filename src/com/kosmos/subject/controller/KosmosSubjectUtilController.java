package com.kosmos.subject.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.subject.service.KosmosSubjectUtilService;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Controller
public class KosmosSubjectUtilController {
	private Logger logger = Logger.getLogger(KosmosSubjectUtilController.class);
	
	@Autowired(required=false)
	private KosmosSubjectUtilService kosmosSubjectUtilService;
	
	// 교과군 sb_group, 국어, 수학, 영어, 사회 과학 (01~ )
	@PostMapping("getBeforeNameList")
	@ResponseBody
	public List<KosmosSubjectVO> beforeNameList() {
		logger.info("KosmosSubjectController : beforeNameList() >>> : ");
		
		List<KosmosSubjectVO> listBN = kosmosSubjectUtilService.beforeNameList();
		for (int i=0; i < listBN.size(); i++) {
			System.out.println("listBN >>> : " + listBN);
		}
		return listBN;
	}
	
	// 과목유형 sb_type 필수, 선택
	
	// 선수과목유무 Y > 있음, N > 없음
	
	// 선수과목명
}
