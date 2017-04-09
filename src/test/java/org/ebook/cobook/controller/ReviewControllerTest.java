package org.ebook.cobook.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import utils.AbstractCommonConfTest;

public class ReviewControllerTest extends AbstractCommonConfTest{

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	// Before어노테이션은 Test메서드가 실행되기전에
	// mockMvc를 매번 셋팅해줌
	@Before
	public void setUp(){
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).
				alwaysDo(MockMvcResultHandlers.print())
				.alwaysExpect(status().isOk())
				.build();
	}
	
	@Test
	public void testWriteGET() throws Exception {
		mockMvc.perform(get("/board/review/review_write"));
	}

	

}
