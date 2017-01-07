package org.ebook.cobook.board.controller;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.BoardVO;
import org.ebook.cobook.board.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {

	private static Logger logger =
			LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writePOST(BoardVO board, RedirectAttributes rttr){
		
		System.out.println(board.toString());
		service.register(board);
		
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void listAll(Model model){
		
		model.addAttribute("list", service.listAll());
		
	}
	
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("bno") int bno, Model model){
		
		model.addAttribute("boardVO", service.read(bno));
	}
	
	
	
}
