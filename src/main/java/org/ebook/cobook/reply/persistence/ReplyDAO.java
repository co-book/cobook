package org.ebook.cobook.reply.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.domain.StarVO;

public interface ReplyDAO {
	//reply registered
	public void addReply(ReplyVO vo)throws Exception;
	public ReplyVO addReplyCheck(ReplyVO vo)throws Exception;
	public void addComment(ReplyVO vo)throws Exception;
	
	//star rating
	public void addStarRating(ReplyVO vo) throws Exception;
	public void deleteStarRating(ReplyVO vo) throws Exception;
	
	//replyList(commentList)
	public List<ReplyVO> getReplyList(ReplyVO vo)throws Exception;
	public List<ReplyVO> getCommentList(ReplyVO vo)throws Exception;
	
	
	public int getReplyCount(Map<String, Object> map)throws Exception;
	
	
	public void updateReply(ReplyVO vo)throws Exception;
	public void deleteReply(ReplyVO vo)throws Exception;
	
	public void addLikeIt(Like_itVO vo)throws Exception;
	public void deleteLikeIt(Like_itVO vo)throws Exception;
	
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception;
	
}
