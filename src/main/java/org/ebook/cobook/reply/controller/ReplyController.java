package org.ebook.cobook.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.service.ReplyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/replies/*")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	private static final Logger logger =
			LoggerFactory.getLogger(ReplyController.class);
	
	@RequestMapping(value="/", method = RequestMethod.POST)
	public ResponseEntity<String> registerPOST(@RequestBody ReplyVO vo) throws Exception{
		
		logger.info("댓글저장: " + vo.toString());
		ResponseEntity<String> entity = null;
		try{

			replyService.addReply(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/{parent_type}/{board_no}/{perPageNum}/{page}", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> listAll(
			@PathVariable("parent_type") String parent_type,
			@PathVariable("board_no") Integer board_no,
		    @PathVariable("page") Integer page,
			@PathVariable("perPageNum") Integer perPageNum)throws Exception{
		
		logger.info("리스트 호출");
		ResponseEntity<List<Map<String, Object>>> entity = null;
		logger.info("타입:"+parent_type);
		logger.info("게시물번호:"+board_no);
		logger.info("보여줄갯수:"+perPageNum);
		logger.info("페이지:"+page);
		try{
			
			Map<String, Object> map = new HashMap<>();
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);

			map.put("parent_type", parent_type);
			map.put("board_no", board_no);
			map.put("cri", cri);
			System.out.println("맵");
			System.out.println(map.toString());
			List<Map<String, Object>> list = replyService.replyAndLike_itList(map);
			logger.info("리스트값: "+list.toString());
			entity = new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> reply_modify(@PathVariable("rno") Integer rno,
			@RequestBody ReplyVO vo)throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			replyService.modifyReply(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> reply_delete(@PathVariable("rno")Integer rno)throws Exception{
		
		ResponseEntity<String> entity = null;
		try{
			replyService.removeReply(rno);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/comment", method = RequestMethod.POST)
	public ResponseEntity<String> reply_comment(@RequestBody ReplyVO vo)throws Exception{
		
		logger.info("댓글의 답글기능 호출");
		logger.info("답글: " + vo.toString());
		
		ResponseEntity<String> entity = null;
		try{
			replyService.addComment(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
}
