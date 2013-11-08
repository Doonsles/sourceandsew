SourceAndSew.Views.FavoritesIndex = Backbone.View.extend({
  template: JST['favorites/index'],
  
  initialize: function(options) {
	  this.listenTo(this.collection, "change", this.render);
  },	
  
  events: {
	  "click .unfavorite": "unfavoriteFactory"
  },
  
  unfavoriteFactory: function (event) {
	  event.preventDefault();
      
	  var factoryId = $(event.currentTarget).attr("data-id");
	  
	  var factory = SourceAndSew.factories.get(factoryId);

	  factory.unfavorite();
  },
  
  render: function (){
	  var renderedContent = this.template({
		  factories: this.collection,
		  notes: this.collection.notes()
	  });
	  
	  this.$el.html(renderedContent);
	  return this;
  }
  
  
});