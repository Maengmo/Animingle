	$("#pic").on('change',function(){
        var fileName = $("#pic").val();
        $(".file-name").val(fileName);
    });
	
	$('.place-list').on('click', function(){
	    if ($('#addside').width() === 0) {
	        $('#addside').css('width', '600px');
	        $('#addside').css('overflow', 'scroll');
	        $('#addside').css('overflow-x', 'hidden');
	        $('#addside').css('border-width', '1px');
	        $(this).css('background-color', 'yellow');
	    } else {
	        $('#addside').css('width', '0');
	        $('#addside').css('overflow', 'hidden');
	        $('#addside').css('border-width', '0px');
	        $('.place-list').css('background-color', '');
	    }
	});
	
	$('#close').on('click', function(){
	    $('#addside').css('display', 'none');
	});
	
	$('#review-box').on('click', function(){
	    if ($('#review-add').is(':visible')) {
	        $('#review-add').slideUp('slow');
	    } else {
	        $('#review-add').slideDown('slow');
	    }
	});
	
	var tags = document.getElementsByClassName('tag');

	function selectTag() {
	  for (var i = 0; i < tags.length; i++) {
	    tags[i].classList.remove('selected');
	  }
	  this.classList.add('selected');
	}

	for (var i = 0; i < tags.length; i++) {
	  tags[i].addEventListener('click', selectTag);
	}