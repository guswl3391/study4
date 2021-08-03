package kr.co.edu.vo;

public class SurveyItemVO {

	private int surveyNumber; // 제목 번호
	private int itemNumber; // 문항 번호
	private String question; // 질문

	public SurveyItemVO() {
		super();
	}

	public SurveyItemVO(int surveyNumber, int itemNumber, String question) {
		super();
		this.surveyNumber = surveyNumber;
		this.itemNumber = itemNumber;
		this.question = question;
	}

	public int getSurveyNumber() {
		return surveyNumber;
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public String getQuestion() {
		return question;
	}

}
