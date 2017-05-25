package org.ebook.cobook.reply.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.likeIt.domain.Like_itVO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.domain.StarVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	private final String namespace = "org.ebook.cobook.mapper.ReplyMapper";

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".addReply", vo);
	}
	
	@Override
	public void addComment(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".addComment", vo);
	}
	/**
	 * reply, comment 리스트 불러오기
	 */
	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		int offset = 0;	//어디서부터 뽑아올 것인가
		System.out.println("vo.limit"+vo.limit);
		System.out.println("vo.getMoreCnt()"+vo.getMoreCnt());
		
		int limit=(vo.limit*vo.getMoreCnt());
		RowBounds rowBounds = new RowBounds(offset,limit);	//mybatis에서 몇번째부터 몇번째까지 뽑아오는지 row를 관리해주는? 뭐 일

		System.out.println("offset"+offset);
		System.out.println("limit"+limit);

		return session.selectList(namespace+".getReplyList", vo ,rowBounds);
	}
	@Override
	public List<ReplyVO> getCommentList(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getCommentList", vo);
	}
	
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".updateReply", vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteReply", vo);
	}

	// 댓글 총 갯수
	@Override
	public int getReplyCount(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getReplyCount", vo);
	}
	
	//해당 사용자의 리플이 등록되어 있는지 확인
	@Override
	public ReplyVO addReplyCheck(ReplyVO vo) throws Exception {
	// TODO Auto-generated method stub
	return session.selectOne(namespace+".addReplyCheck", vo);
		}	
	
	//like
	@Override
	public void addLikeIt(Like_itVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".addLikeIt", vo);
	}

	@Override
	public void deleteLikeIt(Like_itVO vo)throws Exception{;
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteLikeIt", vo);
	}
	
	@Override
	public List<Map<String, Object>> getLikeList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getLikeList", paramMap);
	}
	
	
	//별점 등록
	@Override
	public void addStarRating(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".addStarRating", vo);
	}

	@Override
	public void deleteStarRating(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteStarRating", vo);
	}

	
	
	

}
