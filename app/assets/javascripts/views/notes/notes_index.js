SourceAndSew.Views.NotesIndex = Backbone.View.extend ({
  template: JST["notes/index"],
  
  initialize: function (options) {
	this.listenTo(this.collection, "add remove sync", this.render);
	
  },
  
  render: function (){
	  var renderedContent = this.template({
		  title: "Notes"
	  });
	  
	  this.$el.html(renderedContent);
	  
	  var $container = this.$el.find("#notes-index");
    
	  var numNotes = 0;
	  this.collection.each(function (factory) {
		if(factory.notes().escape("content")) { 
      numNotes += 1;
		  var showView = new SourceAndSew.Views.NoteShow ({ model: factory });
		  showView.render();
		  $container.append(showView.$el);
	    }
	  });
    
    if(numNotes === 0){
      this.$el.find(".nothing-to-display").html('You currently have no notes. <a href="/factories">Make some</a> by visiting the factories page and clicking on the pencil icon.');
    }
    
	  return this;
  }
});