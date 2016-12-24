package org.ebook.cobook.board.service;

import java.util.List;

import org.ebook.cobook.board.domain.BoardVO;


public interface BoardService {

	public void register(BoardVO vo);
	
	public List<BoardVO> listAll();
	
	public BoardVO read(Integer bno);
	
}
