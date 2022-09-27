package kr.co.mlec.board.vo;




public class BoardVO {

	private int no;		
	private String companyKor;		//기업명 국문
	private String companyEng;		//기업명 영문
	private String corporationNum;	//법인 번호
	private String bizRegisNum;		//사업자 등록 번호
	private String representName;	//대표자명
	private String homepage;
	private String phone;
	private String fax;				
	private String category;		//업종
	private String address; 		//기업 주소
	private String name; 			//담당 행원 이름
	private String star; 			//즐겨찾기 여부
	private String customerName;	//담당자 성함
	private String customerPhone;	//담당자 개인 전화번호
	
	
	private String list_no;		//글 번호
	private String history;		//상담 내역
	private String consultDate;	//상담 날짜
	private String writer;		//작성자 사번
	
	private String user;
	private String id;
	private String attachfile1; //첨부 파일
	private String attachfile2; //첨부 파일
	private String attachfile3; //첨부 파일
	private String attachfile4; //첨부 파일
	private String attachfile5; //첨부 파일
	
	
	public String getAttachfile3() {
		return attachfile3;
	}

	public void setAttachfile3(String attachfile3) {
		this.attachfile3 = attachfile3;
	}

	public String getAttachfile4() {
		return attachfile4;
	}

	public void setAttachfile4(String attachfile4) {
		this.attachfile4 = attachfile4;
	}

	public String getAttachfile5() {
		return attachfile5;
	}

	public void setAttachfile5(String attachfile5) {
		this.attachfile5 = attachfile5;
	}

	public BoardVO(int no, String companyKor, String companyEng, String corporationNum, String bizRegisNum,
			String representName, String homepage, String phone, String fax, String category, String address,
			String name, String star, String customerName, String customerPhone, String list_no, String history,
			String consultDate, String writer, String user, String id, String attachfile1, String attachfile2,
			String attachfile3, String attachfile4, String attachfile5) {
		super();
		this.no = no;
		this.companyKor = companyKor;
		this.companyEng = companyEng;
		this.corporationNum = corporationNum;
		this.bizRegisNum = bizRegisNum;
		this.representName = representName;
		this.homepage = homepage;
		this.phone = phone;
		this.fax = fax;
		this.category = category;
		this.address = address;
		this.name = name;
		this.star = star;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.list_no = list_no;
		this.history = history;
		this.consultDate = consultDate;
		this.writer = writer;
		this.user = user;
		this.id = id;
		this.attachfile1 = attachfile1;
		this.attachfile2 = attachfile2;
		this.attachfile3 = attachfile3;
		this.attachfile4 = attachfile4;
		this.attachfile5 = attachfile5;
	}

