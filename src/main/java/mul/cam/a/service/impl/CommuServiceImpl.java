package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.CommuDao;
import mul.cam.a.dto.CommuComment;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.CommuParam;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.service.CommuService;

@Service
public class CommuServiceImpl implements CommuService {
	
	@Autowired
	CommuDao dao;

	@Override // 글 쓰기
	public boolean writeBbs(CommuDto dto) {
		int n = dao.writeBbs(dto); // 작성된 글이 추가됐으면 n이 0보다 크다.
		return n>0;
	}

	@Override // 게시판에 list들(글들)을 반환해주는 함수
	public List<CommuDto> bbslist(CommuParam bbs) {
		return dao.bbslist(bbs);
	}

	@Override // 총 글의 개수 반환
	public int getAllBbs(CommuParam bbs) {
		return dao.getAllBbs(bbs);
	}
	
	@Override // 상세 글 보기
	public CommuDto getBbs(int seq) {
		return dao.getBbs(seq); 
	}

	@Override // 조회수 증가
	public boolean readCount(int seq) {
		int n = dao.readCount(seq);
		return n>0;
	}
	
	@Override // 인기글 나열
	public List<CommuDto> recommendList (){
		return dao.recommendList();
	}
	
	@Override // 최근글 나열
	public List<CommuDto> recentList (){
		return dao.recentList();
	}

	@Override	// 상세 글 수정하기
	public boolean updateBbs(CommuDto dto) {
		int n = dao.updateBbs(dto);
		return n>0;
	}
	
	@Override	// 상세 글 삭제하기
	public boolean deleteBbs(CommuDto dto) {
		int n = dao.deleteBbs(dto);
		return n>0;
	}

	@Override // 댓글 작성하기
	public boolean commentWrite(CommuComment bbs) {
		int n = dao.commentWrite(bbs);
		return n>0;
	}

	@Override // 댓글 나타내기
	public List<CommuComment> commentList(int seq) {
		return dao.commentList(seq);
	}

	@Override // 추천수 증가
	public boolean likeCount(int seq) {
		int n = dao.likeCount(seq);
		return n>0;
	}

	@Override // 스크랩 수 증가
	public boolean scrapCount(int seq) {
		int n = dao.scrapCount(seq);
		return n>0;
	}

	@Override
	public boolean scrapadd(ScrapDto dto) {
		int n = dao.scrapAdd(dto);
		return n>0;
	}
	
	
}
