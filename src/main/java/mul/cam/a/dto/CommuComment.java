package mul.cam.a.dto;

import java.io.Serializable;

public class CommuComment implements Serializable {
	
	/*
	-- 댓글 작성하기
	create table commucomment(
		seq decimal(5) not null,
		id varchar(50),
		content varchar(1000) not null,
		wdate timestamp not null
	);

	alter table commucomment
	add foreign key(id) references members(id); 
	*/
	
	// 댓글 작성하기
	private int seq;		// 어떤 글에 댓글을 작성하는지 -> 글번호(seq)가 필요하다.
	private String id;		// 댓글 작성자의 id(login한 사람의 id)
	private String content;	// 댓글 내용
	private String wdate;	// 댓글 작성일
	
	public CommuComment() {}

	public CommuComment(int seq, String id, String content, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.wdate = wdate;
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

	@Override
	public String toString() {
		return "CommuComment [seq=" + seq + ", id=" + id + ", content=" + content + ", wdate=" + wdate + "]";
	}

	
	
	
	
}
