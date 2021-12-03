package com.kosmos.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.board.service.KosmosBoardService;
import com.kosmos.board.service.KosmosBoardServiceImpl;
import com.kosmos.board.vo.KosmosBoardVO;
import com.kosmos.common.ChabunUtil;
import com.kosmos.common.CommonUtils;
import com.kosmos.common.FileUploadUtil;
import com.kosmos.common.service.ChabunService;

@Controller
public class KosmosBoardController {
	Logger logger = Logger.getLogger(KosmosBoardController.class);
	
	private KosmosBoardService kosmosBoardService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드 
		@Autowired(required=false)	
	public KosmosBoardController( KosmosBoardService kosmosBoardService
			,ChabunService chabunService){
		this.kosmosBoardService = kosmosBoardService;
		this.chabunService = chabunService;
	}	
		
	// 게시판 글 입력 폼
	@RequestMapping(value="boardForm", method=RequestMethod.GET)
	public String boardForm() {		
		return "board/kosmosBoardForm";
	}
	
	// 글쓰기 
	@RequestMapping(value="boardInsert", method=RequestMethod.POST)
	public String boardInsert(HttpServletRequest req) {
		logger.info("BoardController boardInsert 함수 진입 >>> :");
					
		// 채번 구하기
		String bo_num= ChabunUtil.getBoardChabun("N", chabunService.getBoardChabun().getBo_num());
				
		// 이미지 업로드
		FileUploadUtil fu = new FileUploadUtil(	CommonUtils.BOARD_IMG_UPLOAD_PATH
					                               ,CommonUtils.BOARD_IMG_FILE_SIZE
					                               ,CommonUtils.BOARD_EN_CODE);
		// 이미지 파일 원본 사이즈 
		// boolean bool = fu.imgfileUpload(req);
		// 이미지 파일 원본 사이즈 크기 조절 하기 
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("KosmosBoardController boardInsert bool >>> : " + bool);
			
		// 채번, 이미지 업로드 성공하면 VO 세팅하기 
		KosmosBoardVO _bvo = null;
		_bvo = new KosmosBoardVO();
			
			_bvo.setBo_num(bo_num);
			_bvo.setMs_num(fu.getParameter("ms_num"));
			_bvo.setBo_header(fu.getParameter("bo_header"));
			_bvo.setBo_subject(fu.getParameter("bo_subject"));
			_bvo.setBo_contents(fu.getParameter("bo_contents"));
			_bvo.setBo_pw(fu.getParameter("bo_pw"));
			_bvo.setBo_file(fu.getParameter("bo_file"));
			
			
			
			logger.info("KosmosBoardController boardInsert _bvo.getgetBo_num() >>> : " + _bvo.getBo_num());
			logger.info("KosmosBoardController boardInsert _bvo.gettBo_contents() >>> : " + _bvo.getBo_contents());
			logger.info("KosmosBoardController boardInsert _bvo.getBo_file() >>> : " + _bvo.getBo_file());
			int nCnt = kosmosBoardService.boardInsert(_bvo);
			logger.info("KosmosBoardController boardInsert nCnt >>> : " + nCnt);
			
			if (nCnt > 0) { return "board/kosmosBoardInsert";}
			return "board/kosmosBoardForm";
		}		
		// 글 목록 페이징 조회
			@RequestMapping(value="boardSelectPaging", method=RequestMethod.GET)
			public String boardSelectPaging(KosmosBoardVO bvo, Model model) {
				logger.info("KosmosBoardController boardSelectPaging 함수 진입 >>> :");	
				
				logger.info("KosmosBoardController boardSelectPaging 함수 진입 >>> : 페이징 관련 로그 ================");	
				
				// 페이징 변수 세팅
				int pageSize = CommonUtils.BOARD_PAGE_SIZE;
				int groupSize = CommonUtils.BOARD_GROUP_SIZE;
				int curPage = CommonUtils.BOARD_CUR_PAGE;
				int totalCount = CommonUtils.BOARD_TOTAL_COUNT;
				
				if (bvo.getCurPage() !=null){
					curPage = Integer.parseInt(bvo.getCurPage());
				}
				
				bvo.setPageSize(String.valueOf(pageSize));
				bvo.setGroupSize(String.valueOf(groupSize));
				bvo.setCurPage(String.valueOf(curPage));
				bvo.setTotalCount(String.valueOf(totalCount));
				
				logger.info("KosmosBoardController boardSelectPaging bvo.getPageSize() >>> : " + bvo.getPageSize());
				logger.info("KosmosBoardController boardSelectPaging bvo.getGroupSize() >>> : " + bvo.getGroupSize());
				logger.info("KosmosBoardController boardSelectPaging bvo.getCurPage() >>> : " + bvo.getCurPage());
				logger.info("KosmosBoardController boardSelectPaging bvo.getTotalCount() >>> : " + bvo.getTotalCount());
				
				KosmosBoardVO.printVO(bvo);
				
				List<KosmosBoardVO> listAll = kosmosBoardService.boardSelectPaging(bvo);
				logger.info("KosmosBoardController boardSelectPaging listAll.size() >>> : " + listAll.size());
				
				
				if (listAll.size() > 0) { 
				for (int i=0; i < listAll.size(); i++) {
					KosmosBoardVO sbvo = (KosmosBoardVO)listAll.get(i);
					logger.info("listAll ::: bvo.getPageSize() >>> : " + sbvo.getPageSize());
					logger.info("listAll ::: bvo.getGroupSize() >>> : " + sbvo.getGroupSize());
					logger.info("listAll ::: bvo.getCurPage() >>> : " + sbvo.getCurPage());
					logger.info("listAll ::: bvo.getTotalCount() >>> : " + sbvo.getTotalCount());				}						
					model.addAttribute("pagingBVO", bvo);
					model.addAttribute("listAll", listAll);
					
					return "board/kosmosBoardSelectPaging";
				}
				
				return "board/kosmosBoardForm";
			}
				
