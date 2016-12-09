package org.ebook.cobook.editor.persistence;

import java.util.List;

import org.ebook.cobook.editor.domain.BoardVO;


public interface BoardDAO {

	public void insert(BoardVO vo);

	public List<BoardVO> listAll();
	
	public BoardVO read(Integer board_no);
	
}
