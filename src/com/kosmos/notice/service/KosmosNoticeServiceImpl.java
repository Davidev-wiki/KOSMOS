package com.kosmos.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.dao.KosmosNoticeDAO;
import com.kosmos.notice.vo.KosmosNoticeVO;

@Service
@Transactional
public class KosmosNoticeServiceImpl implements KosmosNoticeService {

	
	Logger logger = Logger.getLogger(KosmosNoticeServiceImpl.class);
	
	
	@Autowired(required=false)
	private KosmosNoticeDAO kosmosNoticeDAO;
	
	public KosmosNoticeServiceImpl(KosmosNoticeDAO kosmosNoticeDAO) {
		this.kosmosNoticeDAO = kosmosNoticeDAO;
	}

	// �۾���
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("noticeInsert(nvo) Transaction");
		return kosmosNoticeDAO.noticeInsert(nvo);
	}
	
	// ��� ��ȸ
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo) {
		logger.info("noticeList(nvo) ȣ��");
		return kosmosNoticeDAO.noticeList(nvo);
	}
	
	// �Խñ� �� ��ȸ
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("noticeSelect(nvo) ȣ��");
		return kosmosNoticeDAO.noticeSelect(nvo);
	}
	
	// ��ȸ�� ������Ʈ
	@Override
	public void updateCntHit(String no_num) {
		logger.info("updateCntHit() Transaction");
		kosmosNoticeDAO.updateCntHit(no_num);
	}
	
	// ����
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		logger.info("noticeUpdate(nvo) Transaction");
		return kosmosNoticeDAO.noticeUpdate(nvo);
	}

	// ����
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		logger.info("noticeDelete(nvo) Transaction");
		return kosmosNoticeDAO.noticeDelete(nvo);
	}

	
	// ���� ȸ�� �̸� ��ȸ
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		logger.info("checkTeacher(lvo) ȣ��");
		return kosmosNoticeDAO.checkTeacher(lvo);
	}
	
	// �л� ȸ�� �̸� ��ȸ
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		logger.info("checkStudent(lvo) ȣ��");
		return kosmosNoticeDAO.checkStudent(lvo);
	}


}
