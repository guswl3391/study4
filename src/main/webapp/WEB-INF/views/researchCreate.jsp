<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>서울학교급식포털</title>
<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>

<!-- jQuery UI 의 datepicker 위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>


<script type="text/javascript">
	let n = 1; // 현재 문항 갯수 // 여러번 써야 한다-> 일회용인 지역번수 대신 계속 쓸 수 있는 전역변수로 해야 한다-> 이런 전역변수들을.. 프로그래머들은 몹시 싫어하며, 안 쓸 수 있으면 안 쓸 수 있는 방법을 고민해야 하며, "상태"라고 부르기도한다.
	
	/* 참고용
 	<ul id="ulQuestion">
		<li><input type="text" name="question[]" /></li>
	</ul> */
	
	function onclickAddQuestion() {
		// let n = 1; // 현재 문항 갯수 // 지역변수와 그 범위(=scope), 그리고 그 범위(=scope)가 끝났을 때
		
		if(n >= 10){
			alert("문항은 10개로 제한됩니다.")
			return false;
		}
		
		const ulQuestion = document.getElementById('ulQuestion');
		const li = document.createElement('li');
		n++;
		const innerHTML = '<pre>질문: <input type="text" name="question[]" class="inp" style="width: 680px;" onkeyup="onkeyupQuestion(this);" onchange="onkeyupQuestion(this);" /> <input type="button" value=" - " onclick="onclickDeleteQuestion(this);"/></pre><br/>'; // javascript string litteral이 왠지 안 됨 T_T
		li.innerHTML = innerHTML;
		ulQuestion.append(li);
	}
	
	
	/**
   	 * 문항을 감소해 주는 함수
   	 * n: 현재 문항 갯수
   	 * 참고: onclickAddQuestion()
   	 */
    function onclickDeleteQuestion(inputElement) {
    	const pre = inputElement.parentElement;
    	const div = pre.parentElement;
    	div.remove();
    	n--; //현재 문항 갯수를 1씩 감소
    }     
	
	
	function onclickSubmit() {
		
		var form = document.form;
		
		if(document.form.sur_title.value.trim() == ""){
			alert("제목은 필수 입력입니다.");
			return document.form.sur_title.focus(); 
		} else if(document.form.sur_sat_date.value.trim() == ""){
			alert("시작일은 필수 입력입니다.");
			return document.form.sur_sat_date.focus();
		} else if(document.form.sur_end_date.value.trim() == ""){
			alert("완료일은 필수 입력입니다.");
			return document.form.sur_end_date.focus();
		} 
		
		for(let i=0; i<=document.form['question[]'].length; i++){	
			const input = document.form['question[]'][i];
			console.log(`(${i}) input.value:`, input.value);
			
			const isValid =(input.value > '');
			if(isValid){
				continue;
				
			}
			
			alert('체크하세요!');
			input.focus();
			return;
			
		}
		
		
		/* if(document.form.question.value.trim() == ""){
			alert("완료일은 필수 입력입니다.");
			return document.form.question.focus();
		}  */
		
		/* else if($(\"input[name='question[]']\").eq(i).val()==''){
        alert("입력되지 않았습니다.");
   		 $(\"input[name='pd[]']\").eq(i).focus();
    	return false;
		} */
	
		
		form.submit();
	}

	$(function(){
	    $("#date2").datepicker({
	        showOn: "both",
	        buttonImage: "/resources/images/sub/btn/ico_data.gif",
	        buttonImageOnly: true,
	        buttonText: "Select date"
	    });
	});

	$(function(){
	    $("#date3").datepicker({
	        showOn: "both",
	        buttonImage: "/resources/images/sub/btn/ico_data.gif",
	        buttonImageOnly: true,
	        buttonText: "Select date"
	    });
	});
	
	
	//글자 수 제한 - 50글자: 제목
	$(document).ready(function() {
	    $('#test01').on('input', function() {
	        $('#test_cnt_01').html("("+$(this).val().length+" / 50)");
	 
	        if($(this).val().length > 50) {
	        	
	            $(this).val($(this).val().substring(0, 50));  //글자수 자르는 곳인가
	            $('#test_cnt_01').html("(50 / 50)");

	            setTimeout(function(){alert("제목은 50자로 이내로 제한됩니다.")}, 100);
	        }
	    });
	});

	
	/**
	 * input[name="question[]"]의 사용자 입력을 처리하는 함수
	 */
	function onkeyupQuestion(inputElement) {
		questionTrimStart(inputElement);
		questionLengthCheck(inputElement);
	}
	
	/**
	 * input[name="question[]"]의 앞을 trim해준다.
	 */
	function questionTrimStart(inputElement) {
// 		if(inputElement.value != inputElement.value.trimStart()){
// 			alert("첫 글자 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
// 		}
// 		inputElement.value = inputElement.value.trimStart();

		const trimStart = inputElement.value.trimStart();
		const isValid = (inputElement.value == trimStart);
		if (isValid) {
			return; // early return
		}
		
		inputElement.value = trimStart;
		alert("첫 글자 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
	}
	
	/**
	 * input[name="question[]"]의 길이를 확인하고, 처리한다.
	 */
	function questionLengthCheck(inputElement) {
		const isValid = (inputElement.value.length <= 50);
		if (isValid) {
			return; // early return
		}
		
		inputElement.value = inputElement.value.substring(0, 50); //글자수 자르는 곳인가
		setTimeout(function(){alert("질문은 50자로 이내로 제한됩니다.")}, 100);
	}
	
	
  /*   // 첫 글자 공백만 사용 못 하게
    //onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this);"
    function noSpaceForm2(obj) 
    {                        
        if(obj.value == " ") // 공백 체크
        {              
            alert("첫 글자 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
            obj.focus();
            obj.value = obj.value.replace(' ','');  // 공백 제거
            return false;
        }
    }  */
	

</script> 
</head>

<body>
<div id="wrap"> 
  <!--skip S-->
  <ul id="skipnavi">
    <li><a href="#gnb">주메뉴 바로가기</a></li>
    <li><a href="#contents">메인내용 바로가기</a></li>
    <li><a href="#footer">하단 바로가기</a></li>
  </ul>
  <!--skip E--> 
  
  <!-- header-->
  <div id="header">
    <h1><img src="/resources/images/header/common/logo.gif" alt="서울학교급식포털" /></h1>
    <div class="topmenu">
      <ul>
        <li class="bn"><a href="#">HOME</a></li>
        <li><a href="#">SITEMAP</a></li>
        <li class="bn"> <a href="#"><img src="/resources/images/header/common/btn_login.gif" alt="로그인" /></a></li>
      </ul>
    </div>
    <div id="gnb">
      <h2>주메뉴</h2>
      <ul class="MM">
        <li class="mainMenu first"><a href="#"><img src="/resources/images/header/common/mm_infoOff.gif" id="sel1" alt="서울학교급식소개" /></a>
         <div class="subMenu" id="sub01" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_info01Off.gif" alt="인사말" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_info02Off.gif" alt="학교급식기본방향" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_info03Off.gif" alt="학교급식현황" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_info04Off.gif" alt="학교급식 담당부서" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_safetyOff.gif" alt="학교급식위생안전" /></a>
          <div class="subMenu" id="sub02" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_safety01Off.gif" alt="학교급식 위생관리" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_safety02Off.gif" alt="식중독 대처요령" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_safety03Off.gif" alt="안전사고예방" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_safety04Off.gif" alt="안전사고 대처요령" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_safety05Off.gif" alt="위생.안전성 검사결과" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_factoryOff.gif" alt="학교급식시설관리" /></a>
          <div class="subMenu" id="sub03" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                 <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_factory01Off.gif" alt="급식환경개선사업" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_factory01Off.gif" alt="급식시설개선사례" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_factory01Off.gif" alt="급식기구관리전환" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_factory01Off.gif" alt="컨설팅신청안내" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_foodOff.gif" alt="학교급식식재료" /></a>
          <div class="subMenu" id="sub04" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                 <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_food01Off.gif" alt="식재료 구매·관리" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_food02Off.gif" alt="식재료 시장조사" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_food03Off.gif" alt="부적합 납품 업체" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_eduOff.gif" alt="영양,교육" /></a>
          <div class="subMenu" id="sub05" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_edu01Off.gif" alt="영양·식생활교육" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_edu02Off.gif" alt="추천식단" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_edu03Off.gif" alt="추천레시피" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_edu04Off.gif" alt="학교급식특색활동" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_partOff.gif" alt="알림마당" /></a>
          <div class="subMenu" id="sub06" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_part01Off.gif" alt="학교급식인력풀" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_part02Off.gif" alt="영양(교)사이야기" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_part03Off.gif" alt="조리(원)사이야기" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_part04Off.gif" alt="자유게시판" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_part04Off.gif" alt="설문조사" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="mainMenu last"><a href="#"><img src="/resources/images/header/common/mm_noticeOff.gif" alt="정보마당" /></a>
          <div class="subMenu" id="sub07" style="display:none;">
            <div class="boxSR">
              <ul class="boxSM">
                <li class="left_bg"></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_notice01Off.gif" alt="급식소식" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_notice01Off.gif" alt="연수·행사" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_notice01Off.gif" alt="업무자료실" /></a></li>
                <li class="subMenu"><a href="#"><img src="/resources/images/header/common/sm_notice01Off.gif" alt="관련법규" /></a></li>
                <li class="last subMenu"><a href="#"><img src="/resources/images/header/common/sm_notice01Off.gif" alt="FAQ" /></a></li>
                <li class="right_bg"></li>
              </ul>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <!-- //header--> 

  <!-- container-->
  <div id="container">
    <div id="contents">
      <h2>메인내용</h2>
      <p><img src="/resources/images/sub/info/sub_vimg_01.jpg" alt="건강한 급식 행복한 학교" /></p>
      <ul class="lnb">
        <li><img src="/resources/images/sub/particiation/sub_title_01.gif" alt="알림마당" /></li>
        <li><a href="#"><img src="/resources/images/sub/particiation/sub_stitle_01Off.gif" alt="학교급식인력풀" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/particiation/sub_stitle_02Off.gif" alt="영양(교)사이야기" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/particiation/sub_stitle_03Off.gif" alt="조리(원)사이야기" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/particiation/sub_stitle_04Off.gif" alt="자유게시판" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/particiation/sub_stitle_05On.gif" alt="설문조사" /></a></li>
      </ul>
      <div class="right_box">
        <h3><img src="/resources/images/sub/particiation/title_04.gif" alt="급식기구관리전환" /></h3>
        <p class="history"><img src="/resources/images/sub/history_home.gif" alt="home" /> 알림마당 <img src="/resources/images/sub/history_arrow.gif" alt="다음" /> <strong>설문조사</strong></p>
        <p class="pt30"></p>
        
      	
      <form name="form" action="/write" method="post">
      
      	<div class="tbl_box">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_type01" summary="설문조사">
            <caption>
            		설문조사
            </caption>
            <colgroup>
            <col width="15%"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="%"/>
            </colgroup>
            <tbody>
              <tr>
                <th>제목</th>
                <td colspan="5" class="tl"><input type="text" id="test01" name="sur_title" class="inp" onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this);"/></td>
                </tr>
              <tr>
                <th>시작일</th>
                <td class="tl"><input type="text" name="sur_sat_date" id="date2" class="inp" style="width:100px;" readonly /> 
                <!-- <a href="#"><img src="/resources/images/sub/btn/ico_data.gif" alt="달력" /></a> -->
                </td>
                <th>종료일</th>
                <td class="tl"><input type="text" name="sur_end_date" id="date3" class="inp" style="width:100px;" readonly /> 
                <!-- <a href="#"><img src="/resources/images/sub/btn/ico_data.gif" alt="달력" /></a> -->
                </td>
                <td class="tl" colspan="2"></td>
              </tr>
              <tr>
                <th>문항수</th>
                <td colspan="5" class="tl">
                	<input type="button" value="문항 추가" onclick="onclickAddQuestion();" />
                </td>
                </tr>
              <tr>
               <td colspan="1" class="tl">
               	   <div class="research" style="width: 735px;">
                        <ul id="ulQuestion" >
