package org.ebook.cobook.likeIt.controller;

import javax.inject.Inject;

import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/likeIt/*")
public class LikeController {
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="/addLike", method = RequestMethod.POST)
	public ResponseEntity<String> addLike(@RequestBody Like_itVO vo)
	{
		
		ResponseEntity<String> entity = null;
		//vo.setMember_no(1);
		//System.out.println(vo.toString());
		try{
			replyService.addLikeIt(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/deleteLike", method = RequestMethod.POST)
	public ResponseEntity<String> deleteLike(@RequestBody Like_itVO vo)
	{
		
		ResponseEntity<String> entity = null;
		//vo.setMember_no(1);
		//System.out.println(vo.toString());

		try{
			
			replyService.deleteLikeIt(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
