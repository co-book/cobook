package org.ebook.cobook.ebook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.ebook.cobook.board.controller.ReviewController;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.service.EbookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/ebook/*")
public class EbookController {

	@Inject
	private EbookService ebookService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EbookController.class);
	
	@RequestMapping(value= "/getEbookList", method = RequestMethod.POST)
	public ResponseEntity<List<EbookVO>> getEbookList(Model model) throws Exception{
		logger.info("EBook List 호출");
		//Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
		//System.out.println(pathSet);	
	
		List<EbookVO> list = ebookService.getEbookList(model);
		model.addAttribute("list", list);
		
		logger.info("Ebook List : "+list.toString());
		
	    //HashMap<String, Object> hashmap = new HashMap<String, Object>();
	   // hashmap.put("EbookList", list);
	    
		ResponseEntity<List<EbookVO>> entity = null;
		try{
			entity=new ResponseEntity<>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}
	
	/*
	@RequestMapping(value= "/getEbookDetail", method = RequestMethod.GET)
	public void ebookDetail(Model model) throws Exception{
		logger.info("Ebook Detail 호출");
		//Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
		//System.out.println(pathSet);	
	
		List<EbookVO> list = ebookService.getEbookList(model);
		model.addAttribute("list", list);
		logger.info("Ebook Detail : ");
	}*/
	
	
	
	
	@RequestMapping(value= "/getEbookDetail", method = RequestMethod.GET)
	public void getEbookDetail(Model model) throws Exception{
		logger.info("getEbookDetail 호출");

	}
	
	// bookmark
	@RequestMapping(value= "/setBookMark", method = RequestMethod.GET)
	public void setBookMark(Model model) throws Exception{
		logger.info("setBookMark 호출");

	}
	
	@RequestMapping(value= "/getBookMark", method = RequestMethod.GET)
	public void getBookMark(Model model) throws Exception{
		logger.info("getBookMark 호출");

	}
	
}
