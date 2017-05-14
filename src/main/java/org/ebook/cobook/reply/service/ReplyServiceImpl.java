package org.ebook.cobook.reply.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.domain.StarVO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDao;
	/*
	 * (non-Javadoc)
	 * @see org.ebook.cobook.reply.service.ReplyService#addReply(org.ebook.cobook.reply.domain.ReplyVO)
	 * reply, comment 등록
	 */
	@Override
	public String addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub 
		String result="FAIL";
		//이미 작성한댓글이있는지 체크 select 
		if(vo.getParent_type().equals("EBOOK")){
			if(replyDao.addReplyCheck(vo)==null){
				replyDao.addReply(vo);

				replyDao.addStarRating(vo);
				result="SUCCESS";
			}else{
				result="FAIL";
			}
		}else{
			replyDao.addReply(vo);
			result="SUCCESS";
		}
		return result;
	}
	@Override
	public void addComment(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.addComment(vo);
	}	

	/**
	 * reply, comment 리스트 뽑아오기
	 */
	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.getReplyList(vo);
	}
	@Override
	public List<ReplyVO> getCommentList(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.getCommentList(vo);
	}
	
	
	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.updateReply(vo);
	}
	
	/**
	 * reply 삭제
	 */
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		if(vo.getParent_type()!=null&&vo.getParent_type().equals("EBOOK")){
			replyDao.deleteStarRating(vo);
		}
		replyDao.deleteReply(vo);
	}

	
	@Override
	public void addLikeIt(Like_itVO vo) throws Exception {
		// TODO Auto-generated method stub
		replyDao.addLikeIt(vo);
	}

	@Override
	public void deleteLikeIt(Like_itVO vo)throws Exception{
		// TODO Auto-generated method stub
		replyDao.deleteLikeIt(vo);
	}

	@Override
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.getLikeList(paramMap);
	}

	@Override
	public int getReplyCount(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.getReplyCount(vo);
	}
	
	
	

	

}
