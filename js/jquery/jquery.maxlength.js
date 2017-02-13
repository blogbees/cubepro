/*
 * jQuery maxlength validator - plugin
 * 
 * Version 1.0
 * 
 * Copyright (c) 2009 - Aspire Systems
 * 
 * Author - Sajeev Sreekantan
 * 
 * Usage:
 * 		$('#elementId').maxlength({limit:10, feedbackElement:'#feedbackElementId'});
 * 		
 * 		elementId 		  - The input element id of HTML
 * 		feedbackElementId - The 'div' element in which characters left is displayed  
 *
 * 
 * Depends:
 * 		jquery.js, jquery.ui.core.js, jquery.draggable.js, jalert.js
 */
(function($){
	$.fn.maxlength = function(options) {
		var settings = $.extend({}, $.fn.maxlength.defaultSettings, options);
		return this.each(function(){
			var element = this;
			//Update the status initially
			updateStatus(element.value.length);
			$(element).keydown(function(event){
				var key = event.keyCode;
				var maxLength = settings.limit;
				var length = element.value.length;
  				//Allowed keys
  				var allowedKeys = [8, 9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 91, 92, 93, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123];
  				//If key is not found in the above set, then check for length
				if(jQuery.inArray(key, allowedKeys) == -1) {
					if(length >= maxLength) {
						//Handle paste operation specially
						if(event.ctrlKey) {
							if (key == 86) {
								event.preventDefault();
							}
						} else {
							event.preventDefault();
						}	
					}  
				}
	     	});
	     	
	     	$(element).keyup(function(event){
	     		updateStatus(element.value.length);
	     	});
	     	
			$(element).blur(function(event){
				if (element.value.length > settings.limit) {
					jAlert(settings.errorText, settings.errorTitle, function(isConfirmed) {
																			if (isConfirmed) {
																				var elementData = element.value.substring(0, settings.limit);
																				$(element).val(elementData);
																			}
																		});
				}
				updateStatus(element.value.length);
	     	});  
	 	});

	 	//Update the feedback element
	 	function updateStatus(length) {
	 		if (settings.feedbackElement != null) {
				var charactersLeft = settings.limit - length;
				charactersLeft = (charactersLeft < 0)? 0 : charactersLeft; 
				$(settings.feedbackElement).html(charactersLeft + " " + settings.statusText);
			}
	 	} 
	}
	// plugin defaults
	$.fn.maxlength.defaultSettings = {
							limit:	50, // Characters limit
							feedbackElement: null,
							statusText: "characters left" ,// The status text
							errorText: "Exceeded the maximum limit. <br/>Excess characters will be truncated.",
							errorTitle: "Alert"
						  };
})(jQuery);