<!--                         	<li><pre>질문: <input type="text" name="question[]" class="inp" style="width: 680px;" id="test02" onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this);"/></pre><br/></li>	 -->
							<li>
								<pre>질문: <input type="text" name="question[]" class="inp" style="width: 680px;" onkeyup="onkeyupQuestion(this);" onchange="onkeyupQuestion(this);"/></pre>
								<br/>
							</li>
                        </ul>
                        
					</div>
               </td>
              </tr>
            </tbody>
          </table>
          
          <p class="pt40"></p>
          <!-- btn--> 
          <span class="bbs_btn"> 

          <span class="per_l"><a href="#" class="pre_r" onclick="onclickSubmit();">등록</a></span>
          <span class="wte_l"><a href="/researchList" class="wte_r">취소</a></span>

          </span> 
          <!-- //btn--> 
          
        </div>
      </form>
        
        
      </div>
      
      

      
      <p class="bottom_bg"></p>
    </div>
  </div>
  <!-- //container-->
  
  <div id="footer">
    <h2>하단</h2>
    <address>
    110-781) 서울특별시 종로구 송월길 48(신문로 2-77)
    </address>
    <p>COPYRIGHT(C) 2013 <b>SEOUL metropolitan office of education</b> ALL RIGHT RESERVED</p>
    <ul>
      <li class="bn"><a href="#">개인정보보호정책</a></li>
      <li><a href="#">이메일 무단수집거부</a></li>
      <li><a href="#">뷰어프로그램</a></li>
      <li><a href="#">저작권보호</a></li>
      <li><a href="#">서울학교급식 배너다운로드</a></li>
    </ul>
  </div>
</div>
</body>
</html>

