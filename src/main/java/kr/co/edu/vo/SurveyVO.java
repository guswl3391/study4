package kr.co.edu.vo;

import java.util.Date;

/**
 * 설문 조사 제목과 상세 정보들(LIST에 뿌려줄 애들)
 * 테이블: TB_06_RS
 * @author 82104
 */
public class SurveyVO {

	/**
	 * 제목 번호
	 */
	private int sur_seq; // 제목 번호
	private String sur_title; // 제목
	private Date sur_sat_date; // 시작일
	private Date sur_end_date; // 마감일
	private String finish_yn; // 완료 여부: Y는 완료 N은 진행 중
	
	private String answer_yn; // 참여 여부
	private int rnum; 

	public SurveyVO() {
		super();
	}

	public SurveyVO(
		int sur_seq, String sur_title, Date sur_sat_date, Date sur_end_date, String finish_yn,
		String answer_yn, int rnum
	) {
		super();
		this.sur_seq = sur_seq;
		this.sur_title = sur_title;
		this.sur_sat_date = sur_sat_date;
		this.sur_end_date = sur_end_date;
		this.finish_yn = finish_yn;
		
		this.answer_yn = answer_yn;
		this.rnum = rnum;
	}

	public int getSur_seq() {
		return sur_seq;
	}

	public void setSur_seq(int sur_seq) { 
		this.sur_seq = sur_seq;
	}

	public String getSur_title() {
		return sur_title;
	}

	public void setSur_title(String sur_title) { // setter 있어야 form으로 넘어올 때 controller에서 파라미터 값이 잘 저장된다.
		this.sur_title = sur_title;
	}

	public Date getSur_sat_date() {
		return sur_sat_date;
	}

	public void setSur_sat_date(Date sur_sat_date) {
		this.sur_sat_date = sur_sat_date;
	}

	public Date getSur_end_date() {
		return sur_end_date;
	}

	public void setSur_end_date(Date sur_end_date) {
		this.sur_end_date = sur_end_date;
	}

	public String getFinish_yn() {
		return finish_yn;
	}

	public void setFinish_yn(String finish_yn) {
		this.finish_yn = finish_yn;
	}

	public int getRnum() {
		return rnum;
	}
	
	public String getAnswer_yn() {
		return answer_yn;
	}
}
