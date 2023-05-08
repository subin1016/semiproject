package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.dto.WantDto;

@Repository // 저장소
public class MemberDaoImpl implements MemberDao {

	// MyBatis 접근(생성)
	@Autowired 
	SqlSession session;

	String ns = "Member."; // Member.xml 파일의 namespace

	@Override
	public List<MemberDto> allMember() {
		return session.selectList(ns + "allMember");
	}

	@Override // id 중복 확인
	public int idCheck(String id) {
		return session.selectOne(ns + "idcheck", id); // (namespace.쿼리문id, 파라미터)
	}

	@Override // 회원 가입
	public int addMember(MemberDto dto) {
		return session.insert(ns + "addmember", dto); 
	}

	@Override // 로그인
	public MemberDto login(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "login", dto);
		return mem;
	}

	@Override // id 찾기
	public MemberDto findId(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "findId", dto);
		return mem;
	}

	@Override // pwd 찾기
	public MemberDto findPwd(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "findPwd", dto);
		return mem;
	}

	@Override	// 찜추가
	public int addWant(WantDto dto) {
		return session.insert(ns + "addWant", dto);
	}
	
	@Override	// 찜 리스트 가져오기
	public List<WantDto> getWant(String id) {
		return session.selectList(ns + "getWant", id);
	}

	@Override	// 찜 삭제
	public int deleteWant(WantDto dto) {
		return session.delete(ns + "deleteWant", dto);
	}

	@Override // 스크랩 한 글 가져오기
	public List<ScrapDto> getScrap(String id) {
		return session.selectList(ns + "getScrap", id);
	}

	@Override // 스크랩 삭제
	public int deleteScrap(ScrapDto dto) {
		return session.delete(ns + "deleteScrap", dto);
	}

	@Override // 스크랩수 감소
	public int scrapcountdown(int seq) {
		return session.update(ns + "scrapcountdown", seq);
	}

	@Override // 내가쓴글 가져오기
	public List<CommuDto> mybbslist(String id) {
		return session.selectList(ns + "mybbslist", id);
	}

	@Override // 내 정보 수정
	public int updateMember(MemberDto dto) {
		return session.update(ns + "updateMember", dto);
	}

	@Override	// 결제내역 마이페이지에 연결
	public List<PaymentDto> getPay(String id) {
		return session.selectList(ns + "getPay", id);
	}
	
	
	
}
