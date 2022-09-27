package kr.co.mlec.member.vo;

public class MemberVO {

	private String id;
	private String password;
	private String type;		// type == 'S'  관리자   type == 'U' 일반사용자
	private String name;
	private String email;
	private String phone;
	private String branch;
	private String gender;
	
	private String count;
	private String customer_no;
	private String companyKor;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String type) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
	}
	
	public MemberVO(String id, String password, String type, String name, String email, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	
	public MemberVO(String id, String password, String type, String name, String email, String phone, String branch) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.branch = branch;
	}
	
	
	public MemberVO(String id, String password, String type, String name, String email, String phone, String branch,
			String count, String customer_no) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.branch = branch;
		this.count = count;
		this.customer_no = customer_no;
	}
	
	
	public MemberVO(String id, String password, String type, String name, String email, String phone, String branch,
			String gender, String count, String customer_no) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.branch = branch;
		this.gender = gender;
		this.count = count;
		this.customer_no = customer_no;
	}
	
	public MemberVO(String id, String password, String type, String name, String email, String phone, String branch,
			String gender, String count, String customer_no, String companyKor) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.branch = branch;
		this.gender = gender;
		this.count = count;
		this.customer_no = customer_no;
		this.companyKor = companyKor;
	}
	
	public String getCompanyKor() {
		return companyKor;
	}

	public void setCompanyKor(String companyKor) {
		this.companyKor = companyKor;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public MemberVO(String customer_no, String count) {
		this.customer_no = customer_no;
		this.count = count;
	}

	public String getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", type=" + type + ", name=" + name + ", email="
				+ email + ", phone=" + phone + ", branch=" + branch + "]";
	}

	
	
}
