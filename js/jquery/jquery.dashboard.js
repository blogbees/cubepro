/*
 * jQuery dashboard - plugin
 * 
 * Version 1.0
 * 
 * Copyright (c) 2009 - Aspire Systems
 * 
 * Author - Sajeev Sreekantan
 * 
 * Usage:
 * 		$(".widget-interface-id").dashboard(widgetElementsDetails);
 * 		
 * 		widgetElementsDetails - The widget configurations
 * 
 * Depends:
 * 		jquery.js, jquery.ui.core.js, jquery.sortable.js, jqdock.js
 */

// create closure
(function($) {
	$.fn.dashboard = function(options) {
		var settings = $.extend({}, $.fn.dashboard.defaults, options);
		return this.each(function() {
			$this = $(this);
            // build element specific options
            var elementSettings = $.meta ? $.extend({}, settings, $this.data()) : settings;
            elementSettings.dockElementId = '#' + elementSettings.dockElementId;
			//Create widget columns
			var widgteContainer = createColumns($this, elementSettings.columnsCount);
			//Create widgets
			$(elementSettings.widgets).each(function() {
				var widget = createWidget(this);
				var widgetId = '#' + this.id;
				$('#column' + this.column).append(widget);
				if(this.state == $.fn.dashboard.states.expanded) {
					expandWidget($(widgetId), elementSettings);					
				} else if(this.state == $.fn.dashboard.states.maximized) {
					//Only one element for maximized stage
					maximizeWidget($(widgetId).find(selectors.maximize), elementSettings);
				} else if(this.state == $.fn.dashboard.states.collapsed) {
					collapseWidget($(widgetId).find(selectors.collapse));										
				} else if(this.state == $.fn.dashboard.states.closed) {
					closeWidget($(widgetId).find(selectors.close));										
				}
				//Create widget docks
				var dockElement = '<a id="'+ this.id + 'icon" style="cursor:pointer; display:none;"><img src="' + this.icon + '" title="' + this.title + '" /></a>';
				$(widgetId + 'icon').live("click", function(){
					showWidget(widgetId, elementSettings);
				});
				$(elementSettings.dockElementId).append(dockElement);
			});
			//Make widgets draggable
			$(selectors.columns).sortable({
				connectWith: selectors.columns,
				handle: selectors.widgetHeader					
			});
			//Call the dock function
			$(elementSettings.dockElementId).jqDock({labels: true});
			//Add events
			makeSticky(elementSettings.dockElementId);
			$(window).scroll(function() {
				makeSticky(elementSettings.dockElementId);
			});
			
			//Close
			$(selectors.close).live("click", function(){
				closeWidget(this);
			});
			//Collapse
			$(selectors.collapse).live("click", function(){
				collapseWidget(this);
			});
			
			//Expand
			$(selectors.expand).live("click", function(){
				var widget = $(this).parents(selectors.widget);
				$(this).hide();
				expandWidget(widget, elementSettings);
			});
			
			//Reload
			$(selectors.reload).live("click", function(){
				if (elementSettings.callback != null && elementSettings.callback != '') {
					window[elementSettings.callback]($(this).parents(selectors.widget).attr('id'));
				}
			});
			
			//Maximize
			$(selectors.maximize).live("click", function(){
				maximizeWidget(this, elementSettings);
			});
			
			//Restore
			$(selectors.restore).live("click", function(){
				var widget = $(this).parents(selectors.widget);
				restoreWidget(widget);
				if (elementSettings.callback != null && elementSettings.callback != '') {
					window[elementSettings.callback]($(widget).attr('id'));
				}
			});
		});
	};

	//Function to append content to the widget
	$.fn.dashboard.setWidgetContent = function(widgetId, widgetContent) {
		$(widgetId).children('.widget-body').children('.widget-content').html(widgetContent);
	};
	
	//Function to get the widget states
	$.fn.dashboard.getWidgets = function() {
		var widgetArray = new Array();
		var widgetIndex = 0;
		$(selectors.widget).each(function() {
			var widgetId = this.id;
			var widgetElement = $('#' + widgetId); 
			var columnNumber = widgetElement.parents(selectors.columns).attr("index");
			//Calculate the widget state
			var stateValue = widgetElement.attr("state");
			//Widget data			
			var widget = {
				id: widgetId,
				column: columnNumber,
				state: stateValue
			};
			widgetArray[widgetIndex++] = widget;
		});
		return widgetArray;
	};
	
	// plugin defaults
	$.fn.dashboard.defaults = { // Nothing by default
	};

	//plugin constants
	$.fn.dashboard.states = {
		expanded:  'expanded',
		collapsed: 'collapsed',
		closed: 'closed',
		maximized: 'maximized'
	};
	
	//--------------Private functions--------------------------------
	//Function to create all the columns in the dashboard
	function createColumns(widgetContainer, colCount) {
		for (colIndex = 1; colIndex <= colCount; colIndex++) {
			var column = '<div id="column' + colIndex + '" index="' + colIndex + '" class="widget-column" ></div>';
			$(widgetContainer).append(column);
		}
		$(selectors.columns).height($(window).height());
		return $(widgetContainer);
	}
	//Function to create a single widget
	function createWidget(widgetData) {
		var widget = '<div id="' + widgetData.id + '" class="widget ui-widget ui-widget-content" state="' + widgetData.state + '"></div>';
		widget = createWidgetHeader(widget, widgetData);
		widget = createWidgetBody(widget, widgetData);
		return widget;
	}
	//Function to create a single widget
	function createWidgetHeader(widget, widgetData) {
		var header = '<div class="widget-header ui-widget-header" ></div>';
		var headerContent = '<span></span>';
		headerContent = $(headerContent).append('<div class="widget-header-text">' + widgetData.title + '</div>')
							.append('<a class="widget-close" ><img src="images/jquery/themes/dashboard/closebutton.gif" alt="Close" class="widget-controls" /></a>')
							.append('<a class="widget-collapse" ><img src="images/jquery/themes/dashboard/uparrowbutton.gif" alt="Collapse" class="widget-controls" /></a>')
							.append('<a class="widget-expand" ><img src="images/jquery/themes/dashboard/downarrow.gif" alt="Expand" class="widget-controls" /></a>')
				 			.append('<a class="widget-reload" ><img src="images/jquery/themes/dashboard/refreshbutton.gif" alt="Refresh" class="widget-controls" /></a>')
				 			.append('<a class="widget-maximize" ><img src="images/jquery/themes/dashboard/maxbutton.gif" alt="Maximize" class="widget-controls" /></a>')
				 			.append('<a class="widget-restore" ><img src="images/jquery/themes/dashboard/restorebutton.gif" alt="Maximize" class="widget-controls" /></a>');
		header = $(header).append($(headerContent));		 			
		return $(widget).append($(header));
	}
	//Function to create a single widget
	function createWidgetBody(widget, widgetData) {
		var content = '<div class="widget-body"></div>';
		var contentData = '<div class="widget-content"><p>Widget Data</p></div>';
		var footer = '<div class="widget-footer"><span></span></div>';
		content = $(content).append(contentData).append(footer);
		return $(widget).append(content);
	}
	
	function collapseWidget(element) {
		var widget = $(element).parents(selectors.widget);
		$(element).hide();
		
		$(widget).find(selectors.expand).show();
		$(widget).find(selectors.restore).hide();
		$(widget).find(selectors.maximize).hide();
		
		$(widget).find(selectors.widgetBody).hide();
		//Set the widget state
		$(widget).attr("state", $.fn.dashboard.states.collapsed);
	}
	
	function expandWidget(widget, elementSettings) {
		$(widget).find(selectors.collapse).show();
		$(widget).find(selectors.expand).hide();
		$(widget).find(selectors.restore).hide();
		$(widget).find(selectors.maximize).show();
		$(widget).find(selectors.widgetBody).show();
		$(widget).attr("state", $.fn.dashboard.states.expanded);
		if (elementSettings.callback != null && elementSettings.callback != '') {
			window[elementSettings.callback]($(widget).attr('id'));
		}
	}

	function maximizeWidget(element, elementSettings) {
		var widget = $(element).parents(selectors.widget); 
		$(selectors.columns).hide();
		$(element).hide();
		$(selectors.widget).hide();
		
		$(widget).find(selectors.restore).show();
		$(widget).find(selectors.expand).hide();
		$(widget).find(selectors.collapse).hide();
		
		$(element).parents(selectors.columns).show();
		$(element).parents(selectors.widget).show();
		$(element).parents(selectors.columns).css("width", "100%");
		$(widget).attr("state", $.fn.dashboard.states.maximized);
		if (elementSettings.callback != null && elementSettings.callback != '') {
			window[elementSettings.callback]($(widget).attr('id'));
		}
	}

	function restoreWidget(widget) {
		$(selectors.columns).show();
		$(selectors.widget).show();
		
		$(widget).find(selectors.expand).hide();
		$(widget).find(selectors.restore).hide();
		$(widget).find(selectors.collapse).show();
		$(widget).find(selectors.maximize).show();
		$(widget).parents(selectors.columns).css("width", "45%");
	}

	//Function to close a widget
	function closeWidget(element) {
		var widget = $(element).parents(selectors.widget);
		if ($(widget).attr("state") == $.fn.dashboard.states.maximized) {
			restoreWidget(widget);
		}
		$(widget).attr("state", $.fn.dashboard.states.closed);
		$(element).parents(selectors.widget).animate({
				opacity: 0    
			}, function () {
				$(this).slideUp(function () {
					toggleWidget($(this), false);
					//Show the dock icon
					$('#' + this.id + 'icon').show();
			});
		});
	}
	
	//Function to show a widget
	function showWidget(widgetId, elementSettings) {
		//Find out whether there is any maximized widget available
		//If so make it in normal position
		$(selectors.widget).each(function() {
			if ($(this).attr("state") == $.fn.dashboard.states.maximized) {
				expandWidget($(this), elementSettings);
				restoreWidget($(this));
			}
		});
		$(widgetId).animate({
				opacity: 1    
			}, function () {
				$(this).slideDown(function () {
					expandWidget($(this), elementSettings);
					toggleWidget($(this), true);
					//Hide the dock icon
					$('#' + this.id + 'icon').hide();
			});
		});
		//Calculate the state
		var stateValue = '';
		if ($(widgetId).find(selectors.collapse).css("display") != 'none') {
			stateValue = $.fn.dashboard.states.expanded;
		} else if ($(widgetId).find(selectors.expand).css("display") != 'none') {
			stateValue = $.fn.dashboard.states.collapsed;
		} else if ($(widgetId).find(selectors.restore).css("display") != 'none') {
			stateValue = $.fn.dashboard.states.maximized;
		}
		$(widgetId).attr("state", stateValue); 
	}
	
	//Function to hide or show a widget
	function toggleWidget(widget, show) {
		if (show) {
			$(widget).children().show();
			$(widget).show();
		} else {
			$(widget).children().hide();
			$(widget).hide();
		}
	}
	
	//Function to make jqDock images sticky
	function makeSticky(id) {
		var topPosition = $(window).scrollTop() +  $(window).height() - 35;
		var leftPosition = $(window).scrollLeft() +  $(window).width()/2 - 150;
		$(id).animate({ top: topPosition, left: leftPosition }, 20);
	}
	
	// Plugin selectors
	var selectors = {
		widget: '.widget',
		widgetHeader: '.widget-header',
		widgetBody: '.widget-body',
		columns: '.widget-column',
		close: '.widget-close',
		collapse: '.widget-collapse',
		expand: '.widget-expand',
		reload: '.widget-reload',
		maximize: '.widget-maximize',
		restore: '.widget-restore'
	};
})(jQuery);