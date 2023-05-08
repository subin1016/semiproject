package mul.cam.a.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.dto.WantDto;
import mul.cam.a.service.CommuService;
import mul.cam.a.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired  // 자동 생성 
	MemberService service; 
	
	@Autowired
	CommuService commu; 
	
	@GetMapping(value = "login.do")
	public String login() {
		System.out.println("MemberController login()" + new Date());
		
		return "login";   // login.jsp로 이동
	}
	
	@GetMapping(value = "logout.do")
	public String logout(HttpServletRequest req) {
		System.out.println("MemberController logout()" + new Date());
		HttpSession session = req.getSession();
        
        session.invalidate();
        
		return "main";   // login.jsp로 이동
	}
	
	@PostMapping(value = "loginAf.do")
	public String loginAf(MemberDto dto, Model model, HttpServletRequest req) {
		System.out.println("MemberController loginAf() " + new Date());
		MemberDto mem = service.login(dto);
		String msg = "";
		if(mem != null) {	// login 성공
			// login 시 세션에 저장
			// session을 사용하기 위해 HttpServletRequest req 매개변수를 추가하여 사용
			req.getSession().setAttribute("login", mem); // 세션명: login, 세션에 mem이 참조하는 객체 주소 저장
			req.getSession().setMaxInactiveInterval(60 * 60 * 4); // 세션 만료 시간 설정(4시간)
			
			msg = "LOGIN_OK";
		}else {				// login 실패
			msg = "LOGIN_FAIL";
		}
		model.addAttribute("login", msg); 
		
		return "message"; // message.jsp로 이동
	}
	
	
	@GetMapping(value = "regi.do")
	public String regi() {
		System.out.println("MemberController regi()" + new Date());
		
		return "regi";    // (회원가입).jsp로 이동
	}
	
	// id 중복 확인
	@ResponseBody 
	@PostMapping(value = "idcheck.do")
	public String idcheck(String id) { // ajax을 통해 id를 매개변수로 받음
		System.out.println("MemberController idcheck() " + new Date());
		
		// MemberServiceImpl의 idCheck(String id)의 리턴값(boolean)을 받음
		boolean isS = service.idCheck(id);
		if(isS) {	// 중복된 id가 이미 있음
			return "NO";
		}
		return "YES";	// 중복된 id가 없음
	}
	
	@PostMapping(value = "regiAf.do")
	public String regiAf(MemberDto dto, Model model) {
		System.out.println("MemberController regiAf() " + new Date());
		boolean isS = service.addMember(dto);
		String message = "";
		if(isS) {
			message = "MEMBER_ADD_YES"; // 회원 가입 성공
		} else {
			message = "MEMBER_ADD_NO";  // 회원 가입 실패
		}
		model.addAttribute("message", message); 
		
		return "message"; // message.jsp로 이동
	}
	
	
	@GetMapping(value = "find.do")
	public String find() {
		System.out.println("MemberController find()" + new Date());
	
		return "find";    // (아이디, 비밀번호 찾기).jsp로 이동
	}

	// id 찾기
	@ResponseBody 
	@PostMapping(value = "findId.do")
	public MemberDto findId(MemberDto dto) {
		System.out.println("MemberController findId() " + new Date());
		MemberDto mem = service.findId(dto);
		return mem;
	}
	
	// pwd 찾기
	@ResponseBody 
	@PostMapping(value = "findPwd.do")
	public MemberDto findPwd(MemberDto dto) {
		System.out.println("MemberController findPwd() " + new Date());
		MemberDto mem = service.findPwd(dto);
		return mem;
	}
	
	@PostMapping(value = "wantaddAf.do")
	public String wantaddAf(WantDto dto, Model model, HttpServletRequest req) {
		System.out.println("MemberController wantaddAf()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		dto.setId(login.getId());
		
		boolean isS = service.addWant(dto);
		
		model.addAttribute("locid", dto.getLocid());
		model.addAttribute("seq", dto.getSeq());
		
		return "redirect:/packagedetail.do"; // message.jsp로 이동
	}
	
	@GetMapping(value = "wantdelete.do")
	public String wantdelete(WantDto dto, Model model, HttpServletRequest req) {
		System.out.println("MemberController wantdelete()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		dto.setId(login.getId());
		
		boolean isS = service.deleteWant(dto);
		
		return "redirect:/mypagewant.do";
	}
	
	@GetMapping(value = "mypage.do")
	public String mypage(HttpServletRequest req, Model model) {
		System.out.println("MemberController mypage()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
        // 결제내역 마이페이지에 연결	
		List<PaymentDto> list = service.getPay(login.getId());
		
		model.addAttribute("list", list);
		
		return "mypage";
	}
		
	@GetMapping(value = "mypageinfo.do")
	public String mypageinfo(HttpServletRequest req, Model model) {
		System.out.println("MemberController mypageinfo()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		return "mypageinfo";
	}
	
	@GetMapping(value = "mypagewant.do")
	public String mypagewant(HttpServletRequest req, Model model) {
		System.out.println("MemberController mypagewant()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		List<WantDto> list = service.getWant(login.getId());
		
		model.addAttribute("list", list);
		
		return "mypagewant";
	}

	@GetMapping(value = "mypagescrap.do")
	public String mypagescrap(HttpServletRequest req, Model model) {
		System.out.println("MemberController mypagescrap()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		List<ScrapDto> list = service.getScrap(login.getId());
		
		List<CommuDto> scraplist = new ArrayList<>();
		
		for(ScrapDto scrap : list) {
			CommuDto dto = commu.getBbs(scrap.getSeq());
			scraplist.add(dto);
		}
		
		model.addAttribute("scraplist", scraplist);
		
		return "mypagescrap";
	}
	
	@GetMapping(value = "scrapdelete.do")
	public String scrapdelete(int seq, Model model, HttpServletRequest req) {
		System.out.println("MemberController scrapdelete()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		ScrapDto dto = new ScrapDto(login.getId(), seq);
		
		boolean isS = service.deleteScrap(dto);
		
		service.scrapcountdown(seq);
		
		return "redirect:/mypagescrap.do";
	}

	@GetMapping(value = "mypagemybbs.do")
	public String mypagemybbs(HttpServletRequest req, Model model) {
		System.out.println("MemberController mypagemybbs()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		List<CommuDto> mybbslist = service.mybbslist(login.getId());
		
		model.addAttribute("mybbslist", mybbslist);
		
		return "mypagemybbs";
	}

	@GetMapping(value = "infoupdate.do")
	public String infoupdate(HttpServletRequest req, Model model) {
		System.out.println("MemberController infoupdate()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		return "infoupdate";
	}
	
	@PostMapping(value = "infoupdateAf.do")
	public String infoupdateAf(MemberDto dto, Model model, HttpServletRequest req) {
		System.out.println("MemberController infoupdateAf() " + new Date());
		
		boolean isS = service.updateMember(dto);
		
		MemberDto mem = service.login(dto);
		req.getSession().setAttribute("login", mem);
		
		String message = "";
		if(isS) {
			message = "MEMBER_UPDATE_YES"; // 정보수정 성공
		} else {
			message = "MEMBER_UPDATE_NO";
		}
		model.addAttribute("updateMember", message); 
		
		return "message"; // message.jsp로 이동
	}
}
