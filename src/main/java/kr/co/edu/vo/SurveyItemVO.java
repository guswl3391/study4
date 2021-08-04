package kr.co.edu.vo;

public class SurveyItemVO {

	private int sur_seq; // 제목 번호
	private int suri_seq; // 문항 번호
	private String suri_title; // 질문 내용

	public SurveyItemVO() {
		super();
	}

	public SurveyItemVO(int sur_seq, int suri_seq, String suri_title) {
		super();
		this.sur_seq = sur_seq;
		this.suri_seq = suri_seq;
		this.suri_title = suri_title;
	}

	public int getSur_seq() {
		return sur_seq;
	}

	public void setSur_seq(int sur_seq) {
		this.sur_seq = sur_seq;
	}

	public int getSuri_seq() {
		return suri_seq;
	}

	public void setSuri_seq(int suri_seq) {
		this.suri_seq = suri_seq;
	}

	public String getSuri_title() {
		return suri_title;
	}

	public void setSuri_title(String suri_title) {
		this.suri_title = suri_title;
	}



}
