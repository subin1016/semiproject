package mul.cam.a.dto;


/*create table wantpackage(
		id varchar(50) not null,		-- 외래키로 사용, 사람 id
		locid varchar(50) not null,		-- 패키지 장소 id
		seq varchar(50) not null, 		-- 상품 순서
	    
	    title varchar(200) not null,	-- 상품이름
	    imgurl varchar(200) not null	-- 이미지 url
	);

	alter table wantpackage
	add foreign key(id) references members(id);*/

public class WantDto {
	
	private String id;
	private String locid;
	private int seq;
	private String title;
	private String imgurl;
	
	public WantDto() {
	}
	

	public WantDto(String id, String locid, int seq) {
		super();
		this.id = id;
		this.locid = locid;
		this.seq = seq;
	}

	public WantDto(String id, String locid, int seq, String title, String imgurl) {
		super();
		this.id = id;
		this.locid = locid;
		this.seq = seq;
		this.title = title;
		this.imgurl = imgurl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	@Override
	public String toString() {
		return "WantDto [id=" + id + ", locid=" + locid + ", seq=" + seq + ", title=" + title + ", imgurl=" + imgurl
				+ "]";
	}
	
}
