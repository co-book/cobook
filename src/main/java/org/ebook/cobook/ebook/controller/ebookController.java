package org.ebook.cobook.ebook.controller;

import org.ebook.cobook.board.controller.ReviewController;
import org.ebook.cobook.ebook.service.ebookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ebookController {

	ebookService ebookService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ebookController.class);
	
	@RequestMapping("/ebookList")
	public String list(Model mdoel){
		
		return "";
	}
}
