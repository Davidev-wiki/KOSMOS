package com.kosmos.subject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.subject.vo.KosmosSubjectVO;

@Repository
public class KosmosSubjectUtilDAOImpl implements KosmosSubjectUtilDAO {
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<KosmosSubjectVO> beforeNameList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("beforeNameList");
	}

}
