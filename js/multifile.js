/**
 * Convert a single file-input element into a 'multiple' input list
 *
 * Usage:
 *
 *   1. Create a file input element (no name)
 *      eg. <input type="file" id="first_file_element">
 *
 *   2. Create a DIV for the output to be written to
 *      eg. <div id="files_list"></div>
 *
 *   3. Instantiate a MultiSelector object, passing in the DIV and an (optional) maximum number of files
 *      eg. var multi_selector = new MultiSelector( document.getElementById( 'files_list' ), 3 );
 *
 *   4. Add the first element
 *      eg. multi_selector.addElement( document.getElementById( 'first_file_element' ) );
 *
 *   5. That's it.
 *
 *   You might (will) want to play around with the addListRow() method to make the output prettier.
 *
 *   You might also want to change the line 
 *       element.name = 'file_' + this.count;
 *   ...to a naming convention that makes more sense to you.
 * 
 * Licence:
 *   Use this however/wherever you like, just don't blame me if it breaks anything.
 *
 * Credit:
 *   If you're nice, you'll leave this bit:
 *  
 *   Class by Stickman -- http://www.the-stickman.com
 *      with thanks to:
 *      [for Safari fixes]
 *         Luis Torrefranca -- http://www.law.pitt.edu
 *         and
 *         Shawn Parker & John Pennypacker -- http://www.fuzzycoconut.com
 *      [for duplicate name bug]
 *         'neal'
 */
