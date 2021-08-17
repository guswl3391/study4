<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>서울학교급식포털</title>
<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .graph {
        flex: 6; 
        display: flex;
        height: 200px;
    }
    .graph > .question {
        flex: 1;
    }

    .graph > .question:nth-child(odd) > .bar {
        background-color: red;
    }
    
    .graph > .question:nth-child(even) > .bar {
        background-color: blue;
    }
    
    .graph > .question > .text {
        text-align: center;
    }
</style>
<script type="text/javascript">

	/*
	 * 설문조사 상세 페이지 내 사유 전체 보기 popup
	 */
	function openPopup(sur_seq) {
		var popUrl = '/researchChoiceReasonPopup?sur_seq=' + sur_seq;
		var popName = 'researchChoiceReasonPopup';
		var popOption = "top=50, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popName, popOption); // chrome에서는 name을 안 적으면, 그냥 새 탭으로 연다!
	}
</script>
</head>

<body>
	<!-- w100% h545px -->
	<div class="pop">
		<div class="pop_box">
			<h1>결과보기</h1>
			<div class="pop_list">
				<h2>
					 <span class="rearch_end">투표종료</span>
				</h2>
				<div class="rearch_box">
				
				<c:forEach items="${resultList}" var="map" varStatus="status">
					<p style="text-align: left;">
					<b>${status.count}. ${map.suri_title}</b>
					</p>
					<br/>
					<div style="display: flex;">
						<div class="graph">
							<c:forEach items="${map.nameList}" var="name" varStatus="nameVarStatus">
					            <div class="question">
					                <div style="height: ${(map.maxAnswer > 0) ? (1 - (map[Integer.toString(nameVarStatus.count)] / map.maxAnswer)) * 100 : 100}%;"></div>
					                <div class="bar" style="height: ${(map.maxAnswer > 0) ? (map[Integer.toString(nameVarStatus.count)] / map.maxAnswer) * 100 : 0}%;"></div>
					                <div class="text">${name}</div>
					            </div>
				            </c:forEach>
			            </div>
				        
				        <div style="flex: 4;">
				            <p>① 매우 그렇다: ${map['1']}명</p>
				            <p>② 조금 그렇다: ${map['2']}명</p>
				            <p>③ 그　 렇　다: ${map['3']}명</p>
				            <p>④ 조금 아니다: ${map['4']}명</p>
				            <p>⑤ 매우 아니다: ${map['5']}명</p>
				        </div>
				    </div>
				    
				    <br/>
				    <br/>
				    <br/>
				</c:forEach>

				
				</div>

			</div>
			<p class="pt20"></p>
			<div class="pop_btn">
				<span class="blue_l"><a href="#" class="blue_r" onclick="window.close();">닫기</a></span> 
				<span class="gray_l"><a href="#" class="gray_r" onclick="openPopup(${sur_seq}); return false;">사유보기</a></span>
			</div>
		</div>

	</div>
</body>
</html>

