package com.kosmos.subject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.member.vo.KosmosMemberVO;
import com.kosmos.subject.service.KosmosSubjectService;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Controller
public class KosmosSubjectController {
	private Logger logger = Logger.getLogger(KosmosSubjectController.class);
	private KosmosSubjectService kosmosSubjectService;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public KosmosSubjectController(KosmosSubjectService kosmosSubjectService) {
		this.kosmosSubjectService = kosmosSubjectService;
	}
	
	@Autowired(required=false)
	public KosmosSubjectController() {
		// TODO Auto-generated constructor stub
	}

	@GetMapping("subject")
	public String subjectForm() {
		return "subject/subjectInsertForm";
	}
	
	@GetMapping("subjectSelectAll")
	public String subjectSelectAll(HttpServletRequest req, KosmosSubjectVO svo, Model model){
		logger.info("SubjectController : subjectSelectAll() >>> : ");
		
		String sb_year = req.getParameter("sb_year");
		String sb_semester = req.getParameter("sb_semester");
		String sb_name = req.getParameter("sb_name");
		String sb_teacher = req.getParameter("sb_teacher");
		String sb_grade = req.getParameter("sb_grade");
		String sb_day = req.getParameter("sb_day");
		String sb_time = req.getParameter("sb_time");
		
		svo.setSb_year(sb_year);
		svo.setSb_semester(sb_semester);
		svo.setSb_name(sb_name);
		svo.setSb_teacher(sb_teacher);
		svo.setSb_grade(sb_grade);
		svo.setSb_day(sb_day);
		svo.setSb_time(sb_time);
		KosmosSubjectVO.subjectPrintVO(svo);
		
		List<KosmosSubjectVO> listSA = kosmosSubjectService.subjectSelectAll(svo);
		logger.info("SubjectController : subjectSelectAll() listSA.size() >>> : " + listSA.size());
		logger.info("SubjectController : subjectSelectAll() svo >>> : " + svo);
		if (listSA != null && listSA.size() > 0) {
			model.addAttribute("listSA", listSA);
			return "subject/subjectSelectAll";
		}
		return "subject/subjectSelectAll";
	}
	
	@GetMapping("subjectSelect")
	public String subjectSelect(HttpServletRequest req, KosmosSubjectVO svo, Model model) {
		logger.info("SubjectController : subjectSelect() >>> : ");
		
		String sb_num = req.getParameter("sb_num");
		svo.setSb_num(sb_num);
//		KosmosSubjectVO.subjectPrintVO(svo);	svo_, listS에 담기는지 확인용 코드
		List<KosmosSubjectVO> listS = kosmosSubjectService.subjectSelect(svo);
		KosmosSubjectVO svo_ = listS.get(0);			// svo_, listS에 담기는지 확인용 코드 (지울 예정)	
		KosmosSubjectVO.subjectPrintVO(svo_);			// svo_, listS에 담기는지 확인용 코드 (지울 예정)	
		if (listS != null && listS.size() > 0) {
			
			model.addAttribute("listS", listS);
			return "subject/subjectSelect";
		}
		return "";
	}
	
	@GetMapping("selectSB")
	public String selectSB(HttpServletRequest req, KosmosSubjectVO svo, Model model) {
		
		String sb_year = req.getParameter("sb_year");
		String sb_semester = req.getParameter("sb_semester");
		String sb_name = req.getParameter("sb_name");
		String sb_teacher = req.getParameter("sb_teacher");
		String sb_grade = req.getParameter("sb_grade");
		String sb_day = req.getParameter("sb_day");
		String sb_time = req.getParameter("sb_time");
		
		svo.setSb_year(sb_year);
		svo.setSb_semester(sb_semester);
		svo.setSb_name(sb_name);
		svo.setSb_teacher(sb_teacher);
		svo.setSb_grade(sb_grade);
		svo.setSb_day(sb_day);
		svo.setSb_time(sb_time);
		
		KosmosSubjectVO.subjectPrintVO(svo);
		List<KosmosSubjectVO> listSB = kosmosSubjectService.subjectSelectAll(svo);
		
		if(listSB != null && listSB.size() > 0) {
			model.addAttribute("listSB", listSB);
			return "subject/subjectSelectAll";
		}
		return "subject/subjectAdminCheckFail";
	}
	