function MultiSelector( list_target, max ){

	var new_table = $('<table id="header-table" class="form-border" border="0" width="50%" cellspacing="1" cellpadding="0"></table>');
	// Where to write the list
	this.list_target = list_target;
	// How many elements?
	this.count = 0;
	// How many elements?
	this.id = 0;
	
	this.fileCount = 0;
	
	this.context = 'create';
	
	//Callback function
	this.addElementCallbackFunction = null;
	if (arguments.length > 2) {
		this.addElementCallbackFunction = arguments[2];
	}
	
	if (arguments.length > 3) {
		new_table = arguments[3];
	}
	
	if (arguments.length > 4) {		
		this.context = arguments[4];
	}
	// Is there a maximum?
	if( max ){
		this.max = max;
	} else {
		this.max = -1;
	};

	this.hasHeader = -1;
	
	/**
	 * Add a new file input element
	 */
	this.addElement = function( element){
		var availableSeqNoPool = new Array();
		var seqIndex = 0;
		$('.file-class').each(function(){
			var seqNo = $(this).attr('seqNo');
			if (seqNo >=0) {
				availableSeqNoPool[seqIndex++] = seqNo;
			}
		});
		for (i=0; i<max;i++) {
			var found = 0;
			for (j=0;j<availableSeqNoPool.length;j++) {
				if (availableSeqNoPool[j] == i) {
					found = 1;
					break;
				}
			}
			if (found == 0) {
				this.id = i;
				break;	
			}
		}
		// Make sure it's a file input element
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			// Element name -- what number am I?
			element.name = 'fileAttachment[' + this.id +']';
			
			$(element).attr('class', 'file-class');
			$(element).attr('seqNo', this.id++);
			
			// Add reference to this object
			element.multi_selector = this;

			// What to do when a file is selected
			element.onchange = function(){

				// New file input
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';

				// Add new element
				this.parentNode.insertBefore( new_element, this );

				// Apply 'update' to element
				this.multi_selector.addElement( new_element );

				// Update list
				this.multi_selector.addListRow( this );

				// Hide this: we can't use display:none because Safari doesn't like it
				this.style.position = 'absolute';
				this.style.left = '-1000px';

			};
			// If we've reached maximum number, disable input element
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			this.fileCount++;
			// Most recent element
			this.current_element = element;
			
		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};

	/**
	 * Add a new row to the list of files
	 */
	this.addListRow = function( element ){	

		if(element.multi_selector.hasHeader == -1){	
		
			$($(element).attr('multi_selector')).attr('hasHeader', 0);	
			var header_row = $('<tr id="header-row"></tr>');
			var header_col1 = $('<td width="85%" class="grid-heading-row">File Name</td>');
			var header_col2 = $('<td width="15%" class="grid-heading-row">Remove</td>');
			$(header_row).attr('class', 'header-class');
			header_row.append( $(header_col1) );
			header_row.append( $(header_col2) );
			
			if($($(element).attr('multi_selector')).attr('context') == 'update'){
				if($($(element).attr('multi_selector')).attr('fileCount') == 1){
					new_table = $('<table id="header-table" class="form-border" border="0" width="50%" cellspacing="1" cellpadding="0"></table>');
				}
			}
			new_table.append( $(header_row) );
			
		}

		// Row div
		var new_row = $('<tr></tr>');

		////////////////////// Custom script to have a delete icon //////////////////////////////
		
		var remove_icon = $('<img src="images/delete_icon.gif" alt="Delete"/>');
				
		var remove_link = $('<a id="remove_'+element.multi_selector.count+'" href="#"></a>');
		
		$(remove_link).click(function(){
			
			// Remove element from form
			$(element).remove();
			
			// Remove this row from the list
			var current_row = $(this).parents('tr').get(0);
			$(current_row).remove();
		
			var selector_count = $($(element).attr('multi_selector')).attr('count');
		
		    var file_selector_count = $($(element).attr('multi_selector')).attr('fileCount');
		    
		    var max_count = $($(element).attr('multi_selector')).attr('max');
		
			// Decrement counter			
			
			$($(element).attr('multi_selector')).attr('count', (selector_count-1) );	
			$($(element).attr('multi_selector')).attr('fileCount', (file_selector_count-1) );
			
			if($($(element).attr('multi_selector')).attr('context') == 'update'){
				
				$($(element).attr('multi_selector')).attr('max', (max_count+1) );
			}
			
			if($($(element).attr('multi_selector')).attr('context') == 'create'){
				if($($(element).attr('multi_selector')).attr('fileCount') == 1){				
					$("#header-table tr").remove();
					$("#header-table:first").remove();
					$($(element).attr('multi_selector')).attr('hasHeader', -1);				
				}
			}
			if($($(element).attr('multi_selector')).attr('context') == 'update'){
				if($($(element).attr('multi_selector')).attr('fileCount') == 0){				
					$("#header-table tr").remove();
					$("#header-table:first").remove();
					$($(element).attr('multi_selector')).attr('hasHeader', -1);		
				}
			}
			// Re-enable input element (if it's disabled)
			$($($(element).attr('multi_selector')).attr('current_element')).attr('disabled', false);
									
			// Appease Safari
			//    without it Safari wants to reload the browser window
			//    which nixes your already queued uploads
			return false;
		});
		
		//Adding icon to the anchor tag
		remove_link.append( $(remove_icon) );
		
				
		var new_col1 = $('<td></td>');
		var new_col2 = $('<td></td>');

		// Set row value
				
		$(new_col1).html(element.value);
		
		if((this.count%2) == 1 || 0){
			$(new_col1).attr("class", "grid-row-lft");
		}else{
			$(new_col1).attr("class", "grid-row-alt-left");
		}
		
		// Add button
		$(new_col2).append( $(remove_link) );
		if((this.count%2) == 1 || 0){
			$(new_col2).attr("class", "grid-row");
		}else{
			$(new_col2).attr("class", "grid-row-alt");
		}

		$(new_row).append( $(new_col1) );
		$(new_row).append( $(new_col2) );
		$(new_table).append( $(new_row) );
		
		// Add it to the list		
		$('#initialPhoto-list').append($(new_table));
		if (this.addElementCallbackFunction != null) {
			window[this.addElementCallbackFunction]();
		}
	};

};