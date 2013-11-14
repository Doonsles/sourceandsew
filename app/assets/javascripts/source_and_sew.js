window.SourceAndSew = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	SourceAndSew.factories = new SourceAndSew.Collections.Factories();
	
	SourceAndSew.factories.fetch({
		error: function (args) {
			console.log(args);
		},
	    success: function (){
	       new SourceAndSew.AppRouter();
	       Backbone.history.start();
		   runJavaScript();
	  }	
	});
  }
};

$(document).ready(function(){
	SourceAndSew.initialize();
	$('.carousel').carousel({
	  interval: 4000,
	  pause:'hover'
	  });
});
