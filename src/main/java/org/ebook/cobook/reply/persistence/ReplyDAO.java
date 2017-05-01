package org.ebook.cobook.reply.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.domain.StarVO;

public interface ReplyDAO {
	//리플(코멘트)등록
	public void addReply(ReplyVO vo)throws Exception;
	public ReplyVO addReplyCheck(ReplyVO vo)throws Exception;
	public void addComment(ReplyVO vo)throws Exception;
	//star rating 별점 등록
	public void addStarRating(ReplyVO vo) throws Exception;
	
	//리플리스트(코멘트) 뽑기
	public List<ReplyVO> getReplyList(ReplyVO vo)throws Exception;
	public List<ReplyVO> getCommentList(ReplyVO vo)throws Exception;
	
	////
	public int getReplyCount(Map<String, Object> map)throws Exception;
	
	
	public void updateReply(ReplyVO vo)throws Exception;
	public void deleteReply(ReplyVO vo)throws Exception;
	
	public void addLikeIt(Like_itVO vo)throws Exception;
	public void deleteLikeIt(Like_itVO vo)throws Exception;
	
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception;
	
}
