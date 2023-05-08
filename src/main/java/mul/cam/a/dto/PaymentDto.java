package mul.cam.a.dto;

import java.io.Serializable;

public class PaymentDto implements Serializable{

	private String locid;
	private int seq;
	private String pImg;
	private String pName;
	private String pPrice;
	private String bid;
	private String bEmail;
	private String bName;
	private String bTel;
	private String bAddr;
	private String approvalNumber;
	private String imp_uid;
	private String merchant_uid;
	
	public PaymentDto() {
	}

	public PaymentDto(String locid, int seq, String pImg, String pName, String pPrice, String bid, String bEmail,
			String bName, String bTel, String bAddr, String approvalNumber, String imp_uid, String merchant_uid) {
		super();
		this.locid = locid;
		this.seq = seq;
		this.pImg = pImg;
		this.pName = pName;
		this.pPrice = pPrice;
		this.bid = bid;
		this.bEmail = bEmail;
		this.bName = bName;
		this.bTel = bTel;
		this.bAddr = bAddr;
		this.approvalNumber = approvalNumber;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
	}

	public String getLocid() {
		return locid;
	}

	public void setLocid(String locid) {
		this.locid = locid;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTel() {
		return bTel;
	}

	public void setbTel(String bTel) {
		this.bTel = bTel;
	}

	public String getbAddr() {
		return bAddr;
	}

	public void setbAddr(String bAddr) {
		this.bAddr = bAddr;
	}

	public String getApprovalNumber() {
		return approvalNumber;
	}

	public void setApprovalNumber(String approvalNumber) {
		this.approvalNumber = approvalNumber;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	@Override
	public String toString() {
		return "PaymentDto [locid=" + locid + ", seq=" + seq + ", pImg=" + pImg + ", pName=" + pName + ", pPrice="
				+ pPrice + ", bid=" + bid + ", bEmail=" + bEmail + ", bName=" + bName + ", bTel=" + bTel + ", bAddr="
				+ bAddr + ", approvalNumber=" + approvalNumber + ", imp_uid=" + imp_uid + ", merchant_uid="
				+ merchant_uid + "]";
	}
	
	
	
}