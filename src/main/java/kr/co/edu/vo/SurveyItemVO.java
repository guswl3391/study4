package kr.co.edu.vo;

import java.util.List;

/**
 * 설문 조사 각각의 문항들에 대한 정보
 * 이 내용은 관리자가 등록한다.
 * 테이블: TB_06_RSI
 * @author 82104
 */
public class SurveyItemVO {

	/**
	 * 제목 번호 {@link SurveyVO.sur_seq}
	 */
	private int sur_seq;
	private int suri_seq; // 문항 번호, 자동 생성
	private String suri_title; // 문항 내용
	private String question1; // 답변 1
	private String question2; // 답변 2
	
	private String question3; // 답변 3
	private String question4; // 답변 4
	private String question5; // 답변 5
	
	private List<SurveyAnswerVO> answerList; // 응답 목록

	public SurveyItemVO() {
		super();
	}

	public SurveyItemVO(int sur_seq, int suri_seq, String suri_title, String question1, String question2, 
			String question3, String question4, String question5) {
		super();
		
		// backward: 중간 중간 비어있을 수 있으므로, 뒤에서부터 당겨온다.
		if (isQuestionEmpty(question4)) {
			question4 = question5;
			question5 = "";
		}
		
		if (isQuestionEmpty(question3)) {
			question3 = question4;
			question4 = question5;
			question5 = "";
		}
		
		if (isQuestionEmpty(question2)) {
			question2 = question3;
			question3 = question4;
			question4 = question5;
			question5 = "";
		}
		
		if (isQuestionEmpty(question1)) {
			question1 = question2;
			question2 = question3;
			question3 = question4;
			question4 = question5;
			question5 = "";
		}
		
		this.sur_seq = sur_seq;
		this.suri_seq = suri_seq;
		this.suri_title = suri_title;
		this.question1 = question1;
		this.question2 = question2;
		
		this.question3 = question3;
		this.question4 = question4;
		this.question5 = question5;
	}
	
	private boolean isQuestionEmpty(String question) {
		return (question == null || question.length() == 0);
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

	public List<SurveyAnswerVO> getAnswerList() {
		return answerList;
	}

	public String getQuestion1() {
		return question1;
	}

	public void setQuestion1(String question1) {
		this.question1 = question1;
	}

	public String getQuestion2() {
		return question2;
	}

	public void setQuestion2(String question2) {
		this.question2 = question2;
	}

	public String getQuestion3() {
		return question3;
	}

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public String getQuestion4() {
		return question4;
	}

	public void setQuestion4(String question4) {
		this.question4 = question4;
	}

	public String getQuestion5() {
		return question5;
	}

	public void setQuestion5(String question5) {
		this.question5 = question5;
	}

	public void setAnswerList(List<SurveyAnswerVO> answerList) {
		this.answerList = answerList;
	}
}
