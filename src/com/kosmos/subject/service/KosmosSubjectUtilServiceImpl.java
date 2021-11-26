package com.kosmos.subject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.subject.dao.KosmosSubjectUtilDAO;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Service
@Transactional
public class KosmosSubjectUtilServiceImpl implements KosmosSubjectUtilService {

	@Autowired(required=false)
	private KosmosSubjectUtilDAO kosmosSubjectUtilDAO;
	
	@Override
	public List<KosmosSubjectVO> beforeNameList() {
		// TODO Auto-generated method stub
		return kosmosSubjectUtilDAO.beforeNameList();
	}

}