			// 글 목록 조회
			@RequestMapping(value="boardSelectAll", method=RequestMethod.GET)
			public String boardSelectAll(KosmosBoardVO bvo, Model model) {
				logger.info("KosmosBoardController boardSelectAll 함수 진입 >>> :");	
				
				logger.info("KosmosBoardController boardSelectAll 검색 관련 로그  >>> : ===================================");
				logger.info("KosmosBoardController boardSelectAll bvo.getKeyfilter() >>> : " + bvo.getKeyfilter());
				logger.info("KosmosBoardController boardSelectAll  bvo.getKeyword() >>> : " + bvo.getKeyword());
				logger.info("KosmosBoardController boardSelectAll bvo.getStartdate() >>> : " + bvo.getStartdate());
				logger.info("KosmosBoardController boardSelectAll  bvo.getEnddate() >>> : " + bvo.getEnddate());
				
				List<KosmosBoardVO> listAll = kosmosBoardService.boardSelectAll(bvo);
				logger.info("KosmosBoardController boardSelectAll listAll.size() >>> : " + listAll.size());
				
				if (listAll.size() > 0) { 
								
					model.addAttribute("listAll", listAll);
					return "board/kosmosBoardSelectAll";
				}
				
				return "board/kosmosBoardForm";
			}
				
			// 게시글 수정/삭제 글 조회
			@RequestMapping(value="boardSelect", method=RequestMethod.POST)
			public String boardSelect(KosmosBoardVO bvo, Model model) {	
				logger.info("KosmosBoardController boardSelect 함수 진입 >>> :");		
				logger.info("KosmosBoardController boardSelect bvo.getBo_num() >>> : " + bvo.getBo_num());		
				
				List<KosmosBoardVO> listS = kosmosBoardService.boardSelect(bvo);
				logger.info("KosmosBoardController boardSelect listS.size() >>> : " + listS.size());
				
				if (listS.size() == 1) { 
					model.addAttribute("listS", listS);
					return "board/kosmosBoardSelect";
				}		
				return "board/kosmosBoardForm";
			}
				
			// 글 수정하기 
			@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
			public String boardUpdate(KosmosBoardVO bvo, Model model) {
				logger.info("KosmosBoardController boardUpdate 함수 진입 >>> :");
				
				logger.info("KosmosBoardController boardUpdate bvo.getBo_num() >>> : " + bvo.getBo_num());
				logger.info("KosmosBoardController boardUpdate bvo.getBo_contents() >>> : " + bvo.getBo_contents());
				int nCnt = kosmosBoardService.boardUpdate(bvo);
				logger.info("KosmosBoardController boardUpdate nCnt >>> : " + nCnt);
				
				if (nCnt > 0) { return "board/kosmosBoardUpdate";}
				return "board/kosmosBoardForm";
			}
			
			// 글 삭제하기
			@RequestMapping(value="boardDelete", method=RequestMethod.POST)
			public String boardDelete(KosmosBoardVO bvo, Model model) {
				logger.info("KosmosBoardController boardDelete 함수 진입 >>> :");
				
				logger.info("KosmosBoardController boardDelete bvo.getBo_num() >>> : " + bvo.getBo_num());		
				int nCnt = kosmosBoardService.boardDelete(bvo);
				logger.info("KosmosBoardController boardDelete nCnt >>> : " + nCnt);
				
				if (nCnt > 0) { return "board/kosmosBoardDelete";}
				return "board/kosmosBoardForm";
			}
				
			// 비밀번호 체크하기
			@RequestMapping(value="boardPwCheck", method=RequestMethod.POST)
			@ResponseBody
			public Object boardPwCheck(KosmosBoardVO bvo) {
			logger.info("KosmosBoardController boardPwCheck 함수 진입 >>> :");
				
			logger.info("KosmosBoardController boardPwCheck bvo.getBo_num() >>> : " + bvo.getBo_num());	
			logger.info("KosmosBoardController boardPwCheck bvo.getBo_pw() >>> : " + bvo.getBo_pw());	
				
				List<KosmosBoardVO> list = kosmosBoardService.boardPwCheck(bvo);			
				logger.info("KosmosBoardController boardPwCheck _bvo.getBo_pw() >>> : " + list.size());
				
				String msg = "";		
				if (list.size() == 1) {msg = "PW_GOOD";}  
				else { msg = "PW_BAD";}  
				
				return msg;		
			}
	
}
