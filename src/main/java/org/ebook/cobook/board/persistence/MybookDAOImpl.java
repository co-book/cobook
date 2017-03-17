package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

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
	public int getCriCount(Criteria cri) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getCriCount", cri);
	}

	@Override
	public Map<String, Object> getMybookSingle(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getMybookSingle", mybook_no);
	}

	@Override
	public void writeMybook(MybookVO mybookVO) throws Exception{
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", mybookVO);
	}

	@Override
	public void modifyMybook(MybookVO mybookVO) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".update", mybookVO);
	}

	@Override
	public void deleteMybook(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", mybook_no);
	}

	@Override
	public void increseHit(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".increseHit", mybook_no);
	}

	@Override
	public List<MybookVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<Map<String, Object>> getMybookList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getMybookList", cri);
	}

	
	
}
