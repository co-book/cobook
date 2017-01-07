package org.ebook.cobook.restful;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/ajax/*")
public class AjaxController {

	private static final Logger logger = 
			LoggerFactory.getLogger(AjaxController.class);
	
	@Inject
	private ReviewService reviewService;
	
	@RequestMapping(value="/borrowedBook/{member_no}")
	public ResponseEntity<List<Map<String, Object>>> borrowedBookList(@PathVariable("member_no")Integer member_no)throws Exception{
		
		logger.info("빌린책조회");
		logger.info("member_no: " + member_no);
		ResponseEntity<List<Map<String, Object>>> entity = null;
		try{
			entity = new ResponseEntity<>(reviewService.borrowBookList(member_no), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
