package org.ebook.cobook.board.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.persistence.SampleDAOImpl;
import org.ebook.cobook.board.service.MybookService;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/sample/*")
public class SampleController {

	 private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
		
		@Inject
		private MybookService mybookService;
		
		@Inject
		private SampleDAOImpl sampleDAO;
		
		@RequestMapping(value="/mList", method = RequestMethod.GET)
		public String testMybook(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
			
			logger.debug("mybookList 호출");
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(mybookService.getCriCount(cri));
			
			List<Map<String, Object>> list = mybookService.getMybookList(cri);
			
			logger.debug("사이즈 : "+list.size());
			model.addAttribute("list", mybookService.getMybookList(cri));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("size", list.size());
			
			return "/sample/board/mybookList";
		}
		
		@RequestMapping(value="/mWrite", method = RequestMethod.GET)
		public String write(Model model, HttpSession session)throws Exception{
			
			Integer member_no = new Integer(3);
			session.setAttribute("login", member_no);
			model.addAttribute("nickname", sampleDAO.findNickName(member_no));
			return "/sample/board/mybookWrite";
		}
		
		@RequestMapping(value="/mWrite", method = RequestMethod.POST)
		public void writePOST(MultipartFile file)throws Exception{
			
			System.out.println("체크");
			logger.debug("파일 변수:"+file.getName());
			logger.debug("파일 원본이름: " + file.getOriginalFilename());
			logger.debug(""+file.getBytes());
		}
	
}
