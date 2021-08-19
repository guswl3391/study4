package kr.co.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.edu.service.SurveyService;
import kr.co.edu.vo.PageMaker;
import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyPeopleVO;
import kr.co.edu.vo.SurveyVO;

@Controller
public class HomeController {

	@Inject
	SurveyService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(
		Locale locale,
		Model model,
		HttpSession session
		
	) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		Date date2 = service.test();
		String sysdate = dateFormat.format(date2);
		model.addAttribute("sysdate", sysdate);
		
		int page = 1;
		String keyword = "";
		int pno = 1;
		
		int count = service.selectSurveyListCount(keyword);
		model.addAttribute("count", count);
		
		List<SurveyVO> list = service.selectSurveyList(page, count, keyword, pno);
		model.addAttribute("list", list);
		
		SurveyPeopleVO surveyPeopleVO2 = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		model.addAttribute("surveyPeopleVO2", surveyPeopleVO2);
		
		int sur_seq = 5;
		List<Map<String, Object>> resultList = service.selectResult(sur_seq);
		model.addAttribute("resultList", resultList);
		
		return "home";
	}

	/**
	 * 설문조사 게시판의 리스트 화면 설문조사 제목 1개(sur_seq)가 출력이 되고 설문조사 정보(시작일, 마감일, 완료 여부)가 나와야 함
	 * 
	 * @param sur_seq -> 설문조사 제목 번호 {@link SurveyVO}
	 * @return
	 */
	@RequestMapping(value = "/researchList", method = RequestMethod.GET)
	public String list(Model model, Integer page, String keyword, HttpSession session) {
		// validation
		if (page == null || page <= 0) {
			page = 1;
		}

		// model
		model.addAttribute("keyword", keyword);

		int count = service.selectSurveyListCount(keyword);
		model.addAttribute("count", count);

		SurveyPeopleVO surveyPeopleVO = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		model.addAttribute("surveyPeopleVO", surveyPeopleVO);
		
		int pno = (surveyPeopleVO == null) ? 0 :  surveyPeopleVO.getPno();
		List<SurveyVO> list = service.selectSurveyList(page, count, keyword, pno);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker(page, count, keyword);
		model.addAttribute("pageMaker", pageMaker);

		// view
		return "researchList";
	}

	@RequestMapping(value = "/readView", method = { RequestMethod.GET, RequestMethod.POST })
	public String read(Model model, int sur_seq) {

		List<SurveyItemVO> list = service.selectItemList(sur_seq);
		model.addAttribute("list", list);

		return "readView";
	}

	/*
	 * @RequestMapping(value="/researchChoiceReasonPopup", method =
	 * {RequestMethod.GET, RequestMethod.POST}) public String reasonPopup(Model
	 * model, int sur_seq) {
	 * 
	 * 
	 * }
	 */

	// 게시판 글 작성 화면
	@RequestMapping(value = "/researchCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public void writeView() {

	}

	// 게시글 작성 부분 -> 끝나면 메인으로
	@RequestMapping(value = "/write", method = { RequestMethod.POST })
	public String write(
			SurveyVO surveyVO, 
			@RequestParam("suri_title[]") List<String> suriTitleList,
			@RequestParam("question1[]") List<String> question1List,
			@RequestParam("question2[]") List<String> question2List,
			@RequestParam("question3[]") List<String> question3List,
			@RequestParam("question4[]") List<String> question4List,
			@RequestParam("question5[]") List<String> question5List
		) {
		// title에 인코딩 이슈 있음 -> 해결

		// 1. 제목 등록하기
		service.insertSurvey(surveyVO);

		// 2. sur_seq 얻어오기
		int sur_seq = surveyVO.getSur_seq();

		// 3. 문항들 등록하기
		for (int index = 0; index < suriTitleList.size(); index++) {
			int suri_seq = 0; // INSERT
			String suri_title = suriTitleList.get(index);
			String question1 = question1List.get(index);
			String question2 = question2List.get(index);
			String question3 = question3List.get(index);
			String question4 = question4List.get(index);
			String question5 = question5List.get(index);

			/*
			 * 	public SurveyItemVO(int sur_seq, int suri_seq, String suri_title, String question1, String question2, 
					String question3, String question4, String question5)
			 */
			SurveyItemVO surveyItemVO = new SurveyItemVO(sur_seq, suri_seq, suri_title, question1, question2,
					question3, question4, question5);
			service.insertSurveyItem(surveyItemVO, surveyVO);
		}

		return "redirect:/researchList"; // redirect 하는 이유는 작성이 끝나고 나서 어떠한 화면으로 가야 하기 때문에
	}

	/**
	 * 설문조사에 참여자가 응답하는 화면 설문조사 제목 1개(sur_seq)가 출력이 되고 문항들이 여러 개(리스트로) 출력이 되어야 함
	 * 
	 * @param sur_seq -> 설문조사 제목 번호 {@link SurveyVO}
	 */
	@RequestMapping(value = "/researchView", method = RequestMethod.GET)
	public String researchView(int sur_seq, Model model) {

		SurveyVO surveyVO = service.selectSurvey(sur_seq);
		model.addAttribute("surveyVO", surveyVO);

		List<SurveyItemVO> list = service.selectItemList(sur_seq);
		model.addAttribute("list", list);

		return "researchView";
	}
	
	
	/**
	 * 
	 * 
	 * @param sur_seq -> 설문조사 제목 번호 {@link SurveyVO}
	 */
	@RequestMapping(value = "/researchDone", method = RequestMethod.GET)
	public String researchDone(int sur_seq, Model model) {

		SurveyVO surveyVO = service.selectSurvey(sur_seq);
		model.addAttribute("surveyVO", surveyVO);

		List<SurveyItemVO> list = service.selectItemList(sur_seq);
		model.addAttribute("list", list);

		return "researchDone";
	}

	
	

	/**
	 * 참여자가 응답을 서버에 전송하는 기능
	 * 
	 * @param model
	 * @param sur_seq          -> 제목 번호
	 * @param suriSeqList      -> 문항 번호 여러개가 있어야 함
	 * @param answerList       -> 응답값 여러개가 있어야 함
	 * @param choiceReasonList -> 선택 사유 여러개가 있어야 함
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/researchSend", method = RequestMethod.POST)
	public String researchSend(Model model,
			HttpSession session,
			int sur_seq, // 제목 번호
			@RequestParam("suri_seq[]") List<Integer> suriSeqList, // 문항 번호
			@RequestParam("answer[]") List<Integer> answerList, // 응답값
			@RequestParam("choice_reason[]") List<String> choiceReasonList // 선택 사유
	) throws Exception {
		SurveyPeopleVO surveyPeopleVO = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		int pno = (surveyPeopleVO == null) ? 0 :  surveyPeopleVO.getPno();

		// validation
		if (pno == 0) {
			// 화내야함. 쫓아내버려야함
			// 화내는 방법: throw Excpetion-> 구체적으로 화내기!-> 5분 뒤의 나를 위해서!
			throw new Exception("로그인 정보가 없습니다.");
		}
		
		// validation: 질문이 1개이고, 선택 사유는 적지 않았을 경우: choiceReasonList.size()가 0으로 들어오더라!
		if (suriSeqList.size() == 1 && choiceReasonList.size() == 0) {
			choiceReasonList.add("");
		}

//		이 내용을 저장해야한다-> insert

		for (int i = 0; i < suriSeqList.size(); i++) {
			int ano = 0; // 자동이다, 0은 의미 없는 값임(db 있을 때 자동으로 증가할 예정)
			// int pno = 0; // 파라미터로 이미 있음
			// int sur_seq = 0; //파라미터로 이미 있음
			int suri_seq = suriSeqList.get(i);
			int answer = answerList.get(i);
			String choice_reason = choiceReasonList.get(i);

			// public SurveyAnswerVO(int ano, int pno, int sur_seq, int suri_seq, int
			// answer, String choice_reason) {
			SurveyAnswerVO surveyAnswerVO = new SurveyAnswerVO(ano, pno, sur_seq, suri_seq, answer, choice_reason);

			service.insertSurveyAnswer(surveyAnswerVO);
		}

		return "redirect:/researchList"; // 리스트로 보내기
	}

	/**
	 * 설문조사 상세 수정 화면
	 * 
	 * @param sur_seq -> 설문조사 정보의 제목 번호 {@link SurveyVO}
	 */
	@RequestMapping(value = "/researchEdit", method = RequestMethod.GET)
	public String researchEdit(int sur_seq, Model model) {

		SurveyVO surveyVO = service.selectSurvey(sur_seq);
		model.addAttribute("surveyVO", surveyVO);

		List<SurveyItemVO> list = service.selectItemList(sur_seq);
		model.addAttribute("list", list);

		return "researchEdit";
	}
	
	/**
	 * 설문조사를 삭제한다.
	 * @param sur_seq
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/researchDelete", method = RequestMethod.GET)
	public String researchDelete(int sur_seq, HttpSession session, Model model) throws Exception {
		// validate // 이런 권한 관련으로 반복적인 체크를.. interceptor로 처리하게 됩니다
		SurveyPeopleVO surveyPeopleVO = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		boolean isLogin = (surveyPeopleVO != null);
		if (isLogin == false) {
			// 화내는 방법: throw Excpetion-> 구체적으로 화내기!-> 5분 뒤의 나를 위해서!
			throw new Exception("로그인 정보가 없습니다.");
		}
		
		boolean isAdmin = ("admin".equals(surveyPeopleVO.getUser_type()));
		if (isAdmin == false) {
			// 화내는 방법: throw Excpetion-> 구체적으로 화내기!-> 5분 뒤의 나를 위해서!
			throw new Exception("관리자만이 삭제할 수 있습니다.");
		}
		
		// delete
		service.deleteResearchAnswer(sur_seq);
		service.deleteResearchItem(sur_seq);
		service.deleteResearchSurvey(sur_seq);

		return "redirect:/researchList"; // 리스트로 보내기
	}

	/**
	 * 수정 기능(글 수정)
	 * 웹 사이트의 설문 수정 페이지에서 사용자가 수정을 한 뒤, 수정 버튼을 누르면
	 * 사용자가 입력한 값들이 여기로 온다 우리는 이걸 처리해 준다
	 * 
	 * @param surveyVO  -> sur_seq(제목 번호)와 sur_title(제목명)을 받아옴
	 * @param model
	 * @param suriTitle -> 수정된 설문조사 질문 내용 {@link SurveyItemVO.suri_title}
	 * @param suriSeq   -> 수정된 설문조사 문항 번호 {@link SurveyItemVO.suri_seq}
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(SurveyVO surveyVO, Model model, @RequestParam("suri_title[]") List<String> suriTitle,
			@RequestParam(name="suri_seq[]", required = false) List<Integer> suriSeq // List<int>는 에러난다. 안 된다. 그 이유는.. 일단 생략!
	) {

		// 1. ServeyVO 업데이트 하기
		service.updateSurvey(surveyVO);
		
		/*
		 * if(suriSeq != null) { for (Integer surveyVO : suriSeq) {
		 * service.updateSurvey(surveyVO); } }
		 */
		
		

		// 2. ServeyItemVO 업데이트 하기
		for (int i = 0; i < suriSeq.size(); i++) {
			String suri_title = suriTitle.get(i); // suriTitle: 사용자가 입력한 값
			//Integer suri_seq = suriSeq.get(i); 
			int suri_seq = (suriSeq.get(i) == null) ? 0 : suriSeq.get(i); //이런 식으로 null처리를 계속해서 하게 될 것이다 
			// 여기서 에러 나는 중: i값은 1-> suriSeq.get(i)값은..? 
			// Integer 달리 int는 절대로 null값이 될 수 없다! 에러가 남
			// 1. Integer로 받는다. (이게 쉬우니 이걸로 일단 해 봄) -> Integer로 바꿔도 오류 없음 -> 오류는 없으나, 진행 과정에서 오류가 생김 -> 한번으로 끝나지 않을 거 같음 -> 2번으로 
			// 2. null일 때에는 0이 되도록 한다. (삼항연산자를 쓰면 간단하다) 
			int sur_seq = surveyVO.getSur_seq();

			SurveyItemVO surveyItemVO = new SurveyItemVO();
			surveyItemVO.setSuri_title(suri_title); // 문항제목은 여기서 세팅 중
			surveyItemVO.setSuri_seq(suri_seq);
			// 여기서 에러 나는 중-> int로 바꿔 주었으니 괜찮을 것이다..
			surveyItemVO.setSur_seq(sur_seq);

			boolean isUpdate = (suri_seq > 0);
			if (isUpdate) {
				service.updateSurveyItem(surveyItemVO);

			} else { // 새로 추가된 값
				service.insertSurveyItem(surveyItemVO, surveyVO);
				// Cause: java.sql.SQLIntegrityConstraintViolationException: ORA-01400: 
				// cannot insert NULL into ("KH"."TB_06_RSI"."SURI_TITLE")
				// -> 에러 메시지를 주의 깊게 읽자-> SURI_TITLE(문항 제목)이 null이다 
				
				// -->> 사용자가 문항 제목을 아 ㄴ썻기 때문에 에러가 나고 있음 -> 에러가 나는 게 맞음
				// * 해결 방법: 
				// 1. 제목이 들어오지 않는 경우 처리하지 않는다
				// 2. 지금처럼 에러를 그대로 내고 대신 스크립트로 내용이 없는 게 보이면 못 넘어오게 한다
				// 3. 추후 개발한다.

			}

		}

		return "redirect:/researchList"; 
	}


	/**
	 * 
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		
	}
	
	@RequestMapping(value = "/loginDo", method = RequestMethod.POST)
	@ResponseBody
	public boolean loginDo(String id, String pw, HttpSession session) {
		SurveyPeopleVO surveyPeopleVO = service.selectPeople(id, pw);
		session.setAttribute("surveyPeopleVO", surveyPeopleVO);
		
		boolean isLogin = (surveyPeopleVO != null);
		return isLogin;
	}



	/**
	 * 설문조사에 대한 내용들의 결과를 모아서 보여주는 곳
	 * @param int sur_seq 제목 번호 {@link SurveyVO.sur_seq}
	 */
	@RequestMapping(value = "/researchPopup", method = RequestMethod.GET )
	public void researchPopup(
			Model model,
			HttpSession session,
			int sur_seq
	) {
		model.addAttribute("sur_seq", sur_seq);
		
		SurveyPeopleVO surveyPeopleVO2 = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		model.addAttribute("surveyPeopleVO2", surveyPeopleVO2);
		
		List<Map<String, Object>> resultList = service.selectResult(sur_seq);
		model.addAttribute("resultList", resultList);
		
	}
	
	/**
	 * 설문조사 상세 페이지 내 사유 전체 보기 popup
	 * @param int sur_seq 제목 번호 {@link SurveyVO.sur_seq}
	 */
	@RequestMapping(value = "/researchChoiceReasonPopup", method = RequestMethod.GET)
	public void researchChoiceReasonPopup(
			Model model,
			HttpSession session,
			int sur_seq
	) {
		// 설문조사 문항 리스트
		List<SurveyItemVO> itemList = service.selectItemList(sur_seq);
		
		for(SurveyItemVO surveyItemVO : itemList) {
			// 상세 사유가 있는 답변을 가져온다.
			List<SurveyAnswerVO> answerList = service.selectSurveyAnswerChoiceReasonList(surveyItemVO);
			surveyItemVO.setAnswerList(answerList);
		}
		
		model.addAttribute("itemList", itemList);
	}
	
	

}