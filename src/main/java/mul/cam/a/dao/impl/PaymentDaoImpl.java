package mul.cam.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.PaymentDao;
import mul.cam.a.dto.PaymentDto;

@Repository   // 저장소 annotation
public class PaymentDaoImpl implements PaymentDao{

	// MyBatis 접근(생성)
	@Autowired
	SqlSession session;
	
	String ns = "Payment.";   // Payment.xml 파일 namespace
	
	@Override
	public int addPayment(PaymentDto dto) {
		return session.insert(ns + "addPayment", dto);
	}
}
