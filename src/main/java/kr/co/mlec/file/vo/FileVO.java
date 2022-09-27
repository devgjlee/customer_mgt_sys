package kr.co.mlec.file.vo;

public class FileVO {
	private int no;
	private int customer_no;
	private String originFileName;
	private String storedFileName;
	private String bizRegisNum;
	private String commentFile;
	
	public FileVO() {
		super();
	}

	public FileVO(int no, int customer_no, String originFileName, String storedFileName) {
		super();
		this.no = no;
		this.originFileName = originFileName;
		this.storedFileName = storedFileName;
	}
	
	public FileVO(int no, int customer_no, String originFileName, String storedFileName, String bizRegisNum) {
		super();
		this.no = no;
		this.customer_no = customer_no;
		this.originFileName = originFileName;
		this.storedFileName = storedFileName;
		this.bizRegisNum = bizRegisNum;
	}
	
	public FileVO(int no, int customer_no, String originFileName, String storedFileName, String bizRegisNum,
			String commentFile) {
		super();
		this.no = no;
		this.customer_no = customer_no;
		this.originFileName = originFileName;
		this.storedFileName = storedFileName;
		this.bizRegisNum = bizRegisNum;
		this.commentFile = commentFile;
	}
	
	public String getCommentFile() {
		return commentFile;
	}

	public void setCommentFile(String commentFile) {
		this.commentFile = commentFile;
	}

	public String getBizRegisNum() {
		return bizRegisNum;
	}

	public void setBizRegisNum(String bizRegisNum) {
		this.bizRegisNum = bizRegisNum;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	@Override
	public String toString() {
		return "FileVO [no=" + no + ", customer_no=" + customer_no + ", originFileName=" + originFileName
				+ ", storedFileName=" + storedFileName + "]";
	}
	
}
