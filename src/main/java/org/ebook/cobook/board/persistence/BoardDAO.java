package org.ebook.cobook.board.persistence;

import java.util.List;

import org.ebook.cobook.board.domain.BoardVO;


public interface BoardDAO {

	public void insert(BoardVO vo);

	public List<BoardVO> listAll();
	
	public BoardVO read(Integer board_no);
	
}
