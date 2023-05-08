package mul.cam.a.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mul.cam.a.dto.CommuComment;
import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.CommuParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.ScrapDto;
import mul.cam.a.service.CommuService;
import mul.cam.a.service.MemberService;
import mul.cam.a.util.CommuBbsUtil;

@Controller
public class CommuController {
	
	@Autowired  // 자동 생성 
	CommuService service; 
	
	@GetMapping(value = "commuhome.do")
	public String commuhome(Model model) {
		System.out.println("CommuController commuhome()" + new Date());
		
        // 인기글 리스트
        List<CommuDto> recommendList = service.recommendList();
        model.addAttribute("recommendList", recommendList);
        
        // 최근글 리스트
        List<CommuDto> recentList = service.recentList();
        model.addAttribute("recentList", recentList);
        
		
		return "commuhome";
	}
	
	@GetMapping(value = "commulist.do")
	public String commulist(CommuParam param, Model model) {
		System.out.println("CommuController commulist()" + new Date());
		
		// 페이지별로 나타나는 글 번호의 시작과 끝
		int pn = param.getPageNumber(); // 0 1 2 3 4 현재 페이지의 넘버(pagenumber)
		int start = 1 + (pn * 10);		// 1 11 21 31 41
		int end = (pn + 1) * 10;		// 10 20 30 40 50
		
		// 현재 페이지넘버에 따라 글 번호의 시작과 끝을 set 
		param.setStart(start);
		param.setEnd(end);
		
		List<CommuDto> list = service.bbslist(param); 
		
		// 페이지의 총 개수 구하기
		int len = service.getAllBbs(param);	// len(총 글의 개수)
		// pageBbs(총 페이지의 개수)
		int pageBbs = len / 10; // 페이지당 글을 10개씩 나타나게 하는 상황
		if(len % 10 > 0) {	// 나머지가 있으면 나머지 글들을 나타내 줄 페이지 1개 더 추가해준다.
			pageBbs += 1;
		}
		
		// 검색 항목 선택부분이나 검색어 입력 부분이 null이거나 빈칸일 경우 초기화!
		if(param.getChoice() == null || param.getChoice().equals("")
				|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		// 값을 넘겨줄 준비
		model.addAttribute("bbslist", list);	// 게시판 list 전체
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber());	// 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 선택한 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 입력한 검색어
		model.addAttribute("category", param.getCategory());	// 게시판 종류(카테고리)
		
		return "commulist";
	}
	
	@GetMapping(value = "commudetail.do")
	public String commudetail(int seq, HttpServletRequest req, Model model) {
		
		// login 체크 기능
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		// 조회수 증가
		service.readCount(seq);
		
		// seq에 따른 상세 글 정보를 담은 객체 생성
		CommuDto dto = service.getBbs(seq);
		

		model.addAttribute("bbsdto", dto);
		
		return "commudetail";
	}
	
