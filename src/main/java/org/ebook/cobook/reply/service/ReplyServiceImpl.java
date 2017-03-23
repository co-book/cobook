package org.ebook.cobook.reply.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDao;

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.insertReply(vo);
	}

	@Override
	public List<Map<String, Object>> replyAndLike_itList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.replyList(map);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.updateReply(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		replyDao.deleteReply(rno);
	}

	@Override
	public void addComment(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.insertComment(vo);
	}

	@Override
	public void addLikeIt(Like_itVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.addLikeIt(vo);
	}

	@Override
	public void deleteLikeIt(Integer like_it_no) throws Exception {
		// TODO Auto-generated method stub
		replyDao.deleteLikeIt(like_it_no);
	}
	
	

	

}
