SourceAndSew.AppRouter = Backbone.Router.extend({
  routes: {
	  "":"showFactoriesIndex"
  },
  
  showFactoriesIndex: function () {
	 
	  var indexView = new SourceAndSew.Views.FactoriesIndex({
		  collection: SourceAndSew.factories
	  });
	  
	  indexView.render();
	  $('.factory-list').append(indexView.$el);
  }
});