	@GetMapping(value = "commuwrite.do")
	public String commuwrite(HttpServletRequest req, Model model) {
		System.out.println("CommuController commuwrite()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
		
		return "commuwrite"; // 글쓰기 화면으로 이동
	}
	
	// 글 작성완료 버튼 누른 후
	@PostMapping(value = "commuwriteAf.do")
	public String commuwriteAf(CommuDto dto, 
							   @RequestParam(value = "fileload", required = false)
							   MultipartFile fileload,
							   HttpServletRequest req, Model model) {
		System.out.println("CommuController commuwriteAf()" + new Date());
		
		// filename 취득
		String filename = fileload.getOriginalFilename();	// 원본의 파일명
		dto.setFilename(filename); // 원본 파일명을 DB에 넣는 것
		
		// upload의 경로 설정(위 매개변수 중 HttpServletRequest req을 통해서!)
		// server
		String fupload = "C:/springSamples/SpringsemiProject/src/main/webapp/upload";
		
		// 파일명을 충돌되지 않는 명칭으로 변경
		String newfilename = CommuBbsUtil.getNewFileName(filename);
		
		dto.setNewfilename(newfilename); // 변경된 파일명을 DB에 저장
		
		File file = new File(fupload + "/" + newfilename);	// 변경된 파일명으로 파일 생성할 준비
		boolean isS = true; // 변수 선언 및 초기화 -> true에 의미 없음
		try {
			// 실제로 파일이 생성 + 기입 => 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// DB에 저장
			isS = service.writeBbs(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String bbswrite = "";
		if(isS) {
			bbswrite = "BBS_ADD_OK"; // 글 추가 됐다!
		}
		else {
			bbswrite = "BBS_ADD_NG";
		}
		model.addAttribute("bbswrite", bbswrite);
		model.addAttribute("category", dto.getCategory());
		
		return "message";
	}
	
	// 파일 다운로드
	
	@GetMapping("/download")
    public ResponseEntity<Resource> download(String image, HttpServletRequest req) throws IOException {
		
		System.out.println("CommuController download()" + new Date());
		
		String fupload = req.getServletContext().getRealPath("/upload");
        Path path = Paths.get(fupload + image);
        //이 부분을 파일 이름을 받아와서 그 이름으로 DB에서 찾아올수 있도록 해야함


        String contentType = Files.probeContentType(path);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, contentType);

        Resource resource = new InputStreamResource(Files.newInputStream(path));
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }
	
	@PostMapping(value = "filedownLoad.do")	// 파일 다운로드 버튼 누른 후 controller로 이동한 지점
	public String filedownLoad(int seq, String filename, String newfilename, Model model, HttpServletRequest req,
			HttpServletResponse response) {
		
		// 경로 취득
		String fupload = req.getServletContext().getRealPath("/upload");	
		
		// 다운로드 받을 파일 보내줌
		File downloadFile = new File(fupload + "/" + newfilename);
	
		
		model.addAttribute("downloadFile", downloadFile);		// 실제 업로드되어 있는 파일명(file)	경로/32163541651.txt
		model.addAttribute("filename", filename);				// 원래 파일명(String)					abc.txt
		model.addAttribute("seq", seq);							// download 카운트를 증가시키기 위함(int) 				
		
		return "downloadView"; 		// file-context.xml의 DownloadView 객체 생성시 id값
	}
	
	// 댓글 작성하기
	// 댓글 작성 후 commudetail.do로 보낼 예정(seq를 함께 보내줘야 함)
	@PostMapping(value = "commentWriteAf.do")
	public String commentWriteAf(CommuComment com) {
		
		System.out.println("CommuController commentWriteAf()" + new Date());
		
		boolean isS = service.commentWrite(com);
		if(isS) {
			System.out.println("댓글작성에 성공했습니다");
		} else {
			System.out.println("댓글작성에 실패했습니다");
		}
		return "redirect:/commudetail.do?seq=" + com.getSeq();
	}
	
	// 댓글 나타내기(ajax 이용)
	@ResponseBody
	@GetMapping(value="commentList.do")
	public List<CommuComment> commentList(int seq){
		
		System.out.println("CommuController commentList()" + new Date());
		
		List<CommuComment> list = service.commentList(seq);
		return list;
	}
	
	// 글 수정
	@GetMapping(value = "commuupdate.do")
	public String commuupdate(Model model, int seq) {
		
		System.out.println("CommuController commuupdate()" + new Date());
		
		CommuDto dto = service.getBbs(seq);
		model.addAttribute("dto", dto);
		
		return "commuupdate"; 
	}
	// 글 수정 시 처리
	@GetMapping(value = "commuupdateAf.do")
	public String commuupdateAf(CommuDto dto, Model model) {
		
		System.out.println("CommuController commuupdateAf()" + new Date());
		
		boolean isS = service.updateBbs(dto);
		String bbsupdate = "";
		if(isS) {
			bbsupdate = "BBS_UPDATE_OK";
		}
		else {
			bbsupdate = "BBS_UPDATE_NG";
		}
		model.addAttribute("bbsupdate", bbsupdate);
		model.addAttribute("seq", dto.getSeq()); // 수정이 안됐을 때, 다시 수정할 수 있도록 글번호 값 가지고 이동
		
		return "message";
	}

	// 글 삭제
	@GetMapping(value = "commudelete.do")
	public String commudelete(CommuDto dto, Model model) {
		
		System.out.println("CommuController commudelete()" + new Date());
		
		boolean isS = service.deleteBbs(dto);
		String bbsdelete = "";
		if(isS) {
			bbsdelete = "BBS_DELETE_OK";
		}
		else {
			bbsdelete = "BBS_DELETE_NG";
		}
		model.addAttribute("bbsdelete", bbsdelete);
		
		return "message";
	}
	
	// 추천수 증가
	@GetMapping(value = "commulike.do")
	public String commulike(int seq) {
		
		System.out.println("CommuController commulike()" + new Date());

		service.likeCount(seq);
		return "redirect:/commudetail.do?seq=" + seq;
	}
	
	// 스크랩 증가
	@GetMapping(value = "commuscrap.do")
	public String commuscrap(int seq, HttpServletRequest req) {
		
		System.out.println("CommuController commuscrap()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		ScrapDto dto = new ScrapDto(login.getId(), seq); 
		
		service.scrapadd(dto);
		service.scrapCount(seq);
		
		return "redirect:/commudetail.do?seq=" + seq;
	}
	

	@RequestMapping(value = "sessionOut.do", method = RequestMethod.GET)
	public String sessionOut(Model model) {
		
		String sessionOut = "logout";
		
		model.addAttribute("sessionOut", sessionOut);
		
		return "message";
	}
	
	
	
	
	
	
	
	
}
