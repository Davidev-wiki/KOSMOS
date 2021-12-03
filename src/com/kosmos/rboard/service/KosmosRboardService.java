package com.kosmos.rboard.service;

import java.util.List;

import com.kosmos.rboard.vo.KosmosRboardVO;

public interface KosmosRboardService {
	
	public List<KosmosRboardVO> rboardSelect(KosmosRboardVO rbvo);
	public List<KosmosRboardVO> rboardSelectAll(KosmosRboardVO rbvo);
	public int rboardInsert(KosmosRboardVO rbvo);
	public int rboardDelete(KosmosRboardVO rbvo);
}
