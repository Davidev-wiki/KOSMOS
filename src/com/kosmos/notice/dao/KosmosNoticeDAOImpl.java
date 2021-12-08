package com.kosmos.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.vo.KosmosNoticeVO;

@Repository
public class KosmosNoticeDAOImpl implements KosmosNoticeDAO {

	// KosmosNoticeDAO�� ���� �α� ���
	private Logger logger = Logger.getLogger(KosmosNoticeDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	// �������� �Խñ� �Է� 
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeInsert()");
		return (Integer)sqlSession.insert("noticeInsert", nvo);
	}
	
	// ��� ��ȸ
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo){
		logger.info("DAOImpl.noticeList() ȣ��");

		String searchType = nvo.getSearchType();
		String keyword = nvo.getKeyword();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectList("noticeList", nvo);
	}
	
	// �������� �Խñ� �� ��ȸ
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeSelect() ȣ��");
		return sqlSession.selectOne("noticeSelect", nvo);
	}

	// ��ȸ�� ī��Ʈ(update��)
	@Override
	public void updateCntHit(String no_num) {
		logger.info("DAOImpl.updateCntHit() ");
		sqlSession.update("updateCntHit", no_num);
	}
	
	// �Խñ� ����(update��)
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeUpdate", nvo);
	}
	
	// �Խñ� ����(update��)
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeDelete", nvo);
	}

	
	// ���� ȸ�� �̸� ��ȸ
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkTeacher", lvo);
	}

	// �л� ȸ�� �̸� ��ȸ
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkStudent", lvo);
	}
	

}
