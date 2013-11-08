SourceAndSew.Views.FactoryShow = Backbone.View.extend({
	template: JST["factories/show"],
	
	
	render: function (){
		var renderedContent = this.template({
		  factory: this.model,	
		});
		
		this.$el.html(renderedContent);
		return this;
	},
	
	events: {
	  "click .favorite": "favoriteFactory", 
	  "click .unfavorite": "unfavoriteFactory",
	  "submit .create-note": "createNote",
	  "submit .edit-note" : "editNote"
	},
	
	favoriteFactory: function (event){
		event.preventDefault();
		 $(event.currentTarget).html("Unfavorite!");
		 $(event.currentTarget).removeClass('favorite').addClass('unfavorite');
		 
		this.model.favorite();
	},
	
	unfavoriteFactory: function (event){
	  event.preventDefault();
	  
	  $(event.currentTarget).html("Favorite!");
	  $(event.currentTarget).removeClass('unfavorite').addClass('favorite');
	  
	  this.model.unfavorite();
	},
	
	createNote: function (event){
		alert("Let's make a note!");
		event.preventDefault();
		serialized = $(event.target).serializeJSON();
		var note = new SourceAndSew.Models.Note(serialized.note);
 
		note.save({}, {
			error: function () {
			  alert("there was an errror!!!");	
			},
			success: function () {
				SourceAndSew.notedFactories.add(note);
			}
 		});
	},
	
	editNote: function (event){
	  alert ("Let's edit the note!");	
	}
});