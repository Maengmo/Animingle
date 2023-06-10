DecoupledEditor
	.create(document.querySelector('#editor'), {
		ckfinder: {
			uploadUrl: '/animingle/fileupload' // 내가 지정한 업로드 url (post로 요청감)
		},
	
		toolbar: {
	
			items: [
				        'undo', 'redo',
				        '|', 'fontfamily', 'fontsize', 'fontColor', 'fontBackgroundColor',
				        '|', 'bold', 'italic', 'strikethrough', 'subscript', 'superscript', 'code',
				        '|', 'link', 'uploadImage', 'blockQuote', 'codeBlock',
				        '|', 'bulletedList', 'numberedList', 'todoList', 'outdent', 'indent'
				   ],
	
			shouldNotGroupWhenFull: true
	
		},
	
		language: 'ko',
	
	})
	.then(editor => {
		const toolbarContainer = document.querySelector('#toolbar-container');
	
		toolbarContainer.appendChild(editor.ui.view.toolbar.element);
	
	})
	.catch(error => {
		console.error(error);
	});

$("form").on('submit',function(){
    html = $("#editor").html();
    $("#editor1").val(html);
})