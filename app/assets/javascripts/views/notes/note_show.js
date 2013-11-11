SourceAndSew.Views.NoteShow = Backbone.View.extend({
	template: JST["notes/show"],

    initialize: function(options) {
  	  this.listenTo(this.model, "change", this.render);
  	  this.listenTo(this.model, "add remove sync", this.render);
    },
	
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
	  "submit .edit-note" : "editNote",
	  "click .delete-note" : "deleteNote"
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
		event.preventDefault();
		serialized = $(event.target).serializeJSON();
		var note = new SourceAndSew.Models.Note(serialized.note);
      
		note.save({}, {});
		
		$(event.currentTarget).children(":submit").removeClass("create-note");
		$(event.currentTarget).children(":submit").addClass("edit-note");
		$(event.currentTarget).children(":submit").val("edit note");
	},
	
	editNote: function (event){
	  event.preventDefault();
	  
	  var NoteToEdit = SourceAndSew.factories.get($(event.target).data("id")).notes();
	  
	  var serialized = $(event.currentTarget).serializeJSON();
	  NoteToEdit.save(serialized);
	},
	
	deleteNote: function(event){
	  alert("You clicked the delete button!")
		
  	  event.preventDefault();
	  
  	  var noteToDelete = SourceAndSew.notes.get($(event.target).data("id")).notes();
  	  var factoryToEdit = SourceAndSew.notes.get($(event.target).data("id"));
	  var that = this;
	 
	  
	  noteToDelete.destroy({
	  		  success: function (){
	  			  factoryToEdit.deleteNotes();
	  			  SourceAndSew.notes.trigger("remove");
	  		  }
  	  });
	  
	}
	
});