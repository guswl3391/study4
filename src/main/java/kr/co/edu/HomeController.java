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
	
	
	
	@RequestMapping(value = "/readView",  method = {RequestMethod.GET, RequestMethod.POST})
	public String read(Model model, int number){
		
		List<SurveyItemVO> list = service.getItemList(number);
		model.addAttribute("list", list);
		
		
		
		return "readView";
	}
	
	
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
	
	
	
}
