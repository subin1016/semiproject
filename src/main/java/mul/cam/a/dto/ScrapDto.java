package mul.cam.a.dto;

/*
create table scrap(
		seq decimal(5) not null,
		id varchar(50)
	);

	alter table scrap
	add foreign key(id) references members(id);
*/

public class ScrapDto {
	
	private String id;
	private int seq;
	
	public ScrapDto() {
	}

	public ScrapDto(String id, int seq) {
		super();
		this.id = id;
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "ScrapDto [id=" + id + ", seq=" + seq + "]";
	}

}
