$(document).ready(function () {
	
	$('input[type="tel"]').inputmask('+9 (999) 999-99-99');
	
	$(document).on('change', '#mark', function () {
		var mark = $(this),
			model = $('#model');
		model.empty().prop('disabled', true);
		if (mark.val() == '') {
			return ;
		}
		$.ajax({
			url: '/models/get/' + mark.val() + '.json',
			cache: false
		}).done(function (request) {
			model.prop('disabled', false);
			for (i in request.list) {
				$('<option/>').val(i).text(request.list[i]).appendTo(model);
			}
		});
	}).on('click', '.thumbs img', function () {
		$('.thumbs img').removeClass('active');
		$(this).addClass('active');
		$('img.full-image').attr('src', $(this).data('src'));
	});
	
	$('.thumbs img').not('.active').each(function () {
		var img = new Image();
		img.src = $(this).data('src');
	});
});