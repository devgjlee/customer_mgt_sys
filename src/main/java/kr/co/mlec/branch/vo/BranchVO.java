package kr.co.mlec.branch.vo;

public class BranchVO {
	private String branchname;
	private String address;
	
	public BranchVO(String branchname, String address) {
		super();
		this.branchname = branchname;
		this.address = address;
	}
	
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "BranchVO [branchname=" + branchname + ", address=" + address + "]";
	}
	
}
