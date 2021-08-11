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
	/**
	 * 회원 타입: admin(관리자), user(사용자)
	 */
	private String user_type;
	

	public SurveyPeopleVO() {
		super();
	}
	
	public SurveyPeopleVO(int pno, String name, String phone, String email, String id,
			String pw, String user_type) {
		super();
		
		this.pno = pno;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.id = id;
		
		this.pw = pw;
		this.user_type = user_type;
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
	
	public String getUser_type() {
		return user_type;
	}


	@Override
	public String toString() {
		return "SurveyPeopleVO [pno=" + pno + ", name=" + name + ", phone=" + phone + ", email=" + email + ", id=" + id
				+ ", pw=" + pw + "]";
	}
}
