package com.kosmos.sugang.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kosmos.sugang.vo.KosmosSugangVO;

@Service
@Transactional
public class KosmosSugangDAOImpl implements KosmosSugangDAO {
	
	Logger logger = Logger.getLogger(KosmosSugangDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<KosmosSugangVO> SelectAll(KosmosSugangVO svo) {
		return sqlSession.selectList("SelectAll", svo);
	}

}
