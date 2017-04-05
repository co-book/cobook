package org.ebook.cobook.board.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.persistence.SampleDAOImpl;
import org.ebook.cobook.board.service.MybookService;
import org.ebook.cobook.board.service.ReviewService;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.service.MemberService;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/sample/*")
public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	private String uploadPath = "C:\\workspace\\CoBook\\src\\main\\webapp\\resources\\summernote_upload";

	@Inject
	private ReviewService reviewService;

	@Inject
	private MybookService mybookService;

	@Inject
	private SampleDAOImpl sampleDAO;
	
	

	@RequestMapping(value = "/mybookList", method = RequestMethod.GET)
	public String testMybook(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.debug("mybookList 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mybookService.getCriCount(cri));

		List<Map<String, Object>> list = mybookService.getMybookList(cri);

		logger.debug("사이즈 : " + list.size());
		model.addAttribute("list", mybookService.getMybookList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("size", list.size());
		logger.debug("페이징: " + pageMaker.toString());
		return "/sample/board/mybookList";
	}

	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String mybookList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.debug("reviewList 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.getBookReviewCount(cri));

		List<Map<String, Object>> list = reviewService.getBookReviewList(cri);

		logger.debug("사이즈 : " + list.size());
		model.addAttribute("list", reviewService.getBookReviewList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("size", list.size());
		logger.debug(reviewService.getBookReviewList(cri).toString());
		return "/sample/board/reviewList";
	}
	
	
	@RequestMapping(value = "/mRegister", method = RequestMethod.GET)
	public String writeGET(Model model, HttpSession session) throws Exception {

		Integer member_no = new Integer(3);
		session.setAttribute("login", sampleDAO.findNickName(member_no));
		return "/sample/board/mybookWrite";
	}

	@RequestMapping(value = "/mRegister", method = RequestMethod.POST)
	public String mWrtiePOST(@ModelAttribute("mybookVO") MybookVO mybookVO, MultipartFile coverFile,
			HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		String[] files = req.getParameterValues("files");
		FilesVO filesVO = new FilesVO();
		filesVO.setFiles(files);

		String uploadedName = UploadFileUtils.uploadEditorFile(uploadPath, coverFile.getOriginalFilename(),
				coverFile.getBytes());
		logger.debug("업로드네임: " + uploadedName);
		filesVO.parsingFileData(uploadedName);
		mybookService.writeMybook(mybookVO, filesVO);
		logger.debug("regist post ...........");

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sample/mybookList";
	}

	@RequestMapping(value = "/Rregister", method = RequestMethod.GET)
	public String reviewWGET(Model model, HttpSession session) throws Exception {

		Integer member_no = new Integer(3);
		session.setAttribute("login", sampleDAO.findNickName(member_no));
		
		return "/sample/board/reviewWrite";
	}
	
	
	@RequestMapping(value = "/Rregister", method = RequestMethod.POST)
	public String reviewWPOST(HttpServletRequest req,ReviewVO reviewVO, FilesVO filesVO, RedirectAttributes rttr) throws Exception {

		logger.debug("regist post ...........");
		logger.debug("파일명 확인" + filesVO.toString());
		
		reviewService.writeReview(reviewVO, filesVO);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sample/reviewList";
	}
	
	@RequestMapping(value="/mSingle", method = RequestMethod.GET)
	public String mybookSingle(@RequestParam("mybook_no") int mybook_no, @ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setBoard_no(mybook_no);
		vo.setParent_type("MYBOOK");
		
		model.addAttribute("mybookVO",mybookService.getMybookSingle(mybook_no));
		model.addAttribute("REPLYCOUNT", mybookService.getReplyCount(vo));
		
		return "/sample/board/mybookSingle";
	}
	
	// 게시물을 삭제하면 다수의 파일이 일괄 삭제된다
		 @RequestMapping(value = "/MremovePage", method = RequestMethod.POST)
		  public String remove(@RequestParam("mybook_no") int mybook_no, Criteria cri, RedirectAttributes rttr) throws Exception {

			 FilesVO filesVO = new FilesVO();
			 filesVO.setBook_no(mybook_no);
			 filesVO.setBook_type("MYBOOK");
			 
		    mybookService.deleteMybook(mybook_no, filesVO);
		    
		    rttr.addAttribute("page", cri.getPage());
		    rttr.addAttribute("perPageNum", cri.getPerPageNum());
		    rttr.addAttribute("searchType", cri.getSearchType());
		    rttr.addAttribute("keyword", cri.getKeyword());

		    rttr.addFlashAttribute("msg", "SUCCESS");

		    return "redirect:/sample/mybookList";
		  }

		 
		 // single페이지 요청
		  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
		  public String modifyPagingGET(int mybook_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		    model.addAttribute("mybookVO", mybookService.getMybookSingle(mybook_no));
		    return "/sample/board/mybookModify";
		  }

		  // 게시물 수정처리
		  // 한게시물의 그림파일을 전부 삭제하고 다시 넣어준다
		  // 주의 cover파일일경우 처리
		  @RequestMapping(value = "/MmodifyPage", method = RequestMethod.POST)
		  public String modifyPagingPOST(@ModelAttribute("mybookVO") MybookVO mybookVO, MultipartFile coverFile,
					@ModelAttribute("cri")Criteria cri,HttpServletRequest req, RedirectAttributes rttr
					,FilesVO filesVO) throws Exception {

			  logger.debug("수정기능 실행");
			  String[] files = req.getParameterValues("files");
			  logger.debug("파일 input 확인 : "+files.toString());
			  filesVO.setFiles(files);
			  filesVO.setBook_no(mybookVO.getMybook_no());
			  filesVO.setBook_type("MYBOOK");
			  String uploadedName = filesVO.getFileurl();
			  logger.debug(coverFile.getOriginalFilename());
			 // 수정할시에 이미지파일 변경여부에 따라 분기함 
			  if(!coverFile.getOriginalFilename().equals("")){
				  logger.info("변경있음");
				uploadedName = UploadFileUtils.uploadEditorFile(uploadPath, coverFile.getOriginalFilename(),
						coverFile.getBytes());
			  }
			 
				filesVO.parsingFileData(uploadedName);
		    mybookService.modifyMybook(mybookVO, filesVO);

		    rttr.addAttribute("page", cri.getPage());
		    rttr.addAttribute("perPageNum", cri.getPerPageNum());
		    rttr.addAttribute("searchType", cri.getSearchType());
		    rttr.addAttribute("keyword", cri.getKeyword());

		    rttr.addFlashAttribute("msg", "SUCCESS");

		    logger.info(rttr.toString());

		    return "redirect:/sample/mSingle?mybook_no="+mybookVO.getMybook_no();
		  }
		  
		  @RequestMapping(value = "/Rsingle", method = RequestMethod.GET)
			public String read(@RequestParam("review_no") int review_no, @ModelAttribute("cri") Criteria cri,
					@RequestParam(value = "reply_no", required = false) Integer reply_no, Model model) throws Exception {

				ReplyVO vo = new ReplyVO();
				vo.setBoard_no(review_no);
				vo.setParent_type("BOOKREVIEW");
				model.addAttribute("reviewVO", reviewService.getReviewSingle(review_no));
				model.addAttribute("REPLYCOUNT", reviewService.getReplyCount(vo));
				model.addAttribute("reply_no", reply_no);
				
				return "/sample/board/reviewSingle";
			}
		  
			// single페이지 요청
			@RequestMapping(value = "/RmodifyPage", method = RequestMethod.GET)
			public String rModifyPagingGET(int review_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

				model.addAttribute("reviewVO",reviewService.getReviewSingle(review_no));
				
				return "/sample/board/reviewModify";
			}

			// 게시물 수정처리
			// 한게시물의 그림파일을 전부 삭제하고 다시 넣어준다
			// 주의 cover파일일경우 처리
			@RequestMapping(value = "/RmodifyPage", method = RequestMethod.POST)
			public String rModifyPagingPOST(ReviewVO reviewVO, Criteria cri, FilesVO filesVO, RedirectAttributes rttr)
					throws Exception {

				logger.info(cri.toString());
				filesVO.setBook_no(reviewVO.getReview_no());
				filesVO.setBook_type("BOOKREVIEW");
				logger.debug("수정호출");
				logger.debug("reviewVO : "+reviewVO.toString());
				logger.debug("filesVO : "+filesVO.toString());
				reviewService.modifyBookReview(reviewVO, filesVO);

				rttr.addAttribute("page", cri.getPage());
				rttr.addAttribute("perPageNum", cri.getPerPageNum());
				rttr.addAttribute("searchType", cri.getSearchType());
				rttr.addAttribute("keyword", cri.getKeyword());

				rttr.addFlashAttribute("msg", "SUCCESS");

				logger.info(rttr.toString());

				return "redirect:/sample/Rsingle?review_no="+reviewVO.getReview_no();
			}
		  
			// 리뷰
			// 게시물을 삭제하면 다수의 파일이 일괄 삭제된다
			@RequestMapping(value = "/bRremovePage", method = RequestMethod.POST)
			public String bRremove(@RequestParam("review_no") int review_no, Criteria cri, RedirectAttributes rttr)
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

				return "redirect:/sample/reviewList";
			}
}
