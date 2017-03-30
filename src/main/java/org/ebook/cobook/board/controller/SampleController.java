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

	@RequestMapping(value = "/mList", method = RequestMethod.GET)
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

	@RequestMapping(value = "/mWrite", method = RequestMethod.GET)
	public String write(Model model, HttpSession session) throws Exception {

		Integer member_no = new Integer(3);
		session.setAttribute("login", member_no);
		model.addAttribute("nickname", sampleDAO.findNickName(member_no));
		return "/sample/board/mybookWrite";
	}

	@RequestMapping(value = "/mWrite", method = RequestMethod.POST)
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

		return "redirect:/sample/mList";
	}

	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWGET(Model model, HttpSession session) throws Exception {

		Integer member_no = new Integer(3);
		session.setAttribute("login", member_no);
		model.addAttribute("nickname", sampleDAO.findNickName(member_no));
		return "/sample/board/reviewWrite";
	}
	
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWPOST(ReviewVO reviewVO, FilesVO filesVO, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(reviewVO.toString());
		System.out.println("reviewVO : " + reviewVO.toString());
		System.out.println("filesVO : " + filesVO.toString());
		reviewService.writeReview(reviewVO, filesVO);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sample/mList";
	}

}
