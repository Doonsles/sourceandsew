SourceAndSew.Views.FactoriesIndex = Backbone.View.extend({
	template: JST["factories/index"],
	
	initialize: function (options) {
		this.listenTo(this.collection, "add remove sync", this.render);
		
	},
	
	render: function (){
		var renderedContent = this.template({
		  title: "All Factories",
		  factories: this.collection	
		});
		
		this.$el.html(renderedContent);
		return this;
	},
	
	events: {
	  "click .favorite": "favoriteFactory", 
	  "click .unfavorite": "unfavoriteFactory"
	},
	
	favoriteFactory: function (event){
		event.preventDefault();
		var factoryId = $(event.currentTarget).attr("data-id");
		
		var factory = SourceAndSew.factories.get(factoryId);
		// $(event.currentTarget).css("display", "none");
		 $(event.currentTarget).html("Unfavorite!");
		 $(event.currentTarget).removeClass('favorite').addClass('unfavorite');
		 
		factory.favorite();
	},
	
	unfavoriteFactory: function (event){
	  event.preventDefault();
	  
	  var factoryId = $(event.currentTarget).attr("data-id");
	  
	  var factory = SourceAndSew.factories.get(factoryId);
	  $(event.currentTarget).html("Favorite!");
	  $(event.currentTarget).removeClass('unfavorite').addClass('favorite');
	  
	  factory.unfavorite();
	}
});