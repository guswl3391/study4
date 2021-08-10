package kr.co.edu.vo;

/**
 * 설문조사 참여자(답변자) 관련 VO
 * 테이블명: TB_06_RSP
 * @author 82104
 */
public class SurveyPeopleVO {

	/**
	 * 회원 번호
	 */
	private int pno;
	/**
	 * 회원명
	 */
	private String name;
	/**
	 * 전화번호
	 */
	private String phone;
	/**
	 * 이메일
	 */
	private String email;
	/**
	 * 회원 아이디 (로그인시 사용)
	 */
	private String id;
	/**
	 * 회원 비밀번호 (로그인시 사용)
	 */
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
