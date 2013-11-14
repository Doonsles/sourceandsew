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
		
		this.$el.html(renderedContent);
		return this;
	},
	
	events: {
	  "click .create-note": "createNote",
	  "click .edit-note" : "editNote",
	  "click .delete-note" : "deleteNote",
	  "mouseenter .factory-image" : "popUpIcons",
	  "mouseleave .factory-image" : "removeIcons",
	  "click .heart" : "clickHeart",
	  "click .opaque-heart" : "clickUnheart"
	},
	
	createNote: function (event){
		event.preventDefault();
		serialized = $(event.target.form).serializeJSON();
		
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
	
	popUpIcons: function (event){
		event.preventDefault();
		$(event.currentTarget).children(".heart").fadeIn(200);
	},
	
	removeIcons: function (event){
		event.preventDefault();
		$(event.currentTarget).children(".heart").fadeOut(300);
	},
	
	clickHeart: function(event){
    $(event.target).hide();
    $(event.target).parent().find(".spinner").show();
    
		this.model.favorite();	
	},
	
	clickUnheart: function(event){
    $(event.target).hide();
    $(event.target).parent().find(".spinner").show();
		this.model.unfavorite();
	}
});