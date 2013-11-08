SourceAndSew.Views.FactoriesIndex = Backbone.View.extend({
	template: JST["factories/index"],
	
	initialize: function (options) {
		this.listenTo(this.collection, "add remove sync", this.render);
		
	},
	
	render: function (){
		var renderedContent = this.template({
		  title: "All Factories",
		  factories: this.collection,
		  notes: this.collection.notes()	
		});
		
		this.$el.html(renderedContent);
		return this;
	},
	
	events: {
	  "click .favorite": "favoriteFactory", 
	  "click .unfavorite": "unfavoriteFactory",
	  "click .create-note": "createNote"
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
	},
	
	createNote: function (event){
		alert("Let's make a note!");
		event.preventDefault();
		var factoryId = $(event.currentTarget).attr("data-id");
		
		var myFactory = SourceAndSew.factories.get(parseInt(factoryId));
		// factory.addNote();
	}
});