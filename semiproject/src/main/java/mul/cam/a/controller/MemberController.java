package mul.cam.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping(value = "login.do")
	public String login() {
		
		return "login";
	}
	
	@GetMapping(value = "commumenu.do")
	public String commumenu() {
		
		return "commumenu";
	}
	
	@GetMapping(value = "packagedetail.do")
	public String packagedetail(String travel, Model model) {
		
		model.addAttribute("travel", travel);
		
		return "packagedetail";
	}
}
