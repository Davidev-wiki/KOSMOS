package com.kosmos.notice.dao;

import java.util.List;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.vo.KosmosNoticeVO;

public interface KosmosNoticeDAO {

	// �Խñ� �ۼ�
	public int noticeInsert(KosmosNoticeVO nvo);
	// �Խñ� ��� ��ȸ
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo);
	

	// �Խñ� �� ��ȸ
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo);
	// ��ȸ�� ����
	public void updateCntHit(String no_num);


	// �Խñ� ����
	public int noticeUpdate(KosmosNoticeVO nvo);
	// �Խñ� ����
	public int noticeDelete(KosmosNoticeVO nvo);
	
	
	// ���� ȸ�� �̸� ��ȸ
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo);
	// �л� ȸ�� �̸� ��ȸ
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo);

	
}
