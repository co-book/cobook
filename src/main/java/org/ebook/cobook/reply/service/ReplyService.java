package org.ebook.cobook.reply.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo) throws Exception;

	public List<Map<String, Object>> replyAndLike_itList(Map<String, Object> map) throws Exception;

	public void modifyReply(ReplyVO vo) throws Exception;

	public void removeReply(Integer rno) throws Exception;

	public void addComment(ReplyVO vo) throws Exception;

	public void addLike_it(Like_itVO vo) throws Exception;

	public void removeLike_it(Integer like_it_no) throws Exception;

}
