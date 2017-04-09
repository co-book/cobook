package org.ebook.cobook.mypage.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "org.ebook.cobook.mapper.MypageMapper";
	
	@Override
	public List<Map<String, Object>> getMyBookReviewList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace+".getMyBookReviewList", paramMap);
	}

	@Override
	public List<Map<String, Object>> getUserMybookList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getUserMybookList", paramMap);
	}

	@Override
	public List<Map<String, Object>> getMyborrowList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getMyborrowList", paramMap);
	}

	
	
	
	
	
}
