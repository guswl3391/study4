package kr.co.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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
	public String write(SurveyVO surveyVO, @RequestParam("question[]") List<String> questionList) {
		// title에 인코딩 이슈 있음 -> 해결

		// 1. 제목 등록하기
		service.insertSurvey(surveyVO);

		// 2. sur_seq 얻어오기
		int sur_seq = surveyVO.getSur_seq();

		// 3. 문항들 등록하기
		for (String question : questionList) {
			int suri_seq = 0; // INSERT
			SurveyItemVO surveyItemVO = new SurveyItemVO(sur_seq, suri_seq, question);
			service.insertSurveyItem(surveyItemVO, surveyVO);
		}

		return "redirect:/"; // redirect 하는 이유는 작성이 끝나고 나서 어떠한 화면으로 가야 하기 때문에
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
	 * 참여자가 응답을 서버에 전송하는 기능
	 * 
	 * @param model
	 * @param sur_seq          -> 제목 번호
	 * @param suriSeqList      -> 문항 번호 여러개가 있어야 함
	 * @param answerList       -> 응답값 여러개가 있어야 함
	 * @param choiceReasonList -> 선택 사유 여러개가 있어야 함
	 * @return
	 */
	@RequestMapping(value = "/researchSend", method = RequestMethod.POST)
	public String researchSend(Model model,
			HttpSession session,
			int sur_seq, // 제목 번호
			@RequestParam("suri_seq[]") List<Integer> suriSeqList, // 문항 번호
			@RequestParam("answer[]") List<Integer> answerList, // 응답값
			@RequestParam("choice_reason[]") List<String> choiceReasonList // 선택 사유
	) {
		SurveyPeopleVO surveyPeopleVO = (SurveyPeopleVO) session.getAttribute("surveyPeopleVO"); // casting: have to
		int pno = (surveyPeopleVO == null) ? 0 :  surveyPeopleVO.getPno();

		// validation
		if (pno == 0) {
			// 화내야함. 쫓아내버려야함
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

		return "redirect:/"; // test용
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
	 * 수정 기능(글 수정)
	 * 
	 * @param surveyVO  -> sur_seq(제목 번호)와 sur_title(제목명)을 받아옴
	 * @param model
	 * @param suriTitle -> 수정된 설문조사 질문 내용 {@link SurveyItemVO.suri_title}
	 * @param suriSeq   -> 수정된 설문조사 문항 번호 {@link SurveyItemVO.suri_seq}
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(SurveyVO surveyVO, Model model, @RequestParam("suri_title[]") List<String> suriTitle,
			@RequestParam("suri_seq[]") List<Integer> suriSeq // List<int>는 에러난다. 안 된다. 그 이유는.. 일단 생략!
	) {

		// 1. ServeyVO 업데이트 하기
		service.updateSurvey(surveyVO);

		// 2. ServeyItemVO 업데이트 하기
		for (int i = 0; i < suriSeq.size(); i++) {
			String suri_title = suriTitle.get(i);
			int suri_seq = suriSeq.get(i);
			int sur_seq = surveyVO.getSur_seq();

			SurveyItemVO surveyItemVO = new SurveyItemVO();
			surveyItemVO.setSuri_title(suri_title);
			surveyItemVO.setSuri_seq(suri_seq);
			surveyItemVO.setSur_seq(sur_seq);

			boolean isUpdate = (suri_seq > 0);
			if (isUpdate) {
				service.updateSurveyItem(surveyItemVO);

			} else { // 새로 추가된 값
				service.insertSurveyItem(surveyItemVO, surveyVO);

			}

		}

		return "redirect:/"; // test용
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
	 * 
	 */
	@RequestMapping(value = "/researchPopup", method = {RequestMethod.GET, RequestMethod.POST})
	public void researchPopup() {
		
	}

}