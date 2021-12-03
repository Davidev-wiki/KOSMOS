package com.kosmos.board.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.board.dao.KosmosBoardDAO;
import com.kosmos.board.vo.KosmosBoardVO;

@Service
@Transactional
public class KosmosBoardServiceImpl implements KosmosBoardService {
	Logger logger = Logger.getLogger(KosmosBoardService.class);
	
	private KosmosBoardDAO KosmosBoardDAO;
	
	@Autowired(required=false)
	public KosmosBoardServiceImpl(KosmosBoardDAO kosmosBoardDAO) {
		this.KosmosBoardDAO = kosmosBoardDAO;
	}

	@Override
	public List<KosmosBoardVO> boardSelect(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardSelect 함수 진입 >>");
		return KosmosBoardDAO.boardSelect(bvo);
	}

	@Override
	public List<KosmosBoardVO> boardSelectAll(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardSelectAll 함수 진입 >>");
		return KosmosBoardDAO.boardSelectAll(bvo);
	}
	
	@Override
	public int boardInsert(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardInsert 함수 진입 >>");
		return KosmosBoardDAO.boardInsert(bvo);
	}

	@Override
	public int boardUpdate(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardUpdate 함수 진입 >>");
		return KosmosBoardDAO.boardUpdate(bvo);
	}

	@Override
	public int boardDelete(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardDelete 함수 진입 >>");
		return KosmosBoardDAO.boardDelete(bvo);
	}

	@Override
	public List<KosmosBoardVO> boardPwCheck(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardPwCheck 함수 진입 >>");
		return KosmosBoardDAO.boardPwCheck(bvo);
	}

	@Override
	public List<KosmosBoardVO> boardSelectPaging(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardServiceImpl boardSelectPaging 함수 진입 >>");
		return KosmosBoardDAO.boardSelectPaging(bvo);
	}
}