	@GetMapping("tempCheck")
	public String tempCheck(HttpServletRequest req, KosmosMemberVO mvo) {
		logger.info("kosmosSubjectController : tempCheck() 과목 정보 입력 후 임시로 거치는 컨트롤러 작업 >>> : ");
		
		KosmosSubjectVO svo = null;
		svo = new KosmosSubjectVO();
		String sb_num = req.getParameter("sb_num");			// 채번으로 구하기
		String sb_group = req.getParameter("sb_group");
		
		String sb_code = req.getParameter("sb_code");
		String sb_type = req.getParameter("sb_type");
		String sb_name = req.getParameter("sb_name");
		
		String sb_creditunit = req.getParameter("sb_creditunit");
		String sb_grade = req.getParameter("sb_grade");
		String sb_year = req.getParameter("sb_year");
		String sb_semester = req.getParameter("sb_semester");
		String sb_teacher = req.getParameter("sb_teacher");
		
		String sb_maxstu = req.getParameter("sb_maxstu");
		String sb_day = req.getParameter("sb_day");
		String sb_time = req.getParameter("sb_time");
		String sb_beforename = req.getParameter("sb_beforename");
			
		svo.setSb_num(sb_num);
		svo.setSb_group(sb_group);
		svo.setSb_code(sb_code);
		svo.setSb_type(sb_type);
		svo.setSb_name(sb_name);
		
		svo.setSb_creditunit(sb_creditunit);
		svo.setSb_grade(sb_grade);
		svo.setSb_year(sb_year);
		svo.setSb_semester(sb_semester);
		svo.setSb_teacher(sb_teacher);
		
		svo.setSb_maxstu(sb_maxstu);
		svo.setSb_day(sb_day);
		svo.setSb_time(sb_time);
		svo.setSb_beforename(sb_beforename);
		
		KosmosSubjectVO.subjectPrintVO(svo);
		// 선수과목 여부 체크 
		// 또는 jsp에서 sb_beforeyn이 "Y"이면 sb_beforename 꼭 입력하는 로직으로
		if (svo.getSb_beforename() != null ) {
			svo.setSb_beforeyn("Y");
		}else {
			svo.setSb_beforeyn("N");
		}
		return "subject/subjectAdminCheck";
	}
	
	@GetMapping("subjectAdminCheck")
	public String subjectAdminCheck(HttpServletRequest req, KosmosSubjectVO svo, Model model) {
		logger.info("KosmosSubjectController : subjectAdminCheck() >>> : ");
		
		KosmosMemberVO mvo = null;
		mvo = new KosmosMemberVO();
		String me_id = req.getParameter("me_id");
		String me_pw = req.getParameter("me_pw");
		mvo.setMe_num(me_id);
		mvo.setMe_pw(me_pw);
		mvo.printVO(mvo);
		
		List<KosmosSubjectVO> listAC = kosmosSubjectService.subjectAdminCheck(mvo);
		if (listAC != null && listAC.size() > 0) {
			String me_num = mvo.getMe_num();
			logger.info("Controller : me_num >>> : " + me_num);
			// ME_NUM이 T로 시작하는지 확인하는 절차를 만들고 싶은데... 안 만들어도 상관없나? 아니야 학생이 할 수도 있으니까 있어야 함..
			
			KosmosSubjectController ksc = new KosmosSubjectController();
			String subIn = ksc.subjectInsert(req, svo);
			// Model에 담아서 넘어갈 필요가 있나?
			return subIn;
		}else {
			
		}
		model.addAttribute("svoAC", svo);
//		KosmosSubjectController ksc = new KosmosSubjectController();
//		ksc.subjectSelectAll(req, svo, model);
//		return "subject/subjectAdminCheckFail";
		return "subject/subjectInsertForm";
	}
	

