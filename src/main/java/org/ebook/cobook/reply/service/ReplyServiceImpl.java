package org.ebook.cobook.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDao;
	
	@Override
	public void register(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.insert(vo);
	}

	@Override
	public List<ReplyVO> listAll(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.listAll(bno);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.update(vo);
	}

	@Override
	public void remove(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		replyDao.delete(rno);
	}

	@Override
	public void comment(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.update_reorder(vo);
		vo.setReorder(vo.getReorder() + 1);
		
		replyDao.comment(vo);
		
	}

	

}
