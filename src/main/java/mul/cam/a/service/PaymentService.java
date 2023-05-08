package mul.cam.a.service;

import mul.cam.a.dto.PaymentDto;

public interface PaymentService {

	boolean addPayment(PaymentDto dto);   // PaymentDao에서의 addPayment(PaymentDto dto) 메서드를 편집하여 사용 -> 회원가입이 성공했는지 안했는지를 boolean으로 반환
	
}
