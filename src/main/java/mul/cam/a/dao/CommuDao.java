package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.CommuComment;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.CommuParam;
import mul.cam.a.dto.ScrapDto;

public interface CommuDao {
	
	// 글 쓰기
	int writeBbs(CommuDto dto);
	
	// 게시판에 list들(글들)을 반환해주는 함수
	List<CommuDto> bbslist(CommuParam bbs);
		
	// 총 글의 개수 반환
	int getAllBbs(CommuParam bbs);

	// 상세 글 보기
	CommuDto getBbs(int seq);
	
	// 상세 글 수정하기
	int updateBbs(CommuDto dto);
		
	// 상세 글 삭제하기
	int deleteBbs(CommuDto dto);
	
	// 조회수 증가
	int readCount(int seq);
	
	// 추천인 기준 인기글
	List<CommuDto> recommendList();
	
	// 최근글
	List<CommuDto> recentList();
	
	// 댓글 작성하기
	int commentWrite(CommuComment bbs);
	
	// 댓글 나타내기
	List<CommuComment> commentList(int seq);
	
	// 추천수 증가
	int likeCount(int seq);
	
	// 스크랩 수 증가
	int scrapCount(int seq);
	
	// 스크랩 추가
	int scrapAdd(ScrapDto dto);
	
	
}
