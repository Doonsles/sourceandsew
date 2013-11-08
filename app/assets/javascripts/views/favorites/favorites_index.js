SourceAndSew.Views.FavoritesIndex = Backbone.View.extend({
  template: JST['favorites/index'],
  
  initialize: function(options) {
	  this.listenTo(this.collection, "change", this.render);
	  this.listenTo(this.collection, "add remove sync", this.render);
  },	
  
  render: function (){
	  var renderedContent = this.template({
		  title: "Favorite Factories"
	  });
	  
	  this.$el.html(renderedContent);
	  
	  var $container = this.$el.find("#favorites-index");
	  
	  this.collection.each (function (factory) {
		  if (factory.get("favorited")) {
		    var showView = new SourceAndSew.Views.FactoryShow({ model: factory });
		    showView.render();
		    $container.append(showView.$el);
		}
	  });  
	  return this;
  }
  
});