package org.ebook.cobook.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board/review/*")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ReviewController.class);

	@RequestMapping(value="/review_write", method=RequestMethod.GET)
	public void writeGET(){
		
	}
	
	@RequestMapping(value="/review_write", method=RequestMethod.POST)
	public String writePOST(Model model, ReviewVO vo)throws Exception{
		
		logger.info("리뷰 작성기능 실행");
		logger.info(vo.toString());
		reviewService.writeReview(vo);
		return "redirect:/board/review/review_list";
	}
	
	@RequestMapping(value="/review_list", method=RequestMethod.GET)
	public void review_list(@ModelAttribute("cri")Criteria cri,
							 Model model)throws Exception{
		
		logger.info("list페이지호출");
		logger.info("cri: " + cri.toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));
		List<ReviewVO> list = reviewService.getBookReviewList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("displayFile", "http://localhost:8080/files/displayFile?fileName=");
		logger.info("리스트: "+list.toString());
	}
	
	
	
	
	
	
	
	
}
