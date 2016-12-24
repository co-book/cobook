package org.ebook.cobook.reply.persistence;

import java.util.List;

import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyDAO {

	public void insert(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> listAll(Integer bno)throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void delete(Integer rno)throws Exception;
	
	public void comment(ReplyVO vo)throws Exception;
	
	public void update_reorder(ReplyVO vo)throws Exception;
	
	
	
}
