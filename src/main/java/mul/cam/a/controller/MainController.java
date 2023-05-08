package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.Session;

import mul.cam.a.dto.CommuDto;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.ProductDto;
import mul.cam.a.dto.WantDto;
import mul.cam.a.service.MemberService;
import mul.cam.a.util.productUtil;

@Controller
public class MainController {
	
	@GetMapping(value = "main.do")
	public String main() {
		System.out.println("MainController main()" + new Date());
		
		return "main";
	}
	
	@GetMapping(value = "package.do")
	public String packagedo(String locid, String youtube, Model model) {
		System.out.println("MainController package()" + new Date());

		model.addAttribute("locid", locid);
		model.addAttribute("youtube", youtube);
		
		return "package";
	}
	
	@GetMapping(value = "packagelist.do")
	public String packagelist(String locid, Model model) {
		System.out.println("MainController packagelist()" + new Date());

		model.addAttribute("locid", locid);
		
		return "packagelist";
	}
		
	@GetMapping(value = "packagedetail.do")
	public String packagedetail(String locid, int seq, Model model) {
		System.out.println("MainController packagedetail()" + new Date());
		
		model.addAttribute("locid", locid);
		model.addAttribute("seq", seq);
		
		return "packagedetail";
	}
	
}
