package mul.cam.a.dto;

import java.io.Serializable;

public class MemberDto implements Serializable {

	private String id;
	private String pwd;
	private String name;
	private String bdate;
	private String phone;
	private String email;
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String name, String bdate, String phone, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.bdate = bdate;
		this.phone = phone;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", bdate=" + bdate + ", phone=" + phone
				+ ", email=" + email + "]";
	}
	
}
