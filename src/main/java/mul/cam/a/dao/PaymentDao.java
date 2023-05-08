package mul.cam.a.dao;

import mul.cam.a.dto.PaymentDto;

public interface PaymentDao {

	int addPayment(PaymentDto dto); // 결제 내역 추가 함수
	
}
