package com.kosmos.rboard.dao;

import java.util.List;

import com.kosmos.rboard.vo.KosmosRboardVO;

public interface KosmosRboardDAO {

	public List<KosmosRboardVO> rboardSelect(KosmosRboardVO rbvo);
	public List<KosmosRboardVO> rboardSelectAll(KosmosRboardVO rbvo);
	public int rboardInsert(KosmosRboardVO rbvo);
	public int rboardDelete(KosmosRboardVO rbvo);
}
