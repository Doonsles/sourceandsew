SourceAndSew.AppRouter = Backbone.Router.extend({
  routes: {
	  ":page": "showFactoriesPage"
  },
  
  showFactoriesPage: function (page) {
	  SourceAndSew.pageFactories = 
	    new SourceAndSew.Collections.Factories();
	
	  var that = this;	
	  SourceAndSew.pageFactories.fetch({
	    data: { page: page },

	    success: function (){
	  	  var pageView = new SourceAndSew.Views.FactoriesIndex({
	  		  collection: SourceAndSew.pageFactories
	  	  });
		  
		  that._swapView(pageView);
	    }	
	  });
  },
  
  _swapView: function(newView) {
	  if(this._prevView){
		  this._prevView.remove();
	  }
	  
	  this._prevView = newView;
	  newView.render();
	  $('.factory-list').html(newView.$el);
  },
});