	public BoardVO(int no, String companyKor, String companyEng, String corporationNum, String bizRegisNum,
			String representName, String homepage, String phone, String fax, String category, String address,
			String name, String star, String customerName, String customerPhone, String list_no, String history,
			String consultDate, String writer, String user, String id, String attachfile1, String attachfile2) {
		super();
		this.no = no;
		this.companyKor = companyKor;
		this.companyEng = companyEng;
		this.corporationNum = corporationNum;
		this.bizRegisNum = bizRegisNum;
		this.representName = representName;
		this.homepage = homepage;
		this.phone = phone;
		this.fax = fax;
		this.category = category;
		this.address = address;
		this.name = name;
		this.star = star;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.list_no = list_no;
		this.history = history;
		this.consultDate = consultDate;
		this.writer = writer;
		this.user = user;
		this.id = id;
		this.attachfile1 = attachfile1;
		this.attachfile2 = attachfile2;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public BoardVO(int no, String companyKor, String companyEng, String corporationNum, String bizRegisNum,
			String representName, String homepage, String phone, String fax, String category, String address,
			String name, String star, String list_no, String history, String consultDate, String writer, String user,
			String id, String attachfile1, String attachfile2) {
		super();
		this.no = no;
		this.companyKor = companyKor;
		this.companyEng = companyEng;
		this.corporationNum = corporationNum;
		this.bizRegisNum = bizRegisNum;
		this.representName = representName;
		this.homepage = homepage;
		this.phone = phone;
		this.fax = fax;
		this.category = category;
		this.address = address;
		this.name = name;
		this.star = star;
		this.list_no = list_no;
		this.history = history;
		this.consultDate = consultDate;
		this.writer = writer;
		this.user = user;
		this.id = id;
		this.attachfile1 = attachfile1;
		this.attachfile2 = attachfile2;
	}

	public String getList_no() {
		return list_no;
	}

	public void setList_no(String list_no) {
		this.list_no = list_no;
	}

	public BoardVO(int no, String companyKor, String companyEng, String corporationNum, String bizRegisNum,
			String representName, String homepage, String phone, String fax, String category, String address,
			String name, String star, String history, String consultDate, String writer, String user, String id,
			String attachfile1, String attachfile2) {
		super();
		this.no = no;
		this.companyKor = companyKor;
		this.companyEng = companyEng;
		this.corporationNum = corporationNum;
		this.bizRegisNum = bizRegisNum;
		this.representName = representName;
		this.homepage = homepage;
		this.phone = phone;
		this.fax = fax;
		this.category = category;
		this.address = address;
		this.name = name;
		this.star = star;
		this.history = history;
		this.consultDate = consultDate;
		this.writer = writer;
		this.user = user;
		this.id = id;
		this.attachfile1 = attachfile1;
		this.attachfile2 = attachfile2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BoardVO(int no, String companyKor, String companyEng, String corporationNum, String bizRegisNum,
			String representName, String homepage, String phone, String fax, String category, String address,
			String name, String history, String consultDate, String user, String writer, String attachfile1, String attachfile2,
			String star) {
		super();
		this.no = no;
		this.companyKor = companyKor;
		this.companyEng = companyEng;
		this.corporationNum = corporationNum;
		this.bizRegisNum = bizRegisNum;
		this.representName = representName;
		this.homepage = homepage;
		this.phone = phone;
		this.fax = fax;
		this.category = category;
		this.address = address;
		this.name = name;
		this.history = history;
		this.consultDate = consultDate;
		this.user = user;
		this.writer = writer;
		this.attachfile1 = attachfile1;
		this.attachfile2 = attachfile2;
		this.star = star;
	}

	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getCompanyKor() {
		return companyKor;
	}


	public void setCompanyKor(String companyKor) {
		this.companyKor = companyKor;
	}


	public String getCompanyEng() {
		return companyEng;
	}


	public void setCompanyEng(String companyEng) {
		this.companyEng = companyEng;
	}

	public String getCorporationNum() {
		return corporationNum;
	}


	public void setCorporationNum(String corporationNum) {
		this.corporationNum = corporationNum;
	}


	public String getBizRegisNum() {
		return bizRegisNum;
	}


	public void setBizRegisNum(String bizRegisNum) {
		this.bizRegisNum = bizRegisNum;
	}


	public String getRepresentName() {
		return representName;
	}


	public void setRepresentName(String representName) {
		this.representName = representName;
	}


	public String getHomepage() {
		return homepage;
	}


	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getFax() {
		return fax;
	}


	public void setFax(String fax) {
		this.fax = fax;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getHistory() {
		return history;
	}


	public void setHistory(String history) {
		this.history = history;
	}


	public String getConsultDate() {
		return consultDate;
	}

	public void setConsultDate(String consultDate) {
		//this.consultDate = consultDate.substring(0, 11);
		this.consultDate = consultDate.substring(0, 10);
	}


	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", companyKor=" + companyKor + ", companyEng=" + companyEng + ", corporationNum="
				+ corporationNum + ", bizRegisNum=" + bizRegisNum + ", representName=" + representName + ", homepage="
				+ homepage + ", phone=" + phone + ", fax=" + fax + ", category=" + category + ", address=" + address
				+ ", name=" + name + ", star=" + star + ", history=" + history + ", consultDate=" + consultDate
				+ ", writer=" + writer + ", user=" + user + ", id=" + id + ", attachfile1=" + attachfile1
				+ ", attachfile2=" + attachfile2 + "]";
	}

	public String getAttachfile1() {
		return attachfile1;
	}

	public void setAttachfile1(String attachfile1) {
		this.attachfile1 = attachfile1;
	}

	public String getAttachfile2() {
		return attachfile2;
	}

	public void setAttachfile2(String attachfile2) {
		this.attachfile2 = attachfile2;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}



	
	
}
