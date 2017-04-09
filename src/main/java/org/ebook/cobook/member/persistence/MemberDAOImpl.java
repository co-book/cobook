package org.ebook.cobook.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.member.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private final String namespace = "org.ebook.cobook.mapper.MemberMapper";
	
	@Override
	public void joinMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".joinMember", vo);
	}
	
	@Override
	public MemberVO getMember(MemberVO vo)throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getMember", vo);
	}

	@Override
	public MemberVO getEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getEmail", email);
	}

	public void modifyMember(MemberVO vo){
		
		sqlSession.update(namespace+".modifyMember", vo);
	}
	
	
	
	
}
