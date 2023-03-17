$(document).ready(function(){
  $("#edit_setting").find(".attachments").addClass("row")

	$('.select2').select2();

  /////////////////////// SELECT2 FONT COMBO ///////////////////////////////////
	function formatStateSS (state) {
		var option = $(state.element);
		url = option.data('url');
		console.log(url)
		if (!state.id) {
			return state.text;
		}
		var $state = $(
			"<div class='d-flex justify-content-between'><div>" + state.text + "</div><span><img src='" + '' +"' width='200px'></span></div>"
		);
		return $state 
	};

	$('.font-combo-select2').select2({
		templateResult: formatStateSS
	});
})