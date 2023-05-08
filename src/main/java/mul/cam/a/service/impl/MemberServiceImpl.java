package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.dto.WantDto;
import mul.cam.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	// Dao 접근(생성)
	@Autowired 
	MemberDao dao; 
	
	@Override
	public List<MemberDto> allMember() {
		return dao.allMember();
	}

	@Override
	public boolean idCheck(String id) {
		// MemeberDaoImpl에서의 idCheck(String id)의 리턴값(int)을 받음
		int count = dao.idCheck(id);
		return count>0;	// count가 0보다 크면, 중복된 id가 이미 존재한다는 의미
	}

	@Override // 회원 가입
	public boolean addMember(MemberDto dto) {
		int count = dao.addMember(dto);
		return count>0; // count가 0보다 크면, 회원가입이 되었다는 의미
	}

	@Override // 로그인
	public MemberDto login(MemberDto dto) {
		return dao.login(dto); // 그대로 controller로 객체를 가져가겠다
	}

	@Override // id 찾기
	public MemberDto findId(MemberDto dto) {
		return dao.findId(dto);
	}
	
	@Override // pwd 찾기
	public MemberDto findPwd(MemberDto dto) {
		return dao.findPwd(dto);
	}

	@Override	// 찜 추가
	public boolean addWant(WantDto dto) {
		int count = dao.addWant(dto);
		return count>0;
	}

	@Override // 찜 가져오기
	public List<WantDto> getWant(String id) {
		return dao.getWant(id);
	}

	@Override	// 찜 삭제
	public boolean deleteWant(WantDto dto) {
		int count = dao.deleteWant(dto);
		return count>0;
	}

	@Override
	public List<ScrapDto> getScrap(String id) {
		return dao.getScrap(id);
	}

	@Override
	public boolean deleteScrap(ScrapDto dto) {
		int count = dao.deleteScrap(dto);
		return count>0;
	}

	@Override
	public boolean scrapcountdown(int seq) {
		int count = dao.scrapcountdown(seq);
		return count>0;
	}

	@Override
	public List<CommuDto> mybbslist(String id) {
		return dao.mybbslist(id);
	}

	@Override
	public boolean updateMember(MemberDto dto) {
		int count = dao.updateMember(dto);
		return count>0;
	}

	@Override // 결제 내역 마이페이지에 연결
	public List<PaymentDto> getPay(String id) {
		return dao.getPay(id);
	}
	
	
}
