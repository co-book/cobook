package org.ebook.cobook.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.persistence.SampleDAOImpl;
import org.ebook.cobook.board.service.MybookService;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/mybook/*")
public class MybookController {

	 private static final Logger logger = LoggerFactory.getLogger(MybookController.class);
	 private String uploadPath = "C:\\workspace\\cobook\\src\\main\\webapp\\resources\\mybookCover";
			 
	@Inject
	private MybookService mybookService;
	
	@Inject
	private SampleDAOImpl sampleDAO;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String mybook(Criteria cri,Model model) {

		if(cri == null){
			cri = new Criteria();
		}
		logger.debug("페이지값확인 : " + cri.toString());
		logger.info("mybook");
		model.addAttribute("cri", cri);

		return "mybook";

	}
	
	/**
	 * 개인소설 뷰 page get
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView mybookList()throws Exception
	{
		ModelAndView mav = new ModelAndView("mybook/mybook");
	//	mav.addObject("mybookList", vo);
		return mav;
	}
	/**
	 * 전체나 더보기나 con으로 뽑는 리스트도 call
	 * @param con
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mybookAllList", method = RequestMethod.GET)
	public ModelAndView getMybookAllList(String con, MybookVO vo) throws Exception
	{	
		ModelAndView mav = new ModelAndView("mybook/mybookList");
		/*Map<String, Object> map =mybookService.getMybookAllList(con);
		mav.addObject("mybookList",map.get("mybookList"));
		mav.addObject("mybookListCount", map.get("mybookCount"));*/
		System.out.println(con+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		mav.addObject("mybook", mybookService.getMybookAllList(con, vo));
		mav.addObject("moreCnt", vo.getMoreCnt());
		mav.addObject("mybookCount", mybookService.getMybookAllCount(con));		
		return mav;
	}
	
	/**
	 * 마이북 작성 페이지- 로그인 여부 연결하기
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView mybookRegister(Model model, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("mybook/register");
		return mav;
	}
	
	/**
	 * 마이북 등록
	 * @param mybookVO
	 * @param coverFile
	 * @param req
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST, headers = "content-type=multipart/form-data")
	public ResponseEntity<String> mybookRegister(@ModelAttribute("mybookVO") MybookVO mybookVO, @RequestParam(value="coverFile") MultipartFile coverFile,
			HttpServletRequest req) throws Exception {

		/*String[] files = req.getParameterValues("files");
		FilesVO filesVO = new FilesVO();
		filesVO.setFiles(files);*/
		String  result= "false";
		try {
			String uploadedName = UploadFileUtils.uploadEditorFile(uploadPath, coverFile.getOriginalFilename(),
					coverFile.getBytes());
			mybookVO.setCoverUrl(uploadedName);
			mybookService.writeMybook(mybookVO);
			result = "true";
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//filesVO.parsingFileData(uploadedName);
		//rttr.addFlashAttribute("msg", "SUCCESS");
		
		ResponseEntity<String> entity = new ResponseEntity<>(result, HttpStatus.OK);
		return entity;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Deprecated
	@RequestMapping(value="/single", method = RequestMethod.GET)
	public String mybookSingle(@RequestParam("mybook_no") int mybook_no, @ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setBoard_no(mybook_no);
		vo.setParent_type("MYBOOK");
		
		model.addAttribute("mybookVO",mybookService.getMybookSingle(mybook_no));
		model.addAttribute("REPLYCOUNT", mybookService.getReplyCount(vo));
		
		return "/mybook/mybookSingle";
	}
	
	@Deprecated
	 @RequestMapping(value = "/removePage", method = RequestMethod.POST)
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

	    return "redirect:/mybook/list";
	  }

	@Deprecated
	 // single페이지 요청
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	  public String modifyPagingGET(int mybook_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

	    model.addAttribute("mybookVO",mybookService.getMybookSingle(mybook_no));
	    return "/mybook/modifyPage";
	  }

	  // 게시물 수정처리
	  // 한게시물의 그림파일을 전부 삭제하고 다시 넣어준다
	  // 주의 cover파일일경우 처리
	@Deprecated
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
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

	    return "redirect:/mybook/single?mybook_no="+mybookVO.getMybook_no();
	  }
	  
	/*@Deprecated
	  @RequestMapping(value = "/register", method = RequestMethod.GET)
		public String writeGET(Model model, HttpSession session) throws Exception {

			Integer member_no = new Integer(3);
			session.setAttribute("login", sampleDAO.findNickName(member_no));
			return "/mybook/register";
		}
	@Deprecated
	  @RequestMapping(value = "/register", method = RequestMethod.POST)
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

			return "redirect:/mybook/list";
		}*/
	@Deprecated
	  @RequestMapping(value="/getUserMybookList", method = RequestMethod.GET)
	  public String getMybookList(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		  // [세션]
		  Map<String, Object> paramMap = new HashMap<>();
		  paramMap.put("cri", cri);
		  paramMap.put("member_no", 2);
		  
		  model.addAttribute("mybookList", mybookService.getUserMybookList(paramMap));
		  
		  return "/mybook/list";
	  }
	  
}
