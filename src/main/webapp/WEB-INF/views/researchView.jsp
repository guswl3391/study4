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

<script type="text/javascript" >

/* 참고용
              	   <div class="research">
                      <p>${status.count}. ${item.suri_title }</p>
                      <input type="hidden" name="suri_seq[]" value="${item.suri_seq }">
                      <input type="hidden" name="answer[]" value="">
                      
                       <ul>
                        <li>
                        	<input type="radio" id="radio1${item.suri_seq}" name="radio${item.suri_seq}" value="1" onchange="onchangeRadio(this);">
				  				<label for="radio1${item.suri_seq}">① 매우 그렇다</label>
 */
	function onchangeRadio(radioObject) {
		const { value } = radioObject;
		const li = radioObject.parentElement;
		const ul = li.parentElement;
		const div = ul.parentElement;
		const input = div.querySelector('input[name="answer[]"]');
		input.value = value;
	}

	 
 	function onclickSubmit() {
 		
 		const isConfirm = confirm("답변 제출 후에는 수정이 불가능합니다. 답변 제출하시겠습니까?");
		
 		// validate
 		if(isConfirm==false){
 			return false; //early return
 		}
 		
 		document.form.submit();
 		
	 }

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
        <li class="bn"> <a href="/login"><img src="/resources/images/header/common/btn_login.gif" alt="로그인" /></a></li>
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
        <li><a href="/researchList"><img src="/resources/images/sub/particiation/sub_stitle_05On.gif" alt="설문조사" /></a></li>
      </ul>
      <div class="right_box">
        <h3><img src="/resources/images/sub/particiation/title_04.gif" alt="급식기구관리전환" /></h3>
        <p class="history"><img src="/resources/images/sub/history_home.gif" alt="home" /> 알림마당 <img src="/resources/images/sub/history_arrow.gif" alt="다음" /> <strong>설문조사</strong></p>
        <p class="pt30"></p>
        
       <form action="/researchSend" method="POST" name="form">
        <input type="hidden" name="pno" value="1"> <!-- 아직 처리해야 함 -->
		<input type="hidden" name="sur_seq" value="${surveyVO.sur_seq }">
		
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
                <td colspan="5" class="tl"><strong>${surveyVO.sur_title}</strong></td>
                </tr>
              <tr>
                <th>시작일</th>
                <td class="tl"><fmt:formatDate value="${surveyVO.sur_sat_date}"/></td>
                <th>종료일</th>
                <td class="tl"><fmt:formatDate value="${surveyVO.sur_end_date}"/></td>
                <th>결과확인</th>
                <td class="tl"><img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기" /></td>
              </tr>
              <tr>
                <th>문항수</th>
                <td colspan="5" class="tl">${list.size() }개</td>
                </tr>
              <tr>
               <td colspan="6" class="tl">
               
               	<c:forEach items="${list}" var="item" varStatus="status">
               	<!-- forEach: items의 들어있는 개수만큼 반복적으로 출력한다. -->
               	<!-- 반복되면서 list의 item을 순서대로 가져와서 var 변수(여기서는 item)로 만들어줌! -->
               	<!-- var 변수를 가지고 잘하면 근사한 리스트가 완성됨! -->
               	<!-- varStatus="status"를 통해서 index를 얻어올 수 있음 -->
               
               	   <div class="research">
                       <p>${status.count}. ${item.suri_title }</p>
                       <input type="hidden" name="suri_seq[]" value="${item.suri_seq }">
                       <input type="hidden" name="answer[]" value="">
                       
                        <ul>
	                        <li>
	                        	<input type="radio" id="radio1${item.suri_seq}" name="radio${item.suri_seq}" value="1" onchange="onchangeRadio(this);">
					  <label for="radio1${item.suri_seq}">① 매우 그렇다</label>
	                        </li>
	                        <li>
	                        	<input type="radio" id="radio2${item.suri_seq}" name="radio${item.suri_seq}" value="2" onchange="onchangeRadio(this);">
					  <label for="radio2${item.suri_seq}">② 조금 그렇다</label>
	                        </li>
	                        <li>
	                        	<input type="radio" id="radio3${item.suri_seq}" name="radio${item.suri_seq}" value="3" onchange="onchangeRadio(this);">
					  <label for="radio3${item.suri_seq}">③ 그렇다</label>
	                        </li>
	                        <li>
	                         	<input type="radio" id="radio4${item.suri_seq}" name="radio${item.suri_seq}" value="4" onchange="onchangeRadio(this);">
					  <label for="radio4${item.suri_seq}">④ 조금 아니다</label>
	                        </li>
	                        <li>
	                        	<input type="radio" id="radio5${item.suri_seq}" name="radio${item.suri_seq}" value="5" onchange="onchangeRadio(this);">
					  <label for="radio5${item.suri_seq}">⑤ 매우 아니다</label>
	                        </li>
	                        <li>선택사유 <input type="text" name="choice_reason[]" value="" class="inp" style="width:200px;" /> </li>
                        </ul>
					</div>
					
                 </c:forEach>  
                    
               	  <!--  <div class="research">
                       <p>1. 위생불량 납품단절 편함</p>
                        <ul>
                        <li>① 매우그렇다</li>
                        <li>② 조금그렇다</li>
                        <li>③ 그렇다</li>
                        <li>④ 조금 아니다</li>
                        <li>⑤ 매우 아니다</li>
                        <li>선택사유 <input type="text" id="aa" name="aa" class="inp" style="width:200px;" /> </li>
                        </ul>
					</div>
					
					
               	   <div class="research">
                       <p>1. 위생불량 납품단절 편함</p>
                        <ul>
                        <li>① 매우그렇다</li>
                        <li>② 조금그렇다</li>
                        <li>③ 그렇다</li>
                        <li>④ 조금 아니다</li>
                        <li>⑤ 매우 아니다</li>
                        <li>선택사유 <input type="text" id="aa" name="aa" class="inp" style="width:200px;" /> </li>
                        </ul>
					</div> -->
                    
                    
               </td>
              </tr>
            </tbody>
          </table>
          
          <p class="pt40"></p>
          <!-- btn--> 
          <span class="bbs_btn"> 

          <span class="wte_l"><a href="/researchList" class="wte_r">목록</a></span>
          <span class="wte_l"><a href="" class="wte_r" onclick="return onclickSubmit();">답변 등록</a></span>
          
          

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
