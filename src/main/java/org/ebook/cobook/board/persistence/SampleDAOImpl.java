package org.ebook.cobook.board.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SampleDAOImpl {

	@Inject
	private SqlSession sqlSession;
	
	private String namespace="org.ebook.cobook.mapper.SampleMapper";
	
	public Map<String, Object> findNickName(Integer member_no)throws Exception{
		
		return sqlSession.selectOne(namespace+".findNickName", member_no);
	};
	
}
