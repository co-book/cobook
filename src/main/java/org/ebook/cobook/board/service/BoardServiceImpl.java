package org.ebook.cobook.board.service;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.BoardVO;
import org.ebook.cobook.board.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void register(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public BoardVO read(Integer bno) {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	
	
	

}
