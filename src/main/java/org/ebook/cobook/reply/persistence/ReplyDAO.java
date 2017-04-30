package org.ebook.cobook.reply.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyDAO {

	public void addReply(ReplyVO vo)throws Exception;
	
	public List<Map<String, Object>> replyList(Map<String, Object> map)throws Exception;
	
	// 댓글 총 갯수
	public int getReplyCount(Map<String, Object> map)throws Exception;
	
	public void updateReply(ReplyVO vo)throws Exception;
	
	public void deleteReply(Integer rno)throws Exception;
	
	public void insertComment(ReplyVO vo)throws Exception;
	
	public void addLikeIt(Like_itVO vo)throws Exception;
	
	public void deleteLikeIt(Like_itVO vo)throws Exception;
	
	// 해당 사용자가 등록한 좋아요 리스트
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception;
	
}
