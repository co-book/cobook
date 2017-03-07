package org.ebook.cobook.controller;

import org.ebook.cobook.HomeController;
import org.junit.Before;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import utils.AbstractCommonConfTest;

// 컨트롤러를 이용해서 MockMvc객체를 생성하는 예제
public class TestController2 extends AbstractCommonConfTest{

	private MockMvc mockMvc;
	
	@Before
	public void setUp(){
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		
		// MockMvcBuilders.standaloneSetup() 메서드는 컨트롤러 객체를 전달받아
		// MockMvc객체를 생성하며 테스트 메서드는 전달받은 컨트롤러 객체만을
		// 테스트 대상으로 사용할 수 있다.
		mockMvc = MockMvcBuilders.standaloneSetup(new HomeController())
				.setViewResolvers(viewResolver)
				.build();
		
		
	}
	
}
