package org.ebook.cobook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utils.SpringTestConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringTestConfig
public class ReplyDAOTest {

	@Inject
	private ReplyDAO replyDAO;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ReplyDAOTest.class);
	
	
	// 댓글 추가
	@Test
	@Ignore
	public void addReply() throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setMember_no(1);
		vo.setParent_type("bookreview");
		vo.setBoard_no(1);
		vo.setContents("내용끝");
		
		replyDAO.insertReply(vo);
	}
	
	// 답글 추가
	@Test
	@Ignore
	public void addComment()throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setMember_no(2);
		vo.setParent_no(100);
		vo.setParent_type("bookreview");
		vo.setBoard_no(1);
		vo.setContents("답글내용");
		
		replyDAO.insertComment(vo);
	}
	
	// 수정
	@Test
	@Ignore
	public void updateReply() throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setReply_no(100);
		vo.setContents("100번 내용바꿈");
		
		replyDAO.updateReply(vo);
	}
	
	//삭제
	@Test
	@Ignore
	public void deleteReply()throws Exception{
		
		replyDAO.deleteReply(104);
	}
	
	// 검색
	@Test
	public void selectReply()throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(2);
		ReplyVO vo = new ReplyVO();
		vo.setBoard_no(1);
		vo.setParent_type("bookreview");
		Map<String, Object> map = new HashMap<>();
		map.put("bno", 1);
		map.put("cri", cri);
		map.put("vo", vo);
		List<Map<String, Object>> list= replyDAO.replyList(map);
		logger.info(list.toString());
		
	}
	
	//좋아요 추가
	@Test
	@Ignore
	public void addLike_it() throws Exception{
		
		Like_itVO vo = new Like_itVO();
		vo.setMember_no(1);
		vo.setReply_no(2);
		replyDAO.insertLike_it(vo);
		
		
	}
	
	// 삭제
	@Test
	@Ignore
	public void removeLike_it()throws Exception{
		
		replyDAO.deleteLike_it(101);
	}
	
	
}
