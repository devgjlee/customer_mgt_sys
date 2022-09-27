package kr.co.mlec.board.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class BoardVO2 {

	private int no;
	@Length(min=2, max=50, message="2±ÛÀÚÀÌ»ó 50±ÛÀÚ ÀÌÇÏ·Î¸¸ ÀÔ·ÂÇÏ¼¼¿ä")
	@NotEmpty(message="ÇÊ¼öÇ×¸ñÀÔ´Ï´Ù")
	private String title;
	@Pattern(regexp="^[A-Za-z0-9°¡-ÆR]*$", message="Æ¯¼ö±âÈ£·Î ½ÃÀÛÇÒ ¼ö ¾ø½À´Ï´Ù")
	@NotEmpty(message="ÇÊ¼öÇ×¸ñÀÔ´Ï´Ù")
	private String writer;
	@NotEmpty(message="ÇÊ¼öÇ×¸ñÀÔ´Ï´Ù")
	private String content;
	private int viewCnt;
	private String regDate;
	
	public BoardVO2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO2(int no, String title, String writer, String content, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}
	
}
