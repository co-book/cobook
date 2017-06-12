package org.ebook.cobook.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.service.ReviewService;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/review/*")
public class ReviewController {

	@Inject
	private ReviewService reviewService;

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	/**
	 * 글쓰기 페이지 
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String writeReview(Model model, HttpSession session) throws Exception {
		model.addAttribute("member" , session.getAttribute("member"));
		return "/review/register";
	}
	
	@RequestMapping(value="/register/getEbookList", method = RequestMethod.GET)
	public ModelAndView getMybookList(@RequestParam("search") String search)throws Exception
	{	
		System.out.println(search);
		System.out.println("--------------------------"+search+"-----------------------------");
		ModelAndView mav = new ModelAndView("/review/register/getEbookList");
		List<EbookVO> EbookList =reviewService.getEbookList(search);
		mav.addObject("EbookList", EbookList);

		System.out.println("--------------------------"+search+"-----------------------------");
		  return mav;
	  }
	
	
	
	
	@RequestMapping(value = "/Rregister", method = RequestMethod.POST)
	public String reviewWPOST(HttpServletRequest req,ReviewVO reviewVO, FilesVO filesVO, RedirectAttributes rttr) throws Exception {

		logger.debug("regist post ...........");
		logger.debug("파일명 확인" + filesVO.toString());
		
		reviewService.writeReview(reviewVO, filesVO);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sample/reviewList";
	}
	//////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String review(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		if(cri == null){
			cri = new Criteria();
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));
		
		logger.debug("페이지값확인 : " + cri.toString());
		logger.debug("pageMaker : " + pageMaker.toString());
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);

		return "review";
	}
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String review2(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		if(cri == null){
			cri = new Criteria();
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));
		
		logger.debug("페이지값확인 : " + cri.toString());
		logger.debug("pageMaker : " + pageMaker.toString());
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);

		return "review";
	}
	
	// 게시물 리스트 = 닉네임 + 파일정보 + 게시물목록

	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String mybookList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.debug("reviewList 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));

		//List<Map<String, Object>> reviewList = reviewService.getBookReviewList(cri);

		model.addAttribute("reviewList", reviewService.getBookReviewList(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		logger.debug(reviewService.getBookReviewList(cri).toString());
		return "review/reviewList";
	}

	// 인기순 리스트
	@RequestMapping(value = "/popularityList", method = RequestMethod.GET)
	public String popularityListGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.debug("reviewList 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));

		List<Map<String, Object>> list = reviewService.getReviewPopularity(cri);

		model.addAttribute("list", reviewService.getReviewPopularity(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/reviewList";
	}

	// 게시물 읽어오기 file_no + fileurl + 게시물 정보
	// 좋아요 top6 클릭해서 들어올경우에는 reply_no 값이 채워진다
	@RequestMapping(value = "/single", method = RequestMethod.GET)
	public void read(@RequestParam("review_no") int review_no, @ModelAttribute("cri") Criteria cri,
			@RequestParam(value = "reply_no", required = false) Integer reply_no, Model model) throws Exception {

		ReplyVO vo = new ReplyVO();
		vo.setBoard_no(review_no);
		vo.setParent_type("BOOKREVIEW");
		model.addAttribute("reviewVO", reviewService.getReviewSingle(review_no));
		model.addAttribute("REPLYCOUNT", reviewService.getReplyCount(vo));
		model.addAttribute("reply_no", reply_no);
	}

	// 게시물을 삭제하면 다수의 파일이 일괄 삭제된다
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("review_no") int review_no, Criteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.debug("게시물 삭제 호출");
		FilesVO filesVO = new FilesVO();
		filesVO.setBook_no(review_no);
		filesVO.setBook_type("BOOKREVIEW");
		reviewService.deleteReview(review_no, filesVO);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/review/list";
	}

	// single페이지 요청
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int review_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		model.addAttribute(reviewService.getReviewSingle(review_no));
	}

	// 게시물 수정처리
	// 한게시물의 그림파일을 전부 삭제하고 다시 넣어준다
	// 주의 cover파일일경우 처리
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(ReviewVO reviewVO, Criteria cri, FilesVO filesVO, RedirectAttributes rttr)
			throws Exception {

		logger.info(cri.toString());
		filesVO.setBook_no(reviewVO.getReview_no());
		filesVO.setBook_type("REVIEW");
		reviewService.modifyBookReview(reviewVO, filesVO);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/sboard/list";
	}

/*	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {

		logger.info("regist get ...........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(ReviewVO reviewVO, FilesVO filesVO, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(reviewVO.toString());
		System.out.println("reviewVO : " + reviewVO.toString());
		reviewService.writeReview(reviewVO, filesVO);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sboard/list";
	}
*/
	// 최신 리뷰 - 최신에 쓰여진 리뷰(책이름 , 리뷰 제목 )

	@RequestMapping(value = "/lastedReviewList", method = RequestMethod.GET)

	public void lastedReviewList(Model model) throws Exception {

		logger.info("lastedReviewList");
		model.addAttribute("list", reviewService.getlastedReviewList());

	}

	// 좋아요 순 댓글 top6
	// r.reply_no, r.board_no, r.contents, m.nickname, likeCount
	@RequestMapping(value = "/bestReply", method = RequestMethod.GET)

	public String bestReply(Model model) {

		logger.info("bestReply");
		model.addAttribute("replies", reviewService.getBestReply());

		return "review/bestReply";

	}

	// 사용자가 읽은 후기리스트 요청 모델값 reviewList
	@RequestMapping(value = "/getMybookReviews", method = RequestMethod.GET)
	public String getMyBookReviewList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		// [세션]
		Map<String, Object> paramMap = new HashMap<>();

		// 파라미터 값 셋팅
		paramMap.put("cri", cri);
		paramMap.put("member_no", 3);

		model.addAttribute("reviewList", reviewService.getMyBookReviewList(paramMap));

		return "/mybook/???";
	}

	// 같은 사용자 다른 리뷰
	@RequestMapping(value="/getSameWriterOtherReviews", method = RequestMethod.GET)
	public String getOtherReviews(int member_no, Model model)throws Exception{
		logger.debug("같은작성자 다른 책 호출");
		model.addAttribute("list", reviewService.getSameWriterOtherReviews(member_no));
		return "/review/sameWriterOtherReviews";
	}
	
	// same ebook other reviews
	@RequestMapping(value="/getSameBookOtherReviews", method = RequestMethod.GET)
	public String getOtherReviewsGET(int ebook_no, Model model)throws Exception{
		logger.debug("같은책 다른 리뷰");
		model.addAttribute("list", reviewService.getSameBookOtherReviews(ebook_no));
		
		return "/review/sameBookOtherReviews";
	}
	
	
	
	
	
}
