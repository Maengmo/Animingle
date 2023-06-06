$("#pic").on('change',function(){
    var fileName = $("#pic").val();
    $(".file-name").val(fileName);
});
    
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
};


//유효성 검사 - 1. 아이디
//아이디 정규식 (첫번째 글자 소문자로 시작, 영어 대소문자 사용 가능, 6자-12자 이내)
var idRegExp = /^[a-z][a-zA-z0-9]{5,11}$/; 
//유효성 검사 결과 나타낼 div 생성
var idresultDiv = document.createElement("div");
idresultDiv.style.color = "#FC5230";
idresultDiv.style.marginTop = "-20px";
idresultDiv.style.marginBottom = "20px";

var parentDiv = document.getElementById("login-div").parentNode;
parentDiv.insertBefore(idresultDiv, document.getElementById("login-div").nextSibling);


$('.id').on('keyup', function() {
	
	var id = $('.id').val();

	if (!idRegExp.test(id)) {
		
		idresultDiv.textContent = "아이디는 영문 대소문자와 숫자 포함 6~12자리로 입력해주세요. (숫자로 시작 불가)";
		$('.id').css('outline', '1px solid #FC5230');
		
		return false;
	} else {
		
		$('.id').css('outline', '1px solid #ADB5BD');
		idresultDiv.textContent = "";
		
		
	}

});
	
	
//유효성 검사 - 2. 비밀번호
var pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;
//유효성 검사 결과 나타낼 div 생성
var pwresultDiv = document.createElement("div");
pwresultDiv.style.color = "#FC5230";
pwresultDiv.style.marginTop = "-20px";
pwresultDiv.style.marginBottom = "20px";

var parentDiv = document.getElementById("pw1").parentNode;
parentDiv.insertBefore(pwresultDiv, document.getElementById("pw1").nextSibling);


$('#pw1').on('keyup', function() {
	
	var pw = $('#pw1').val();

	if (!pwRegExp.test(pw)) {
		
		pwresultDiv.textContent = "비밀번호는 영문 대소문자와 숫자 포함 6~12자리로 입력해주세요.";
		$('#pw1').css('outline', '1px solid #FC5230');
		
		return false;
	} else {
		
		$('#pw1').css('outline', '1px solid #ADB5BD');
		pwresultDiv.textContent = "";
		
		
	}

});
	
	
//유효성 검사 - 3. 비밀번호 확인
var pw2resultDiv = document.createElement("div");
pw2resultDiv.style.color = "#FC5230";
pw2resultDiv.style.marginTop = "-20px";
pw2resultDiv.style.marginBottom = "20px";

var parentDiv = document.getElementById("pw2").parentNode;
parentDiv.insertBefore(pw2resultDiv, document.getElementById("pw2").nextSibling);

$('#pw2').on('keyup', function() {
	if ($('#pw1').val() != $('#pw2').val()) {
		
		$('#pw2').css('outline', '1px solid #FC5230');
		pw2resultDiv.textContent = "입력하신 비밀번호와 불일치합니다.";
		
	} else {
		
		$('#pw2').css('outline', '1px solid #0256AA');
		pw2resultDiv.textContent = "입력하신 비밀번호와 일치합니다.";
		pw2resultDiv.style.color = "#0256AA";
	}

});
	
	
//유효성 검사 - 4. 닉네임
var nicknameRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
//유효성 검사 결과 나타낼 div 생성
var nickresultDiv = document.createElement("div");
nickresultDiv.style.color = "#FC5230";
nickresultDiv.style.marginTop = "-20px";
nickresultDiv.style.marginBottom = "20px";

var parentDiv = document.getElementById("nickname-div").parentNode;
parentDiv.insertBefore(nickresultDiv, document.getElementById("nickname-div").nextSibling);

$('#nickname').on('keyup', function() {
	
	pw2resultDiv.textContent = "";
	$('#pw2').css('outline', '1px solid #ADB5BD');
	
	
	var nickname = $('#nickname').val();

	if (!nicknameRegExp.test(nickname)) {
		
		nickresultDiv.textContent = "닉네임은 2~10 글자 이내로 입력해주세요.";
		$('#nickname').css('outline', '1px solid #FC5230');
		
		return false;
	} else {
		
		$('#nickname').css('outline', '1px solid #ADB5BD');
		nickresultDiv.textContent = "";
		
		
	}

});
	
	
//유효성 검사 - 5. 이름
var nameRegExp = /^[가-힣]{2,8}$/;

//유효성 검사 결과 나타낼 div 생성
var nameresultDiv = document.createElement("div");
nameresultDiv.style.color = "#FC5230";
nameresultDiv.style.marginTop = "-20px";
nameresultDiv.style.marginBottom = "20px";

var parentDiv = document.getElementById("name-div").parentNode;
parentDiv.insertBefore(nameresultDiv, document.getElementById("name-div").nextSibling);

$('#name').on('keyup', function() {
	
	var name = $('#name').val();

	if (!nameRegExp.test(name)) {
		
		nameresultDiv.textContent = "이름은 한글 2~8 글자 이내로 입력해주세요.";
		$('#name').css('outline', '1px solid #FC5230');
		
		return false;
	} else {
		
		$('#name').css('outline', '1px solid #ADB5BD');
		nameresultDiv.textContent = "";
		
		
	}

});


//유효성 검사 - 6. 생년월일
$('.birthday').on('change', function() {
		
		var birthday = new Date($('.birthday').val());
		
		var today = new Date();

	    //생년월일 체크
	    if (birthday >= today) {
	    	alert("생년월일은 현재 날짜 이후의 날짜를 선택할 수 없습니다. \n다시 선택해주세요.")
	    	$('.birthday').val('');
	    	
	    } else {
	    	$('#tel1').focus();
	    }
	    
	    
	    
	});
	
	
//유효성 검사 - 7. 전화번호
var telRegExp = /^[0-9]{3}$/;
var tel2RegExp = /^[0-9]{3,4}$/;
$('#tel1').on('keyup', function() {
	
	var tel1 = $('#tel1').val();

	if (!telRegExp.test(tel1)) {
		
		$('#tel1').css('outline', '1px solid #FC5230');
		
	} else {
		
		$('#tel1').css('outline', '1px solid #ADB5BD');
		
		
	}		
});

$('#tel2').on('keyup', function() {
	
	var tel2 = $('#tel2').val();

	if (!tel2RegExp.test(tel2)) {
		
		$('#tel2').css('outline', '1px solid #FC5230');
		
	} else {
		
		$('#tel2').css('outline', '1px solid #ADB5BD');
		
		
	}

});

$('#tel3').on('keyup', function() {
		
	var tel3 = $('#tel3').val();

	if (!tel2RegExp.test(tel3)) {
		
		$('#tel3').css('outline', '1px solid #FC5230');
		
	} else {
		
		$('#tel3').css('outline', '1px solid #ADB5BD');
		
			
		}

});


//아이디 중복 체크
$('#dupli-Btn').on('click', function() {
		
	$.ajax({
		type : 'POST',
		url : '/animingle/user/checkid.do',
		data : {
			id : $('.id').val()
		},
		dataType : 'json',
		success : result => {
			if (result.result == 1) {
				alert("중복된 아이디가 존재합니다.");
				$('.id').val('');
				$('.id').focus();
			} else {
				alert("사용 가능한 아이디입니다.");
				$('#pw1').focus();
			}
		},
		error : (a,b,c) => console.log(a,b,c)
	});
	
});

   
 