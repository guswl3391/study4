package kr.co.edu.vo;

import java.util.Date;

public class SurveyVO {

	/**
	 * 제목 번호
	 */
	private int number; // 제목 번호
	private String title; // 제목
	private Date start_date; // 시작일
	private Date end_date; // 마감일
	private String finish_yn; // 완료 여부: Y는 완료 N은 진행 중

	public SurveyVO() {
		super();
	}

	public SurveyVO(int number, String title, Date start_date, Date end_date, String finish_yn) { // 생성자: 객체를 생성할 때만 쓸 수 있다. 
		super();
		this.number = number; // 좌항이 변수고, 우항이 값이다! 왼쪽인 this.number는 surveyVO에 있는 private int number를 의미함 / 오른쪽에 있는 this가 없는 number는 함수 파라미터로 선언된 파라미터명(변수명)이다.
		// surveyVO 클래스 안에서 number라고 하면 기본적으로는 지역 변수 private int number를 의미하지만 메소드 파라미터로 동일한 이름의 파라미터명(변수명)이 있을 경우, this를 써야만 private int number의 접근할 수 있음.
		// ~ private int number를 의미하지만, 메소드 내에서 동일한 이름의 지역 변수를 선언할 경우, this를 써야만 private int number의 접근할 수 있음.
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.finish_yn = finish_yn;
	}

	public int getNumber() {
		return number; //지금은 this가 없지만, surveyVO(자기 자신)에 있는 private int number이다.
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) { // setter 있어야 form으로 넘어올 때 controller에서 파라미터 값이 잘 저장된다.
		this.title = title;
	}

	public Date getStart_date() {
		return start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public String getFinish_yn() {
		return finish_yn;
	}

}
