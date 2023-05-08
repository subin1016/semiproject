package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.CommuComment;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.CommuParam;
import mul.cam.a.dto.ScrapDto;

public interface CommuService {

	// 작성한 글이 등록 됐는지 여부를 boolean으로 반환하도록 함수 편집
	boolean writeBbs(CommuDto dto);
	
	// 게시판에 list들(글들)을 반환해주는 함수 -> BbsDao로부터 받아온 객체를 그대로 Controller로 넘겨주도록 할 예정
	List<CommuDto> bbslist(CommuParam bbs);
		
	// 총 글의 개수 반환
	int getAllBbs(CommuParam bbs);
	
	// 상세 글 보기
	CommuDto getBbs(int seq);
	
	// 상세 글 수정하기
	boolean updateBbs(CommuDto dto);
	
	// 상세 글 삭제하기
	boolean deleteBbs(CommuDto dto);
	
	// 조회수 증가
	boolean readCount(int seq);
	
	// 인기글 나열
	List<CommuDto> recommendList();
	
	// 최근글 나열
	List<CommuDto> recentList();
	
	// 댓글 작성하기
	boolean commentWrite(CommuComment bbs);
	
	// 댓글 나타내기
	List<CommuComment> commentList(int seq);
	
	// 추천수 증가
	boolean likeCount(int seq);
	
	// 스크랩 수 증가
	boolean scrapCount(int seq);
	
	// 스크랩 추가
	boolean scrapadd(ScrapDto dto);
}
