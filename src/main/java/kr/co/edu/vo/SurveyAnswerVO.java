package kr.co.edu.vo;

/**
 * 설문 조사에 참여자가 응답하는 상세 내용
 * @author 82104
 *
 */
public class SurveyAnswerVO {

	/** 
	 * 응담 번호
	 */
	private int ano;
	/** 
	 * 참여자 번호
	 */
	private int pno;
	/** 
	 * 제목 번호 
	 */
	private int sur_seq;
	/**
	 * 문항 번호 
	 */
	private int suri_seq;
	/**
	 * 응답값 
	 */
	private int answer;
	/**
	 * 선택 사유 
	 */
	private String choice_reason;
	
	public SurveyAnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SurveyAnswerVO(int ano, int pno, int sur_seq, int suri_seq, int answer, String choice_reason) {
		super();
		this.ano = ano;
		this.pno = pno;
		this.sur_seq = sur_seq;
		this.suri_seq = suri_seq;
		this.answer = answer;
		this.choice_reason = choice_reason;
	}

	public int getAno() {
		return ano;
	}

	public int getPno() {
		return pno;
	}

	public int getSur_seq() {
		return sur_seq;
	}

	public int getSuri_seq() {
		return suri_seq;
	}

	public int getAnswer() {
		return answer;
	}

	public String getChoice_reason() {
		return choice_reason;
	}
	
}
