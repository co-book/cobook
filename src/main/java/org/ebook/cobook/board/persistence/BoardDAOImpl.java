package org.ebook.cobook.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.BoardVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.ebook.cobook.mapper.BoardMapper";
	
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", vo);
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public BoardVO read(Integer board_no) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".read", board_no);
	}

}
