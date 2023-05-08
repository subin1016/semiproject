package mul.cam.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.PaymentDao;
import mul.cam.a.dto.PaymentDto;
import mul.cam.a.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService{

	// Dao 접근(생성)
	@Autowired
	PaymentDao dao;
	
	@Override
	public boolean addPayment(PaymentDto dto) {
		int count = dao.addPayment(dto);
		return count > 0;   // count가 0보다 크면 => 회원가입
	}
}
