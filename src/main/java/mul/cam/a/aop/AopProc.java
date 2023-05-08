package mul.cam.a.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mul.cam.a.dto.MemberDto;

/*
	AOP(Aspect Oriented Programming)
	목적: 감시자
*/
@Aspect
public class AopProc {
	
	// log 출력과 session 검사 
	
	@Around("within(mul.cam.a.session.*)") // view에서 controller로 이동할 때, 신호를 받는다. -> controller 검사!!
//	@Around("within(mul.cam.a.controller.*) or within(mul.cam.a.dao.*.*)") // controller, dao 모두 검사!!
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		
		// session check
		/*
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(); // HttpServletRequest의 객체를 생성하고 참조
		if(request != null) {
			HttpSession session = request.getSession(); // session을 얻어옴
			MemberDto login = (MemberDto)session.getAttribute("login"); // MemberController에서 세션명이 login!
			if(login == null) {	// session이 만료된 상태
				return "redirect:/sessionOut.do";	// AOP가 controller에 있기 때문에 sendRedirect를 통해 controller로 이동해야 하고, 이 부분이 redirect
//				return "sessionOut.do"; 라고 작성할 수 없다. 왜냐하면 이 결과는 sessionOut.do.jsp로 이동하는 것이기 때문이다.
				// 만약, 단순 이동이 아닌 값을 함께 가지고 이동하는 경우에는 return "forward:/bbslist.do";와 같이 사용해야 한다.
				
			}
		}
		*/
		
		
		// logger
		String signatureStr = joinpoint.getSignature().toShortString();  // signatureStr -> controller에서 어떤 메서드가 실행됐는지
		
		try {
			Object obj = joinpoint.proceed();	// controller 내에서 실행시, 
			
			System.out.println("AOP log: " + signatureStr + " 메서드 실행 " + new Date());
			
			return obj;
		} finally {
//			System.out.println("실행 후: " + System.currentTimeMillis());
		}
		
	}
	
	
	
}
