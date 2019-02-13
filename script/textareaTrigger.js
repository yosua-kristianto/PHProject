function countChar(e)
{
	jQuery('#capt').keyup(function () {
		var max = 255;
		var len = jQuery(this).val().length;
		if (len >= max) {
			jQuery('#charCount').text(' you have reached the limit');
			jQuery('#Uploadbtn').attr('disabled', 'disabled');
		} else {
			var char = max - len;
			jQuery('#charCount').text(char + ' characters left');
			jQuery('#Uploadbtn').removeAttr('disabled');
		}
	});
}	