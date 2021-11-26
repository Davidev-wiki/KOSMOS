package com.kosmos.subject.dao;

import java.util.List;

import com.kosmos.subject.vo.KosmosSubjectVO;

public interface KosmosSubjectUtilDAO {

	// 선수과목명 리스트
	public List<KosmosSubjectVO> beforeNameList();
}
