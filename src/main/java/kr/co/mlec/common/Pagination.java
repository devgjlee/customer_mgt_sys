package kr.co.mlec.common;

import kr.co.mlec.member.vo.MemberVO;

public class Pagination{

	private int listSize = 10;
	private int rangeSize = 10;
	private int curPage;
	private int curRange;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private String id;
	
	
	
	public Pagination() {
		super();
	}

	public Pagination(int listSize, int rangeSize, int curPage, int curRange, int listCnt, int pageCnt, int startPage,
			int startList, int endPage, boolean prev, boolean next, String id, String searchType, String keyword) {
		super();
		this.listSize = listSize;
		this.rangeSize = rangeSize;
		this.curPage = curPage;
		this.curRange = curRange;
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
		this.startPage = startPage;
		this.startList = startList;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.id = id;
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private String searchType;
	private String keyword;

	
	public int getCurRange() {
		return curRange;
	}

	public void setCurRange(int curRange) {
		this.curRange = curRange;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}


	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// Pagination [listSize=10, rangeSize=10, page=1, range=1, listCnt=12,
	// pageCnt=1, startPage=1, startList=0, endPage=1, prev=false, next=false]
	public void pageInfo(int page, int range, int listCnt) {
		this.curPage = page;
		this.curRange = range;
		this.listCnt = listCnt;

		this.pageCnt = (int) Math.ceil(listCnt * 1.0 / listSize * 1.0);

		this.startPage = (range - 1) * rangeSize + 1;

		this.endPage = range * rangeSize;

		this.startList = (page - 1) * listSize;

		this.prev = range == 1 ? false : true;

		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}

	@Override
	public String toString() {
		return "Pagination [listSize=" + listSize + ", rangeSize=" + rangeSize + ", curPage=" + curPage + ", curRange="
				+ curRange + ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", startPage=" + startPage
				+ ", startList=" + startList + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

	

}