package org.ebook.cobook.mockEx;

import static org.hamcrest.Matchers.equalTo;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import utils.SpringTestConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringTestConfig // 메타 애노테이션 사용
public class ControllerRequestTest{

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	// Before어노테이션은 Test메서드가 실행되기전에
	// mockMvc를 매번 셋팅해줌
	@Before
	public void setUp(){
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	 // andDo(print())메서드는 ResultHandler의 구현 클래스인
		// ConsolePrintingResultHandler 객체를 리턴한다
		// ConsolePrintingResultHandler 클래스는 요청&응답 결과 내용을 콘솔에 출력한다
	@Test
	public void andDoPrint() throws Exception{
		
		mockMvc.perform(get("/hello").param("name", "game"))
			.andDo(print());
		
	}
	
	
	// 뷰검사
	@Test
	@Ignore
	public void viewRedirectTest() throws Exception{
		
		// 해당 메서드 지정된 뷰 이름 검사
		
		// view().name("해당 컨트롤러 메서드에 지정한 뷰이름")
		/*mockMvc.perform(get("/hello").param("name", "bkchoi"))
			  .andExpect(status().isOk())
			  .andExpect(view().name("hello"))
			  .andExpect(model().attributeExists("greeting"));*/
		
		// 리다이렉트 검사
		mockMvc.perform(post("/hello"))
					.andExpect(redirectedUrl("/editorCopy"));
	}
		
	// 모델 검증
	@Test
	@Ignore
	public void modelTest() throws Exception{
		
		// 모델 greeting키값 value 검사
		mockMvc.perform(get("/hello").param("name", "game"))
			.andExpect(model().attribute("greeting", "game"));
	}
	
	@Test
	@Ignore
	// 실행오류 jsonPath의 문제인거같음
	// 해결: jsonPath라이브러리 추가해야됨
	// json검증
	public void testJSON()throws Exception{
		
		// 모든 메서드는 MockHttpServletRequestBuilder를 다시 리턴한다
		// 메서드 체이닝 방식
		mockMvc.perform(post("/hello.json")
				.contentType(MediaType.APPLICATION_JSON)
				.content("{\"name\": \"최범균\"}")
				)
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.greeting", equalTo("안녕하세요, 최범균")));
	}
	
	// json 응답 검증
	// jsonPath()메서드가 사용하는 JSON 경로 표현식은
	// http://goessner.net/articles/JsonPath/ 에 정의되어 있는 표현식을 따른다
	@Test
	@Ignore
	public void jsonTest2()throws Exception{
		
		// jsonPath의 두 번째 인자는 JSON 경로에 해당하는 값을 비교할 때
		// 사용할 Matcher를 지정한다
		// org.hamcrest.Matchers.equalTo() 메서드 처럼 Hamcrest가
		// 제공하는 Matcher를 사용해서 값을 비교할 수 있다.
		// 에러남 ps.JSON은 그냥 Advanced REST client 써서 검사를 추천
		mockMvc.perform(post("/jsonTest")
						.contentType(MediaType.APPLICATION_JSON)
						.content("{\"title\": \"제목1\"}")
			)
			.andExpect(jsonPath("$.reviewVO[title]").value("제목1"));
		// jsonPath()메서드는 JsonPathResultMatchers객체를 리턴한다
	}
	
	// xml 응답 검증
	@Test
	@Ignore
	public void xmlTest()throws Exception{
	// xpath()메서드는 XpathResultMatchers 객체를 리턴한다	
    // andDo(print())메서드는 ResultHandler의 구현 클래스인
	// ConsolePrintingResultHandler 객체를 리턴한다
	// ConsolePrintingResultHandler 클래스는 요청&응답 결과 내용을 콘솔에 출력한다
		mockMvc.perform(get("/books.xml"))
			.andDo(print())
			.andExpect(xpath("/book-list/book[3]/title").string("제목3"))
			.andExpect(xpath("/book-list/book[3]/%s", "price").number(3000.0));
		
	}
}
