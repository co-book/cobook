package org.ebook.cobook.controller;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class DefaultValueTest extends AbstractCommonConfTest {

	private static final Logger logger = LoggerFactory.getLogger(DefaultValueTest.class);
	/*
	 * 특징 단위 테스트 Framework 중 하나 문자 혹은 GUI 기반으로 실행됨 단정문으로 테스트 케이스의 수행 결과를
	 * 판별함(assertEquals(예상 값, 실제 값)) 어노테이션으로 간결하게 지원함 결과는 성공(녹색), 실패(붉은색) 중 하나로
	 * 표시
	 */

	/*
	 * 대표적인 단정문 assertArrayEquals(a,b) : 배열 a와b가 일치함을 확인 assertEquals(a,b) : 객체
	 * a와b의 값이 같은지 확인 assertSame(a,b) : 객체 a와b가 같은 객체임을 확인 assertTrue(a) : a가
	 * 참인지 확인 assertNotNull(a) : a객체가 null이 아님을 확인 단정문 api
	 * http://junit.sourceforge.net/javadoc/org/junit/Assert.html
	 */

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		logger.debug("=====================================");
		logger.debug("시작하기전에 단 한번 실행되는 메소드");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		logger.debug("=====================================");
		logger.debug("단위테스트 함수들이 다 수행되고 맨 마지막에 수행"
				+ "단 한번 실행되는 메소드");
	}

	@Before
	public void setUp() throws Exception {
		logger.debug("=====================================");
		logger.debug("테스트 함수가 시작되기전 한번씩");
	}

	@After
	public void tearDown() throws Exception {
		logger.debug("=====================================");
		logger.debug("테스트 함수가 수행되고 마지막에 한번씩");
	}

	@Test
	public void add1() {
		// assertEquals(a,b) : 객체 a와b의 값이 같은지 확인
		assertEquals(30, sum(10, 20));
		logger.debug("add1()수행");
	}
	
	@Test
	public void add2() {
		// assertEquals(a,b) : 객체 a와b의 값이 같은지 확인
		assertEquals(30, sum(10, 20));
		logger.debug("add2()수행");
	}
	
	@Test
	public void add3() {
		// assertEquals(a,b) : 객체 a와b의 값이 같은지 확인
		assertEquals(30, sum(10, 20));
		logger.debug("add3()수행");
	}

	public int sum(int num1, int num2) {
		return num1 + num2;
	}

}
