package org.ebook.cobook.mypage.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.member.domain.MemberVO;
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

	/*@Override
	public List<Map<String, Object>> getMyborrowList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getMyborrowList", paramMap);
	}*/

	@Override
	public List<EbookVO> getMyborrowList(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		int offset = 0;
		if(vo.getMoreCnt()==1)
		{
			offset = 0;
		}else{
			offset = vo.limit*(vo.getMoreCnt()-1)+4;//0;	//어디서부터 뽑아올 것인가
		}
		System.out.println("vo.limit"+vo.limit);
		System.out.println("vo.getMoreCnt()"+vo.getMoreCnt());
		
		int limit=(vo.limit*vo.getMoreCnt()+4);
		RowBounds rowBounds = new RowBounds(offset,limit);	//mybatis에서 offset 부터 limit까지 뽑아오는..?

		System.out.println("offset"+offset);
		System.out.println("limit"+limit);

		return sqlSession.selectList(namespace+".getMyBorrowList", vo ,rowBounds);
	}

	@Override
	public int getMyBorrowCount(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getMyBorrowCount", vo);
		
	}
//8
//4
//4
	
	
	
	
}
