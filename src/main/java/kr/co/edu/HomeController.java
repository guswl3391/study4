package kr.co.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.edu.service.SurveyService;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyVO;

@Controller
public class HomeController {
	
	
	@Inject
	SurveyService service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		List<SurveyVO> list = service.getList();
		model.addAttribute("list", list);
		
		
		return "home";
	}
	
	
	/**
	 * 설문조사 게시판의 리스트 화면
	 * 설문조사 제목 1개(sur_seq)가 출력이 되고 설문조사 정보(시작일, 마감일, 완료 여부)가 나와야 함
	 * @param sur_seq -> 설문조사 제목 번호  {@link SurveyVO}
	 * @return
	 */
	@RequestMapping(value = "/researchList", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(int sur_seq, Model model){
		logger.info("list");
		
		
		
		return "researchList";
	}
	


	
	
	
	@RequestMapping(value = "/readView",  method = {RequestMethod.GET, RequestMethod.POST})
	public String read(Model model, int sur_seq){
		
		List<SurveyItemVO> list = service.getItemList(sur_seq);
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
	@RequestMapping(value = "/researchCreate", method = {RequestMethod.GET, RequestMethod.POST})
	public void writeView(){
	
		
	}
	
	//게시글 작성 부분 -> 끝나면 메인으로
	@RequestMapping(value = "/write", method = {RequestMethod.POST})
	public String write(
			SurveyVO surveyVO,
			@RequestParam("question[]") List<String> question
		) {
		// title에 인코딩 이슈 있음
		
		// 1. 제목 등록하기
		service.insertSurveyVO(surveyVO);
		
		// 2. sur_seq 얻어오기
		int sur_seq = surveyVO.getSur_seq();
		
		// 3. 문항들 등록하기
		service.insertSurveyItemVO(question, sur_seq);
		
		return "redirect:/"; // redirect 하는 이유는 작성이 끝나고 나서 어떠한 화면으로 가야 하기 때문에
	}
	
	/**
	 * 설문조사에 참여자가 응답하는 화면
	 * 설문조사 제목 1개(sur_seq)가 출력이 되고 문항들이 여러 개(리스트로) 출력이 되어야 함
	 * @param sur_seq -> 설문조사 제목 번호  {@link SurveyVO}
	 */
	@RequestMapping(value = "/researchView", method = RequestMethod.GET)
	public String researchView(int sur_seq, Model model){
		
		SurveyVO surveyVO = service.getSurveyVO(sur_seq);
		model.addAttribute("surveyVO", surveyVO);
		
		List<SurveyItemVO> list = service.getItemList(sur_seq);
		model.addAttribute("list", list);
		

		return "researchView";
	}
	
	/**
	 * 설문조사 상세 수정 화면
	 * @param sur_seq -> 설문조사 정보의 제목 번호 {@link SurveyVO}
	 */
	@RequestMapping(value = "/researchEdit", method = RequestMethod.GET)
	public String researchEdit(int sur_seq, Model model){

		SurveyVO surveyVO = service.getSurveyVO(sur_seq);
		model.addAttribute("surveyVO", surveyVO);
		
		List<SurveyItemVO> list = service.getItemList(sur_seq);
		model.addAttribute("list", list);
		
		return "researchEdit";
	}
	
	
	/**
	 * 수정 기능(글 수정)
	 * @param surveyVO -> sur_seq(제목 번호)와 sur_title(제목명)을 받아옴
	 * @param model
	 * @param suriTitle -> 수정된 설문조사 질문 내용 {@link SurveyItemVO.suri_title}
	 * @param suriSeq -> 수정된 설문조사 문항 번호 {@link SurveyItemVO.suri_seq}
	 * @return
	 */
	@RequestMapping(value="/edit", method= RequestMethod.POST)
	public String edit(
			SurveyVO surveyVO, 
			Model model,
			@RequestParam("suri_title[]") List<String> suriTitle,
			@RequestParam("suri_seq[]") List<Integer> suriSeq // List<int>는 에러난다. 안 된다. 그 이유는.. 일단 생략!
		) {
		
		// 1. ServeyVO  업데이트 하기
		service.updateSurveyVO(surveyVO);
		
		// 2. ServeyItemVO 업데이트 하기
		for(int i =0; i < suriSeq.size(); i++) {
			String suri_title = suriTitle.get(i);
			int suri_seq = suriSeq.get(i);
			int sur_seq = surveyVO.getSur_seq();
			
			SurveyItemVO surveyItemVO = new SurveyItemVO();
			surveyItemVO.setSuri_title(suri_title);
			surveyItemVO.setSuri_seq(suri_seq);
			surveyItemVO.setSur_seq(sur_seq);
			
			service.updateSurveyItemVO(surveyItemVO);
		}
		
		
		return "redirect:/"; // test용
	}
	
}
