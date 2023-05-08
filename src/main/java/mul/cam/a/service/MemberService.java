package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.dto.WantDto;

public interface MemberService {
	
	List<MemberDto> allMember();
	
	boolean idCheck(String id); // MemberDao에서의 idCheck(String id) 메서드를 편집하여 사용 -> 중복인지 아닌지를 boolean으로!
	
	boolean addMember(MemberDto dto); // MemberDao에서의 addMember(MemberDto dto) 메서드를 편집하여 사용 -> 회원가입이 성공했는지 안했는지를 boolean으로!

	MemberDto login(MemberDto dto); // 로그인 함수 (DB로부터 가져온 MemberDto 객체를 그대로 가지고 controller로 가기 위해 MemberDao에서와 동일하게 함수 사용)
	
	MemberDto findId(MemberDto dto); // id 찾기
	
	MemberDto findPwd(MemberDto dto); // pwd 찾기
	
	boolean addWant(WantDto dto);	// 찜하기

	List<WantDto> getWant(String id);	// 찜 리스트 가져오기
	
	boolean deleteWant(WantDto dto); 	// 찜삭제
	
	List<ScrapDto> getScrap(String id); // 스크랩 리스트 가져오기
	
	boolean deleteScrap(ScrapDto dto); // 스크랩 삭제하기
	
	boolean scrapcountdown(int seq);	// 스크랩 수 감소
	
	List<CommuDto> mybbslist(String id); // 내가쓴글 가져오기
	
	boolean updateMember(MemberDto dto);	// 내정보 수정하기
	
	List<PaymentDto> getPay(String id);   // 결제내역 마이페이지에 연결
}
