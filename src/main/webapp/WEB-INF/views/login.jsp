<%@ page session="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>서울학교급식포털</title>
	<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
	<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<!-- 	<script type="text/javascript" src="/resources/jquery-1.10.2.min.js"></script> -->
<!-- 	<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script> -->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.0/jquery.min.js" integrity="sha512-ijLvQMMXgWAO85zfDbKeoqNR7015wrZI42XGYorITKkG0sVlP4t+Rt5Dl9EKDkrPxGrWZmVCUW5oIXkVOrnCiw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script type="text/javascript">
		function login() {
			const { id, pw } = document.form;
			
			var settings = {
			  "url": "/loginDo",
			  "method": "POST",
			  "timeout": 0,
			  "headers": {
			    "Content-Type": "application/x-www-form-urlencoded"
			  },
			  "data": {
			    "id": id.value,
			    "pw": pw.value
			  }
			};

			$.ajax(settings).done(function (response) {
			  if (response) {
				  // login success
				  location.href = '/researchList';
				  
			  } else {
				  // login fail
				  alert('로그인에 실패 하였습니다.');
			  }
			});
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
        <li class="mainMenu"><a href="#"><img src="/resources/images/header/common/mm_partOff.gif" alt="참여마당" /></a>
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
        <li class="mainMenu last"><a href="#"><img src="/resources/images/header/common/mm_noticeOff.gif" alt="알림마당" /></a>
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
        <li><img src="/resources/images/sub/etc/sub_title_01.gif" alt="정보마당" /></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_01Off.gif" alt="로그인" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_02Off.gif" alt="본인확인" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_03Off.gif" alt="관련기관링크" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_04On.gif" alt="개인보호정책" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_05Off.gif" alt="이메일무단수집거부" /></a></li>
        <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_06Off.gif" alt="저작권보호" /></a></li>
         <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_07Off.gif" alt="뷰어프로그램" /></a></li>
         <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_08Off.gif" alt="팝업관리" /></a></li>
         <li><a href="#"><img src="/resources/images/sub/etc/sub_stitle_09Off.gif" alt="사이트맵" /></a></li>
      </ul>
      <div class="right_box">
        <h3><img src="/resources/images/sub/etc/title_01.gif" alt="로그인" /></h3>
        <p class="history"><img src="/resources/images/sub/history_home.gif" alt="home" /> 기타 <img src="/resources/images/sub/history_arrow.gif" alt="다음" /> <strong>로그인</strong></p>
        <p class="pt30"></p>
       
       <!-- login-->
       	<fieldset>
        	<legend>로그인</legend>
        	<div class="login">            
            	<h4><img src="/resources/images/sub/etc/login_img_01.gif" alt="아이디를 입력하세요" /></h4>
<!--                 <dl> -->
<!--                 	<dt>아이디</dt> -->
<!--                     <dd><input type="text" class="inp" name="id"style="width:180px;" /></dd> -->
                    
<!--                     <br /> -->
                    
<!--                     <dt>비밀번호</dt> -->
<!--                     <dd><input type="text" class="inp" name="pw" style="width:180px;" /></dd> -->
                    
                    
<!--                     <dt></dt> -->
<!--                     <dd> -->
<!--                     	<a href="#"><img src="/resources/images/sub/etc/login_btn.gif" alt="로그인" /></a> -->
<!--                     </dd> -->
<!--                 </dl> -->
				
				<form name="form">
					<div>
						<p>
							아이디:
							<input type="text" class="inp" name="id" style="width:180px;" />
						</p>
						<p>
							비밀번호:
							<input type="password" class="inp" name="pw" style="width:180px;" />
						</p>
						<p>
							<a href="#" onclick="login();"><img src="/resources/images/sub/etc/login_btn.gif" alt="로그인" /></a>
						</p>
					</div>
				</form>
				
                
                <ul class="login_text">
                	<li>학생, 학부모, 시민은 별도의 회원가입 없이 본인확인(아이핀인증 또는 실명인증)만으로 <br />서비스 이용이 가능합니다. (사용자 등록 불가)</li>
                    <li>서울특별시교육청(학교 포함) 소속 교직원은 나이스 `와 인증서로 로그인을 하시기 바랍니다.<br />
						<span class="f_eb7c10">※ 로그인이 되지 않을 경우, 서울시교육청 홈페이지에서 먼저 사용자 등록을 하시기 바랍니다.</span>
					</li>
                </ul>
                
            </div>	
        	
        </fieldset>
       
       <!-- //login--> 
        
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