package org.ebook.cobook.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.springframework.stereotype.Repository;

@Repository
public class MybookDAOImpl implements MybookDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.ebook.cobook.mapper.MybookMapper";
	
	@Override
	public List<MybookVO> listCri(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listCri", cri);
	}

	@Override
	public int getCriCount(Criteria cri) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getCriCount", cri);
	}

	@Override
	public MybookVO read(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".read", mybook_no);
	}

	@Override
	public void insert(MybookVO vo) throws Exception{
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(MybookVO vo) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", mybook_no);
	}

	@Override
	public void increseHit(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".increseHit", mybook_no);
	}

}
