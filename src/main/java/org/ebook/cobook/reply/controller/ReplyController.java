package org.ebook.cobook.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.likeIt.domain.Like_itVO;
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
	
	//댓글 등록
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
	
	//댓글 리스트 뽑아오기
	@ResponseBody
	@RequestMapping(value="/{parent_type}/{board_no}/{page}/{perPageNum}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listAll(
			@PathVariable("parent_type") String parent_type,
			@PathVariable("board_no") Integer board_no,
		    @PathVariable("page") Integer page,
			@PathVariable("perPageNum") Integer perPageNum)throws Exception{
	
		// 리스트 실행에 필요한 파라미터 cri, parent_type, board_no
		logger.info("리스트 호출");
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, List<Map<String, Object>>> listMap = new HashMap<>();
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		try{
			
			// 페이징처리를 위한 객체를 셋팅 cri.setPage && pageMaker.setCri
			Criteria cri = new Criteria();
			PageMaker pageMaker = new PageMaker();
			cri.setPage(page);
			cri.setPerPageNum(perPageNum);
		
			// 메서드 실행(3개)에 필요한 파라미터값을 셋팅 
			paramMap.put("parent_type", parent_type);
			paramMap.put("board_no", board_no);
			paramMap.put("cri", cri);
			//[세션] 원래 세션에서 member_no를 꺼내와야하지만 테스트용도 값설정
			paramMap.put("member_no", 1);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(replyService.getReplyCount(paramMap));

			System.out.println("맵");
			System.out.println(paramMap.toString());
		// 리플 리스트 + 사용자가 등록한 좋아요 리스트를 map에 저장
			listMap.put("replyList",replyService.replyAndLike_itList(paramMap));
			listMap.put("userLikeList", replyService.getLikeList(paramMap));
			listMap.put("replyList", test(listMap));
			
		// 화면에 보여줄 데이터(페이징처리객체, listMap)를 resultMap 담음 
			resultMap.put("pageMaker", pageMaker);
			resultMap.put("listMap", listMap);
			
			logger.debug(resultMap.toString());
			entity = new ResponseEntity<>(resultMap, HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	// 댓글수정(댓글 수정 필요한값 contents, reply_no) 
	@RequestMapping(value = "/{reply_no}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> reply_modify(@PathVariable("reply_no") Integer reply_no,
			@RequestBody ReplyVO vo)throws Exception{
		logger.debug("댓글 수정호출");
		
		vo.setReply_no(reply_no);
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
	
	//댓글 삭제
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
	
	//댓글의 자식 코멘트
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
	
	//좋아요 추가
	@RequestMapping(value="/addLike", method = RequestMethod.POST)
	public ResponseEntity<String> addLike(@RequestBody Like_itVO vo){
		
		ResponseEntity<String> entity = null;
		vo.setMember_no(1);
		System.out.println(vo.toString());
		try{
			replyService.addLikeIt(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//좋아요 삭제
	@RequestMapping(value="/deleteLike", method = RequestMethod.POST)
	public ResponseEntity<String> deleteLike(@RequestBody Like_itVO vo){
		
		ResponseEntity<String> entity = null;
		vo.setMember_no(1);
		System.out.println(vo.toString());

		try{
			
			replyService.deleteLikeIt(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	// 좋아요리스트에 해당 사용자가 등록햇으면 true값을 넣어준다
	public List<Map<String, Object>> test(Map<String, List<Map<String, Object>>> listMap){
		
		List<Map<String, Object>> replyList = listMap.get("replyList");
		List<Map<String, Object>> likeList = listMap.get("userLikeList");
		for(int i = 0; i < replyList.size(); i++){
			
			replyList.get(i).put("isLike", "0");
			for(int j = 0; j < likeList.size(); j++){
				
				if(replyList.get(i).get("REPLY_NO").equals(likeList.get(j).get("REPLY_NO"))){
					
					replyList.get(i).put("isLike", "1");
					logger.debug("사용자가 등록한 리플: "+replyList.get(i).get("REPLY_NO"));
				}
			}
			
		}
		
		return replyList;
	}
	
}
