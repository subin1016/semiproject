 package mul.cam.a.dto;

public class CommuParam extends CommuDto {
	
	private String choice;	// 게시판의 검색 항목(카테고리) - 제목/내용/작성자
	private String search;  // 키보드로 입력된 검색어
	private int pageNumber; // [1][2][3] 1페이지, 2페이지...
	
	private int start; // 글 번호 시작
	private int end; // 글 번호 끝
	
	public CommuParam() {}

	public CommuParam(String choice, String search, int pageNumber, int start, int end, String category) {
		super(category);
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
		this.category = category;
	}
	
	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "CommuParam [choice=" + choice + ", search=" + search + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + "]";
	}
	
	

	
	
}
