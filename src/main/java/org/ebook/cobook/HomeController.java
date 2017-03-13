package org.ebook.cobook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/ajaxTest", method = RequestMethod.GET)
	public void ajaxTest(){
		
	}
	
	@RequestMapping(value="/editorCopy", method = RequestMethod.GET)
	public void editorCopy(){
		
	}
	
<<<<<<< HEAD
	@RequestMapping(value="/ebookList", method = RequestMethod.GET)
	public String ebooklist(){
		logger.info("Welcome home! ");
		return "ebooklist";	
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(){
		logger.info("Welcome home! ");
		return "viewer_jsp";	
	}
	
=======
	@RequestMapping(value="/hello", method = RequestMethod.GET)
	public void hello(String name, Model model)throws Exception{
		System.out.println("메서드 실행확인 name: " + name);
		logger.debug(name);
		model.addAttribute("greeting", name);
	}
	
	@RequestMapping(value="/hello", method = RequestMethod.POST)
	public String helloPOST()throws Exception{
		
		return "redirect:/editorCopy";
	}
	
	
>>>>>>> 7224330813ac2f75e9e51dbfce5c9ba08bf864f6
}
