package org.ebook.cobook.editor.service;

import java.util.List;

import org.ebook.cobook.editor.domain.BoardVO;


public interface BoardService {

	public void register(BoardVO vo);
	
	public List<BoardVO> listAll();
	
	public BoardVO read(Integer bno);
	
}
