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
    
    if(this.collection.length === 0){
      this.$el.find(".nothing-to-display").html('You have no favorites selected. <a href="/factories">Make some</a> by visiting the factories page and clicking on the heart icon.');
    }
	  
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