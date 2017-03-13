package org.ebook.cobook.mockEx;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import utils.AbstractCommonConfTest;

// MvcMock사용 하기
public class TestController extends AbstractCommonConfTest{

	// MvcMock객체를 생성하는 2가지방법
	// 1.WebApplicationContext를 이용해서 생성
	// 2.테스트 하려는 컨트롤러를 이용해서 생성
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp(){
		// MockMvcBuilders.webAppContextSetup() 메서드는 전달받은 
		// WebApplicationContext를 이용해서 MockMvc를 생성하는데
		// 이 경우 완전한 스프링 MVC환경을 이용 할 수 있다
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// mockMvc객체의 perform메서드는 파라미터로 전달한 RequestBuilder를
	// 이용해서 HttpServletRequest를 생성하고 DispatcherServlet을 실행한다
	// 이 과정에서 테스트하려는 컨트롤러나 스프링 mvc설정을 테스트 할 수 있다
	@Test
	public void testHello()throws Exception{
		// get()메서드는 스태틱메서드로 MockMvcRequestBuilders의 메서드이다
		mockMvc.perform(get("/").param("name", "bkchoi"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("serverTime"));
		// andExpert메서드는 컨트롤러가 생성한 응답을 확인한다.
		// 요청이 제대로오는지 또는 모델 이름이 serverTime인 값이 존재하는지 검사한다
	}
	
	
	
}
