package org.ebook.cobook;

import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import org.ebook.cobook.board.domain.ReviewVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Book;
import domain.BookList;
import domain.Greeting;
import domain.Name;


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
	
	@RequestMapping("/hello.json")
	@ResponseBody
	public Greeting greetingJson(@RequestBody Name name) {
		return new Greeting("안녕하세요, " + name.getName(), name);
	}
	
	@RequestMapping(value="/jsonTest", method = RequestMethod.POST)
	@ResponseBody
	public ReviewVO jsonTest(@RequestBody ReviewVO reviewVO){
	
		logger.debug("reviewVO 값확인: " + reviewVO.toString());
		return reviewVO;
	}
	
	@RequestMapping(value = "/books.xml", produces = "application/xml; charset=utf-8")
	@ResponseBody
	public BookList booksXml() {
		return createBookList();
	}

	private Book books(String title, int price, String isbn) {
		return new Book(title, price, isbn);
	}
	
	private BookList createBookList() {
		return new BookList(Arrays.asList(
				books("제목1", 1000, "000000"),
				books("제목2", 2000, "000001"),
				books("제목3", 3000, "000004")
				));
	}
}
