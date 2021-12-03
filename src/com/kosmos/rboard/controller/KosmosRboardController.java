package com.kosmos.rboard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.common.ChabunUtil;
import com.kosmos.common.service.ChabunService;
import com.kosmos.rboard.service.KosmosRboardService;
import com.kosmos.rboard.vo.KosmosRboardVO;

@Controller
public class KosmosRboardController {
Logger logger = Logger.getLogger(KosmosRboardController.class);
	
	@Autowired(required=false)		
	private KosmosRboardService kosmosRboardService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	public KosmosRboardController( KosmosRboardService kosmosRboardService,
            ChabunService chabunService){
					this.kosmosRboardService = kosmosRboardService;
					this.chabunService = chabunService;
					}

	
	@RequestMapping(value="rboardForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String rboardForm(KosmosRboardVO rbvo) {
		logger.info("KosmosRboardController rboardForm >>> : ");
		
		return "rboard/kosmosRboardForm";
	}
	
	// 댓글 등록
	@RequestMapping( value="rboardInsert", method=RequestMethod.POST)
	@ResponseBody
	public String rboardInsert(KosmosRboardVO rbvo) {	
		logger.info("KosmosRboardController rboardInsert >>> : ");
		logger.info("KosmosRboardController rboardInsert rbvo.getCo_num() >>> : " + rbvo.getCo_num());
		logger.info("KosmosRboardController rboardInsert rbvo.getCo_contents() >>> : " + rbvo.getCo_contents());
			
		
		String co_num = ChabunUtil.getRboardChabun("N", chabunService.getRboardChabun().getCo_num());
		logger.info("KosmosRboardController rboardInsert co_num >>> : " + co_num);
		
		rbvo.setCo_num(co_num);
		//rbvo.setSbnum("B0001");
		//rbvo.setRsbpw("1111");
		int nCnt = kosmosRboardService.rboardInsert(rbvo);
		logger.info("KosmosRboardController rboardInsert nCnt >>> : " + nCnt);
		
		if (1 == nCnt) { return "GOOD"; }
		else { return "BAD"; }
	}
	
	// 댓글 조회	
	@RequestMapping( value="rboardSelect", method=RequestMethod.POST)
	@ResponseBody
	public String rboardSelect(KosmosRboardVO rbvo) {	
		logger.info("KosmosRboardController rboardSelect >>> : ");
		logger.info("KosmosRboardController rboardSelect rbvo.getCo_num() >>> : " + rbvo.getCo_num());
	
		List<KosmosRboardVO> list  = kosmosRboardService.rboardSelect(rbvo);
		logger.info("KosmosRboardController rboardSelect _rbvo >>> : " + list);
		
		String listStr =     list.get(0).getCo_num()
						+","+list.get(0).getMs_num()
						+","+list.get(0).getCo_contents()
						+","+list.get(0).getCo_insdate();
		
		return listStr;
	}
	
	// 댓글 전체 조회	
	@RequestMapping( value="rboardSelectAll", method=RequestMethod.POST,
					produces="application/text; charset=UTF-8")
	@ResponseBody
	public String rboardSelectAll(KosmosRboardVO rbvo) {	
		logger.info("KosmosRboardController rboardSelectAll >>> : ");
		// rbvo.setSbnum("B0001");
		logger.info("KosmosRboardController rboardSelectAll rbvo.getCo_num() >>> : " + rbvo.getCo_num());
		
		List<KosmosRboardVO> list  = kosmosRboardService.rboardSelectAll(rbvo);
		logger.info("KosmosRboardController rboardSelectAll _rbvo >>> : " + list);
		
		String ss = "";
		String listStr = "";
		
		for (int i=0; i < list.size(); i++) {
			KosmosRboardVO _rbvo = list.get(i);
			String s0 = _rbvo.getCo_num();
			String s1 = _rbvo.getMs_num();
			String s2 = _rbvo.getCo_contents();
			String s3 = _rbvo.getCo_insdate();
			ss = s0+","+s1+","+s2+","+s3;
			listStr += ss + "&";
		}
		return listStr;
	}
	
	// 댓글 삭제
	@RequestMapping( value="rboardDelete", method=RequestMethod.POST)
	@ResponseBody
	public String rboardDelete(KosmosRboardVO rbvo) {	
		logger.info("KosmosRboardController rboardDelete >>> : ");
		logger.info("KosmosRboardController rboardDelete rbvo.getCo_num() >>> : " + rbvo.getCo_num());
	
		int nCnt  = kosmosRboardService.rboardDelete(rbvo);
		logger.info("KosmosRboardController rboardDelete nCnt >>> : " + nCnt);
		
		if (1 == nCnt) { return "GOOD";}
		else { return "BAD";}
	}	
}
