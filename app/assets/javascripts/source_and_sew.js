window.SourceAndSew = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
	SourceAndSew.factories = new SourceAndSew.Collections.Factories();
	SourceAndSew.factories.fetch({
		error: function (args) {
			console.log(args);
		},
	  success: function (){
		  new SourceAndSew.AppRouter();
		  Backbone.history.start();
	  }	
	});
  }
};

$(document).ready(function(){
  SourceAndSew.initialize();
});
