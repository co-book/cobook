package org.ebook.cobook.reply.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyService {

	public String addReply(ReplyVO vo) throws Exception;

	public List<Map<String, Object>> replyAndLike_itList(Map<String, Object> map) throws Exception;

	public void modifyReply(ReplyVO vo) throws Exception;

	public void removeReply(Integer rno) throws Exception;

	public void addComment(ReplyVO vo) throws Exception;

	public void addLikeIt(Like_itVO vo) throws Exception;

	public void deleteLikeIt(Like_itVO vo)throws Exception;
	
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception;
	
	public int getReplyCount(Map<String, Object> map)throws Exception;
}
