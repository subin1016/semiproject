package mul.cam.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired  // 자동 생성 
	PaymentService service; 
	
	@PostMapping(value = "payment.do")
	public String payment(Model model, HttpServletRequest req) {
		System.out.println("PaymentController payment()" + new Date());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/sessionOut.do";
		}
	
		return "payment";    // (결제).jsp로 이동
	}
	
	@PostMapping(value = "paymentAf.do")
	public String paymentAf(PaymentDto dto, Model model) {
		System.out.println("PaymentController paymentAf()" + new Date());
		
		boolean isS = service.addPayment(dto);
		String payment = "";
		if(isS) {
			payment = "PAYMENT_ADD_YES"; // 결제 내역 추가 성공
		} else {
			payment = "PAYMENT_ADD_NO";  // 결제 내역 추가 실패
		}
		model.addAttribute("payment", payment); 
	
		return "paymentAf";    // (결제 이후 화면).jsp로 이동
	}
}