	@GetMapping("subjectInsert")
	public String subjectInsert(HttpServletRequest req, KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectInsert() >>> : ");
		
		String sb_num = req.getParameter("sb_num");			// 채번으로 구하기
		String sb_group = req.getParameter("sb_group");
		
		String sb_code = req.getParameter("sb_code");
		String sb_type = req.getParameter("sb_type");
		String sb_name = req.getParameter("sb_name");
		
		String sb_creditunit = req.getParameter("sb_creditunit");
		String sb_grade = req.getParameter("sb_grade");
		String sb_year = req.getParameter("sb_year");
		String sb_semester = req.getParameter("sb_semester");
		String sb_teacher = req.getParameter("sb_teacher");
		
		String sb_maxstu = req.getParameter("sb_maxstu");
		String sb_day = req.getParameter("sb_day");
		String sb_time = req.getParameter("sb_time");
		String sb_beforename = req.getParameter("sb_beforename");
	//	String sb_insdate = req.getParameter("sb_insdate");	// SYSDATE
		
		svo.setSb_num(sb_num);
		svo.setSb_group(sb_group);
		svo.setSb_code(sb_code);
		svo.setSb_type(sb_type);
		svo.setSb_name(sb_name);
		
		svo.setSb_creditunit(sb_creditunit);
		svo.setSb_grade(sb_grade);
		svo.setSb_year(sb_year);
		svo.setSb_semester(sb_semester);
		svo.setSb_teacher(sb_teacher);
		
		svo.setSb_maxstu(sb_maxstu);
		svo.setSb_day(sb_day);
		svo.setSb_time(sb_time);
		svo.setSb_beforename(sb_beforename);
		
		KosmosSubjectVO.subjectPrintVO(svo);
		// 선수과목 여부 체크 
		// 또는 jsp에서 sb_beforeyn이 "Y"이면 sb_beforename 꼭 입력하는 로직으로
		if (svo.getSb_beforename() != null ) {
			svo.setSb_beforeyn("Y");
		}else {
			svo.setSb_beforeyn("N");
		}
		
		int nCntI = kosmosSubjectService.subjectInsert(svo);
		logger.info("KosmosSubjectController : subjectInsert() svo >>> : " + svo);
		logger.info("KosmosSubjectController : subjectInsert() nCntI >>> : " + nCntI);
		if (nCntI > 0) {
			logger.info("KosmosSubjectController : subjectInsert() 과목 등록 완료 >>> : ");
			return "subject/subjectSelect";		// 또는 subjectSelect 페이지로 이동
		}		
		return "subject/subjectAdminCheck";		// 일단은 나중에 subjectSelectAll 페이지로 이동
	}
	
	@GetMapping("subjectUpdateForm")
	public String subjectUpdateForm(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectUpdateForm() >>> : ");
		return "subject/subjectUpdateForm";
	}
	
	@GetMapping("subjectUpdate")
	public String subjectUpdate(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectUpdate() >>> : ");
		logger.info("KosmosSubjectController : subjectUpdate() svo >>> : " + svo);
		
		int nCntU = kosmosSubjectService.subjectUpdate(svo);
		logger.info("KosmosSubjectController : subjectUpdate() nCntU >>> : " + nCntU);
		if (nCntU > 0) {
			return "subject/subjectSelectAll";
		}
		return "subject/subjectAdminCheckFail";
	}
	
	@GetMapping("subjectDelete")
	public String subjectDelete(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectDelete() >>> : ");
		logger.info("KosmosSubjectController : subjectDelete() svo >>> : " + svo);
				
		int nCntD = kosmosSubjectService.subjectDelete(svo);
		logger.info("KosmosSubjectController : subjectDelete() nCntD >>> : " + nCntD);
		if (nCntD > 0) {
			return "subject/subjectUpdate";
		}
		return "subject/subjectAdminCheckFail";
	}
	
	
}
