package org.ebook.cobook.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.member.domain.MemberVO;
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
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value="/replies/*")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	private static final Logger logger =
			LoggerFactory.getLogger(ReplyController.class);
	
	/**
	 * 리플과 코멘트 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addReply", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addReply(@RequestBody ReplyVO vo) throws Exception{
		
		logger.info("댓글저장: " + vo.toString());
		ResponseEntity<String> entity = null;
		String result="";
		try{
			result = replyService.addReply(vo);
			entity = new ResponseEntity<>(result, HttpStatus.OK);

		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@RequestMapping(value="/addComment", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> addComent(@RequestBody ReplyVO vo) throws Exception{
		
		logger.info("댓글저장: " + vo.toString());
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
	/**
	 * 리플과 코멘트 리스트 뽑아오기
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/getReplyList", method = RequestMethod.GET )
	public ModelAndView getReplyList(ReplyVO vo, HttpSession session)
	{
		
		logger.info("리플리스트 불러오기: " + vo.toString());
		ModelAndView mav = new ModelAndView("replies/getReplyList");
		try {
			//좋아요 한지 안한지 체크하기 위해
			MemberVO mvo= (MemberVO) session.getAttribute("member");
			int member_no = 0;
			if(mvo!=null){//로그인된 상태
				member_no = mvo.getMember_no();
			}
			vo.setMember_no(member_no);
			
			List<ReplyVO> replyList =replyService.getReplyList(vo);
			mav.addObject("replyList",replyList );	 //리플 리스트
			mav.addObject("replyListCnt",replyService.getReplyCount(vo));	//리플 전체 리스트
			mav.addObject("moreCnt",vo.getMoreCnt());	//더보기 변수		
			mav.addObject("member_no", member_no);
			//서비스실행
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="/getCommentList", method = RequestMethod.GET)
	public ModelAndView getCommentList( ReplyVO rvo)
	{
		logger.info("리플리스트 불러오기: " + rvo.toString());
		ModelAndView mav = new ModelAndView("replies/getCommentList");
		try {
			mav.addObject("commentList", replyService.getCommentList(rvo));
			mav.addObject("parent_no", rvo.getParent_no());
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return mav;
	}
	
	/*@ResponseBody
	@RequestMapping(value="/{parent_type}/{board_no}/{page}/{perPageNum}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listAll(
			@PathVariable("parent_type") String parent_type,	//데이터에 넣지 않은것  예를 들면 페이지 이동시 바로 나올 수있는것
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
	}*/

	// 댓글수정(댓글 수정 필요한값 contents, reply_no) 
	/*@RequestMapping(value = "/{reply_no}", method = {RequestMethod.PUT, RequestMethod.PATCH})
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
	}*/
	
	/**
	 * reply 삭제
	 * @param rno
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno")Integer rno, @RequestBody ReplyVO rvo)throws Exception{
		ResponseEntity<String> entity = null;
		rvo.setReply_no(rno);
		try{
			replyService.deleteReply(rvo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	

	
	
	// 좋아요리스트에 해당 사용자가 등록햇으면 true값을 넣어준다
	/*public List<Map<String, Object>> test(Map<String, List<Map<String, Object>>> listMap){
		
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
	}*/
	
	
	
	
}
