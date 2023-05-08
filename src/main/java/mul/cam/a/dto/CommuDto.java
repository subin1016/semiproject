package mul.cam.a.dto;

import java.io.Serializable;

// 작성된 커뮤니티글들에 대한 정보
public class CommuDto implements Serializable {

	// 작성된 커뮤니티글들에 대한 정보를 담은 테이블: commubbs
	/*
	
	create table commubbs(
	seq int auto_increment primary key,	-- 글 번호
	id varchar(50) not null,		-- 외래키로 사용
	category varchar(50) not null,	-- 커뮤니티의 게시판 구분을 위한 카테고리
	
	ref decimal(8) not null,   		-- 커뮤니티의 "전체 게시판"에서 답글 기능
	step decimal(8) not null,		
	depth decimal(8) not null, 
	
	title varchar(200) not null,	-- 제목
	content longblob not null,		-- 글 내용(이미지와 텍스트가 함께 들어가서 longblob으로 용량 크게 잡음)
	wdate timestamp not null,		-- 작성일
	
	filename varchar(50) not null,	-- 원본 파일명
	newfilename varchar(50) not null, -- 업로드 파일명

	del decimal(1) not null,		-- 글 삭제 기능 시 사용(삭제되면 del=1)
	readcount decimal(8) not null,	-- 조회수
	scrapcount decimal(8) not null,	-- 스크랩수
	likecount decimal(8) not null	-- 추천수
	);

	alter table commubbs
	add foreign key(id) references members(id);
	 
	*/
	
	private int seq;			// 글 번호
	private String id;			// 아이디
	public String category;		// 카테고리(게시판 종류)
	
	private	int	ref;    		// 답글용 그룹번호(글번호) 
	private int step;			//		 행번호
	private int depth;			//       깊이
	
	private String title;		// 글 제목
	private String content;		// 글 내용
	private String wdate;   	// 글 작성한 날짜(write date)
	
	private String filename;	// 원본 파일명		abc.txt
	private String newfilename;	// 업로드 파일명	->  자료실에 실제로 등록되는 파일명(654654662.txt)
	
	private int del; 			// 삭제
	private int readcount;		// 조회수
	private int scrapcount;		// 스크랩수
	private int likecount;		// 추천수
	
	
	public CommuDto() {}
	
	public CommuDto(String category) {}
	
	public CommuDto(int seq, String id, String category, int ref, int step, int depth, String title, String content,
			String wdate, String filename, String newfilename, int del, int readcount, int scrapcount, int likecount) {
		super();
		this.seq = seq;
		this.id = id;
		this.category = category;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.filename = filename;
		this.newfilename = newfilename;
		this.del = del;
		this.readcount = readcount;
		this.scrapcount = scrapcount;
		this.likecount = likecount;
	}

	// 사용자가 글 작성시 입력해야 하는 것들에 대해 따로 생성자 추가
	public CommuDto(String id, String title, String content, String filename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getScrapcount() {
		return scrapcount;
	}

	public void setScrapcount(int scrapcount) {
		this.scrapcount = scrapcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	@Override
	public String toString() {
		return "CommuDto [seq=" + seq + ", id=" + id + ", category=" + category + ", ref=" + ref + ", step=" + step
				+ ", depth=" + depth + ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", filename="
				+ filename + ", newfilename=" + newfilename + ", del=" + del + ", readcount=" + readcount
				+ ", scrapcount=" + scrapcount + ", likecount=" + likecount + "]";
	}

	
	
}
