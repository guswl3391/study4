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
//	private String finish_yn; 
	// 완료 여부: Y는 완료 N은 진행 중 
	// 이걸 DB로 update해주려면, 하루에 한 번 도는 작업이 필요하다! 
	// 이런 정기적인 작업을 Job, Scheduller, Cron, Batch, 등으로 사람들이 부르고, 
	// 이건 이것대로 또! 개발이 필요하다! 
	// T_T!
	// -> 즉, 이걸, DB에서 조회해오지 말자!
	// -> DB의 필드를 지우자! (중요! 꼭 지워야함! 반드시!)
	// -->> 그리고, getter를 만들자.
	// -> 왜냐면, 얘는 관련 데이터가 DB에 따로 있지 않다. 그냥 sur_end_date만 있으면 된다!-> 그냥 Java에서 하자! -> SQL에서도 할 수 있지만, 그럴려면 모든 관련 쿼리에 다 들어가야 하니까요
	private String answer_yn;
	// 참여 여부
	// 얘는, DB에서 반드시! 조회해와야만! 한다!-> 데이터가 DB에 있는걸! -> 얄짤 없이 DB에서 조회해야 한다!
	
	private int rnum; 

	public SurveyVO() {
		super();
	}

	public SurveyVO(
		int sur_seq, String sur_title, Date sur_sat_date, Date sur_end_date, String answer_yn, 
		int rnum
	) {
		super();
		this.sur_seq = sur_seq;
		this.sur_title = sur_title;
		this.sur_sat_date = sur_sat_date;
		this.sur_end_date = sur_end_date;
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
	
	/**
	 * 설문이 종료되었는지 Y/N값
	 * sur_end_date가 지났는지로 확인한다.
	 * @return
	 */
	public String getFinish_yn() {
		Date now = new Date();
		boolean isAfterEndDate = now.after(sur_end_date); // now < sur_end_date // sur_end_date가 now보다 과거에 있다.
		String finish_yn = (isAfterEndDate) ? "Y" : "N";

		return finish_yn;
	}

	public int getRnum() {
		return rnum;
	}
	
	public String getAnswer_yn() {
		return answer_yn;
	}
	
}
