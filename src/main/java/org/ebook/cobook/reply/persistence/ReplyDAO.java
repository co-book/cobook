package org.ebook.cobook.reply.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyDAO {

	public void insertReply(ReplyVO vo)throws Exception;
	
	public List<Map<String, Object>> replyList(Map<String, Object> map)throws Exception;
	
	// 댓글 총 갯수
	public int getReplyCount(ReplyVO vo)throws Exception;
	
	public void updateReply(ReplyVO vo)throws Exception;
	
	public void deleteReply(Integer rno)throws Exception;
	
	public void insertComment(ReplyVO vo)throws Exception;
	
	public void addLikeIt(Like_itVO vo)throws Exception;
	
	public void deleteLikeIt(Integer like_it_no)throws Exception;
	
	
}
