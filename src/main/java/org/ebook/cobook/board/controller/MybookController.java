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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/mybook/*")
public class MybookController {

	 private static final Logger logger = LoggerFactory.getLogger(MybookController.class);
	 private String uploadPath = "C:\\workspace\\cobook\\src\\main\\webapp\\resources\\summernote_upload";
			 
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
	
	// 게시물 리스트 = 닉네임 + 파일정보 + 게시물목록
	@RequestMapping(value="/mybookList", method = RequestMethod.GET)
	public String mybookList(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		logger.debug(cri.toString());
		logger.debug("mybookList 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mybookService.getCriCount(cri));
		
		List<Map<String, Object>> list = mybookService.getMybookList(cri);
		
		logger.debug("사이즈 : "+list.size());
		model.addAttribute("list", mybookService.getMybookList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("size", list.size());
		logger.debug("페이징: "+pageMaker.toString());
		return "mybook/mybookList";
	}
	
	// 게시물 읽어오기 file_no + fileurl + 게시물 정보
	@RequestMapping(value = "/single", method = RequestMethod.GET)
	  public void read(@RequestParam("mybook_no") int mybook_no, @ModelAttribute("cri") Criteria cri, Model model)
	      throws Exception {

		
	    model.addAttribute("mybookVO",mybookService.getMybookSingle(mybook_no));
	  }
	
	// 게시물을 삭제하면 다수의 파일이 일괄 삭제된다
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

	 // single페이지 요청
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	  public void modifyPagingGET(int mybook_no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

	    model.addAttribute("mybookVO",mybookService.getMybookSingle(mybook_no));
	  }

	  // 게시물 수정처리
	  // 한게시물의 그림파일을 전부 삭제하고 다시 넣어준다
	  // 주의 cover파일일경우 처리
	  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	  public String modifyPagingPOST(@ModelAttribute("mybookVO") MybookVO mybookVO, MultipartFile coverFile,
				@ModelAttribute("cri")Criteria cri,HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		  String[] files = req.getParameterValues("files");
		  FilesVO filesVO = new FilesVO();
		  filesVO.setFiles(files);
		  filesVO.setBook_no(mybookVO.getMybook_no());
		  filesVO.setBook_type("MYBOOK");

			String uploadedName = UploadFileUtils.uploadEditorFile(uploadPath, coverFile.getOriginalFilename(),
					coverFile.getBytes());
			logger.debug("업로드네임: " + uploadedName);
			filesVO.parsingFileData(uploadedName);
	    mybookService.modifyMybook(mybookVO, filesVO);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/mybook/list";
	  }

	  @RequestMapping(value = "/register", method = RequestMethod.GET)
		public String writeGET(Model model, HttpSession session) throws Exception {

			Integer member_no = new Integer(3);
			session.setAttribute("login", sampleDAO.findNickName(member_no));
			return "/mybook/mybookWrite";
		}

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
		}
	  
	  /*@RequestMapping("/getAttach/{bno}")
	  @ResponseBody
	  public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
	    
	    return mybookService.getAttach(bno);
	  } */
	  
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
