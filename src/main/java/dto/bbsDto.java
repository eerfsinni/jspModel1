package dto;

import java.io.Serializable;


// BBS : Bulletin Board System
public class bbsDto implements Serializable {
	
	private int seq;		// 글의 고유번호 (순번과 다른 개념)
	private String id;		// 작성자
	
	private int ref;		// 답글용    그룹번호(글 번호)
	private int step;		//           행 번호
	private int depth;		//	         깊이
	
	private String title;	// 제목
	private String content;	// 내용
	private String wdate;	// 날짜

	private int del;		// 삭제
	private int readcount;	// 조회수
	
	public bbsDto() {
	}
	
	public bbsDto(String id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public bbsDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate, int del,
			int readcount) {
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
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
	
	
	
	
}
