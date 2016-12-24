package org.ebook.cobook.reply.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.ebook.cobook.mapper.ReplyMapper";
	
	@Override
	public void insert(ReplyVO vo)throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", vo);
	}

	@Override
	public List<ReplyVO> listAll(Integer bno)throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll", bno);
	}

	@Override
	public void update(ReplyVO vo)throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer rno)throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", rno);
	}

	@Override
	public void comment(ReplyVO vo)throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".comment", vo);
	}

	@Override
	public void update_reorder(ReplyVO vo)throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update_reorder", vo);
	}

}
