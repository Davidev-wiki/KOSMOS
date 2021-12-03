package com.kosmos.board.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.board.vo.KosmosBoardVO;

@Repository
public class KosmosBoardDAOImpl implements KosmosBoardDAO {
	Logger logger = Logger.getLogger(KosmosBoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<KosmosBoardVO> boardSelect(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardSelect 함수 진입 >> ");
		return sqlSession.selectList("boardSelect", bvo);
	}

	@Override
	public List<KosmosBoardVO> boardSelectAll(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardSelectAll 함수 진입 >> ");
		return sqlSession.selectList("boardSelectAll", bvo);
	}

	@Override
	public int boardInsert(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardInsert 함수 진입 >> ");
		return (Integer)sqlSession.insert("boardInsert", bvo);
	}

	@Override
	public int boardUpdate(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardUpdate 함수 진입 >> ");
		return (Integer)sqlSession.update("boardUpdate", bvo);
	}

	@Override
	public int boardDelete(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardDelete 함수 진입 >> ");
		return (Integer)sqlSession.update("boardDelete", bvo);
	}

	@Override
	public List<KosmosBoardVO> boardPwCheck(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardPwCheck 함수 진입 >> ");
		return sqlSession.selectList("boardPwCheck", bvo);
	}

	@Override
	public List<KosmosBoardVO> boardSelectPaging(KosmosBoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosBoardDAOImpl boardSelectPaging() 함수 진입 >>> : ");
		
		return sqlSession.selectList("boardSelectPaging", bvo);
	}

	
}
