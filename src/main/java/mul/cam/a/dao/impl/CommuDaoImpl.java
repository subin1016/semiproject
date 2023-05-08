package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.CommuDao;
import mul.cam.a.dto.CommuComment;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.CommuParam;
import mul.cam.a.dto.ScrapDto;

@Repository
public class CommuDaoImpl implements CommuDao {

	@Autowired
	SqlSession session;
	
	// namespace
	String ns = "Bbs.";
	
	@Override // 글 쓰기
	public int writeBbs(CommuDto dto) {
		return session.insert(ns + "writeBbs", dto);
	}

	@Override // 게시판에 나타내줄 객체(list)
	public List<CommuDto> bbslist(CommuParam bbs) {
		return session.selectList(ns + "bbslist", bbs);
	}

	@Override // 글의 총 개수
	public int getAllBbs(CommuParam bbs) {
		return session.selectOne(ns + "getAllBbs", bbs);
	}
	
	@Override	// 상세 글 보기
	public CommuDto getBbs(int seq) {
		return session.selectOne(ns + "getBbs", seq);
	}
	
	@Override 	// 조회수 증가
	public int readCount(int seq) {
		return session.update(ns + "readcount", seq);
	}
	
	@Override   // 인기글
	public List<CommuDto> recommendList(){
		return session.selectList(ns + "recommendList");
	}
	
	@Override   // 최근글
	public List<CommuDto> recentList(){
		return session.selectList(ns + "recentList");
	}

	@Override	// 상세 글 수정하기
	public int updateBbs(CommuDto dto) {
		return session.update(ns + "updateBbs", dto);
	}
	
	@Override	// 상세 글 삭제하기
	public int deleteBbs(CommuDto dto) {
		return session.update(ns + "deleteBbs", dto);
	}

	@Override	// 댓글 작성하기
	public int commentWrite(CommuComment bbs) {
		return session.insert(ns + "commentWrite", bbs);
	}

	@Override	// 댓글 나타내기
	public List<CommuComment> commentList(int seq) {
		return session.selectList(ns + "commentList", seq);
	}

	@Override 	// 추천수 증가
	public int likeCount(int seq) {
		return session.update(ns + "likecount", seq);
	}


	@Override // 스크랩 수 증가
	public int scrapCount(int seq) {
		return session.update(ns + "scrapcount", seq);
	}

	@Override
	public int scrapAdd(ScrapDto dto) {
		return session.insert(ns + "scrapadd", dto);
	}
	
	
}
