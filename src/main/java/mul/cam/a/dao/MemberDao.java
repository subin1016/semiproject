package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.dto.WantDto;

public interface MemberDao {

	List<MemberDto> allMember();
	
	int idCheck(String id); // id 중복 확인 함수
	
	int addMember(MemberDto dto); // 회원 가입 함수
	
	MemberDto login(MemberDto dto); // 로그인 함수
	
	MemberDto findId(MemberDto dto); // id 찾기 함수
	
	MemberDto findPwd(MemberDto dto); // pwd 찾기 함수
	
	int addWant(WantDto dto);	// 찜추가하기
	
	int deleteWant(WantDto dto);	// 찜 삭제
	
	List<WantDto> getWant(String id);	// 내 찜 리스트 가져오기
	
	List<ScrapDto> getScrap(String id); // 스크랩 가져오기
	
	int deleteScrap(ScrapDto dto); // 스크랩 삭제
	
	int scrapcountdown(int seq);	// 스크랩 수 감소
	
	List<CommuDto> mybbslist(String id);	// 내가 쓴글 가져오기
	
	int updateMember(MemberDto dto);	// 내정보수정
	
	List<PaymentDto> getPay(String id);   // 결제내역 마이페이지에 연결
}
