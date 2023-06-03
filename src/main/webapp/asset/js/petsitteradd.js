
   ClassicEditor.create( document.querySelector( '#editor' ), {
      removePlugins: [ 'Heading' ],
      language: "ko"
   });
   
  	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
            }
        }).open();
    };
    
	var today = new Date();
	today.setDate(today.getDate() + 1); // 현재 날짜에 1을 더해서 내일로 설정
	
	var startDateInput = document.getElementById('start-date');
	
	// 현재 날짜로 기본 설정
	startDateInput.value = today.toISOString().substring(0, 10);
    
    //종료 날짜 체크
    function checkDate() {
    	if ($('#start-date').val() > $('#end-date').val()) {
    		alert("시작 날짜 이후의 날짜를 선택해주세요.");
    		$('#end-date').val('');
    	} 
    };
	  
   