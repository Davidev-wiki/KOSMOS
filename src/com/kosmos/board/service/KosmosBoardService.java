package com.kosmos.board.service;

import java.util.List;

import com.kosmos.board.vo.KosmosBoardVO;

public interface KosmosBoardService {

	public List<KosmosBoardVO> boardSelect(KosmosBoardVO bvo);
	public List<KosmosBoardVO> boardSelectAll(KosmosBoardVO bvo);
	public int boardInsert(KosmosBoardVO bvo);
	public int boardUpdate(KosmosBoardVO bvo);
	public int boardDelete(KosmosBoardVO bvo);

	// 비밀번호 체크 
	public List<KosmosBoardVO> boardPwCheck(KosmosBoardVO bvo);
	
	// 페이징 
	public List<KosmosBoardVO> boardSelectPaging(KosmosBoardVO bvo);
	
}
