package org.ebook.cobook.reply.service;

import java.util.List;

import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReplyService {

public void register(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> listAll(Integer bno)throws Exception;
	
	public void modify(ReplyVO vo)throws Exception;
	
	public void remove(Integer rno)throws Exception;
	
	public void comment(ReplyVO vo)throws Exception;
	
	
}
