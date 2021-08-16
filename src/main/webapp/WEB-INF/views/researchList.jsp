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


	/**
	 * popup으로 넘어가는 함수
	 * @param sur_seq 제목 번호 
	 */
	function searchPopup(sur_seq){
		var popUrl = '/researchPopup?sur_seq=' + sur_seq;
		var popName = 'researchPopup';
		var popOption = "top=50, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popOption);

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
        
       
        <div class="tbl_box">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl_type01" summary="설문조사">
            <caption>
            설문조사
            </caption>
            <colgroup>
	            <col width="8%"/>
	            <col width="*%"/>
	            <col width="15%"/>
	            <col width="15%"/>
	            <col width="9%"/>
	            
	            <col width="9%"/>
	            <col width="10%"/>
            </colgroup>
            <tbody>
              <tr>
                <th>NO</th>
                <th>제목</th>
                <th>시작일</th>
                <th>마감일</th>
                <th>완료여부</th>
                
                <th>참여여부</th>
                <th>결과확인</th>
              </tr>
              
              <!-- admin인 경우 -->
              <c:if test ="${surveyPeopleVO != null && surveyPeopleVO.user_type == 'admin'}">
	              <c:forEach items="${list}" var="item">
					<tr>
		                <td>${item.rnum}</td>
		                <td class="tl"><a href="/researchEdit?sur_seq=${item.sur_seq}">${item.sur_title}</a></td>
		                <td><fmt:formatDate value="${item.sur_sat_date}"/></td>                
		                <td><fmt:formatDate value="${item.sur_end_date}"/></td>
		                <td>${item.finish_yn}</td>
		                
		                <td>${item.answer_yn}</td>
		                <td><a href="#" onclick="searchPopup(${item.sur_seq}); return false;"><img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기" /></a></td>
	              	</tr>
				  </c:forEach>
              </c:if>
              
              <!-- user로 로그인한 경우 -->
              <c:if test ="${surveyPeopleVO != null && surveyPeopleVO.user_type == 'user' }">
				  <c:forEach items="${list}" var="item">
					<tr>
		                <td>${item.rnum}</td>
		               <c:choose>
		                	<c:when test="${'N' eq item.answer_yn }">
		                		<td class="tl"><a href="/researchView?sur_seq=${item.sur_seq}">${item.sur_title}</a></td>
		                	</c:when>
		                	<c:otherwise>
								<td class="tl">
									<c:out value="==이미 참여한 설문조사입니다.==" escapeXml="true"/>
								</td>
							</c:otherwise>
		                </c:choose>
		                <td><fmt:formatDate value="${item.sur_sat_date}"/></td>                
		                <td><fmt:formatDate value="${item.sur_end_date}"/></td>
		                <td>${item.finish_yn}</td>
		                
		                <td>${item.answer_yn}</td>
		                <c:choose>
		                	<c:when test="${item.isAfterEndDate()}">
		                		<td>
		                			<a href="#" onclick="searchPopup(${item.sur_seq}); return false;">
		                				<img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기"/>
	                				</a>
                				</td>
		                	</c:when>
		                	<c:otherwise>
								<td>
		                			<a href="#" onclick="alert('마감일 이후에 결과 보기가 가능합니다.');">
		                				<img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기"/>
	                				</a>
                				</td>
							</c:otherwise>
		                </c:choose>
	              	</tr>
				  </c:forEach>
              </c:if>
              
               <!-- 비로그인 경우 -->
              <c:if test ="${surveyPeopleVO == null || surveyPeopleVO.user_type == null}">
	              <c:forEach items="${list}" var="item">
					<tr>
		                <td>${item.rnum}</td>
              		    <td class="tl">${item.sur_title}</td>
		                <td><fmt:formatDate value="${item.sur_sat_date}"/></td>                
		                <td><fmt:formatDate value="${item.sur_end_date}"/></td>
		                <td>${item.finish_yn}</td>
		                
		                <td>${item.answer_yn}</td>
		                
		                <c:choose>
		                	<c:when test="${item.isAfterEndDate()}">
		                		<td>
		                			<a href="#" onclick="searchPopup(${item.sur_seq}); return false;">
		                				<img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기"/>
	                				</a>
                				</td>
		                	</c:when>
		                	<c:otherwise>
								<td>
		                			<a href="#" onclick="alert('마감일 이후에 결과 보기가 가능합니다.');">
		                				<img src="/resources/images/sub/btn/btn_view.gif" alt="결과보기"/>
	                				</a>
                				</td>
							</c:otherwise>
		                </c:choose>
	              	</tr>
				  </c:forEach>
               </c:if>
               
            </tbody>
          </table>
          
          <!-- paging-->
          <ul class="paging">
            <li><a href="/researchList${pageMaker.makeTopPage()}" title="맨 처음 페이지로 가기"><img src="/resources/images/sub/btn/pre_01.gif"  alt="맨 처음 페이지로 가기" /></a></li>
            <li><a href="/researchList${pageMaker.makePrevPage()}" title="이전 페이지로 가기"><img src="/resources/images/sub/btn/pre.gif" alt="이전 페이지로 가기" /></a></li>
            
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" >
		    	<li><a href="researchList${pageMaker.makeSearch(idx)}" title="${idx}페이지" class="${pageMaker.isCurPage(idx) ? 'on' : ''}}"> ${idx}</a></li>
		    </c:forEach>
            
            <li><a href="/researchList${pageMaker.makeNextPage()}" title="다음 페이지로 가기" ><img src="/resources/images/sub/btn/next.gif" alt="다음 페이지" /></a></li>
            <li><a href="/researchList${pageMaker.makeLastPage()}" title="마지막 페이지로 가기"><img src="/resources/images/sub/btn/next_01.gif" alt="마지막 페이지" /></a></li>
          </ul>
          <!-- //paging--> 
          
          <!-- btn--> 
          <span class="bbs_btn"> 

			
			<c:if test ="${surveyPeopleVO != null && surveyPeopleVO.user_type == 'admin'}">
          		<span class="per_l"><a href="/researchCreate" class="pre_r">글쓰기</a></span>
        	</c:if>

          </span> 
          <!-- //btn--> 
          
        </div>
        
        <form name="form" action="/researchList" method="GET">
	        <div class="search_box">
	          <select>
	            <option>제목</option>
	          </select>
	          <input type="text" name="keyword" value="${keyword}" />
	          <a href="#" onclick="document.form.submit(); return false;"><img src="/resources/images/sub/btn/btn_serch.gif" alt="검색" /></a> </div>
	      	</div>
      	</form>
      
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
