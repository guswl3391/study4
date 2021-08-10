<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>서울학교급식포털</title>
	<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
	<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
		let n = 1; // 현재 문항 갯수 // 여러번 써야 한다-> 일회용인 지역번수 대신 계속 쓸 수 있는 전역변수로 해야 한다-> 이런 전역변수들을.. 프로그래머들은 몹시 싫어하며, 안 쓸 수 있으면 안 쓸 수 있는 방법을 고민해야 하며, "상태"라고 부르기도한다.
	
		function onclickAddQuestion() {
			// let n = 1; // 현재 문항 갯수 // 지역변수와 그 범위(=scope), 그리고 그 범위(=scope)가 끝났을 때
			
			if(n >= 10){
				alert("문항은 10개로 제한됩니다.")
				return false;
			}
			
			const divQuestion = document.getElementById('divQuestion');
			const p = document.createElement('p');
			n++;
			const innerHTML = '문항' + n + ': <input type="text" name="question[]" />'; // javascript string litteral이 왠지 안 됨 T_T
			p.innerHTML = innerHTML;
			divQuestion.append(p);
		}
	</script>
</head>


<body>
	<form action="/write" method="POST">
		<p>
			제목: <input type="text" name="sur_title" />
		</p>
		<div id="divQuestion">
			<p>
				<input type="button" value="문항 추가" onclick="onclickAddQuestion()" />
			</p>

			<p>
				문항1: <input type="text" name="question[]" />
			</p>
		</div>
		<p>
			<input type="submit" value="전송" />
		</p>
	</form>
</body>

</html>
