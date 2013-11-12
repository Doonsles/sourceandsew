SourceAndSew.Views.FactoryShow = Backbone.View.extend({
	template: JST["factories/show"],
	
    initialize: function(options) {
  	  this.listenTo(this.model, "change", this.render);
  	  this.listenTo(this.model, "add remove sync", this.render);
    },
	
	render: function (){
		var renderedContent = this.template({
		  factory: this.model,	
		});
		
  	    // $(".factory-list").click(function() {
  	    //   alert("you clicked!")
  	    // });
		
		this.$el.html(renderedContent);
		return this;
	},
	
	events: {
	  "click .create-note": "createNote",
	  "click .edit-note" : "editNote",
	  "click .delete-note" : "deleteNote",
	  "mouseenter .factory-image" : "popUpHeart",
	  "mouseleave .factory-image" : "removeHeart",
	  "click .heart" : "clickHeart"
	},
	
	createNote: function (event){
		event.preventDefault();
		serialized = $(event.target.form).serializeJSON();
		//var note = new SourceAndSew.Models.Note(serialized.note);
		
		//render the factory inside the save method
		var that = this;
		var factory = this.model;
		this.model.notes().save(serialized, {
		  success: function (){
			  factory.updateNotes(serialized.note.content);
			  that.render();
		  }
		});
		
		$(event.currentTarget).children(":submit").removeClass("create-note");
		$(event.currentTarget).children(":submit").addClass("edit-note");
		$(event.currentTarget).children(":submit").val("edit note");
	},
	
	editNote: function (event){
	  event.preventDefault();
	  
	  var factory = SourceAndSew.factories.get($(event.target).data("id"));
	  var NoteToEdit = factory.notes();
	  
	  var serialized = $(event.target.form).serializeJSON();
	  //NoteToEdit.save(serialized);
	  
	  //render the factory inside the save method
	  var that = this;
	  NoteToEdit.save(serialized, {
	  		  success: function (){
				  factory.updateNotes(serialized.note.content);
	  			  that.render();
	  		  }
	  });
	  
	},
	
	deleteNote: function(event){		
  	  event.preventDefault();
	  
  	  var noteToDelete = SourceAndSew.factories.get($(event.target).data("id")).notes();
  	  var factoryToEdit = SourceAndSew.factories.get($(event.target).data("id"));
	  var that = this;
	  
	  noteToDelete.destroy({
		  success: function (){
			  factoryToEdit.deleteNotes();
			  that.render();
		  }
  	  });
	  
	},
	
	popUpHeart: function (event){
		event.preventDefault();
		$(event.currentTarget).children(".heart").fadeIn(200);
	},
	
	removeHeart: function (event){
		event.preventDefault();
		$(event.currentTarget).children(".heart").fadeOut(300);
	},
	
	clickHeart: function(event){
		if(this.model.get("favorited")){ 
			this.model.unfavorite();
	    } else {
		  this.model.favorite();
		}	
	}
});