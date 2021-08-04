package kr.co.edu.vo;

/**
 * 설문조사 참여자(답변자) 관련 VO
 * @author 82104
 *
 */
public class SurveyPeopleVO {

	/**
	 * 회원 번호
	 */
	private int pno; 
	private String name;
	private String phone;
	private String email;
	private String id;
	private String pw;
	
	public SurveyPeopleVO() {
		super();
	}
	
	public SurveyPeopleVO(int pno, String name, String phone, String email, String id, String pw) {
		super();
		this.pno = pno;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.id = id;
		this.pw = pw;
	}

	public int getPno() {
		return pno;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}


}
