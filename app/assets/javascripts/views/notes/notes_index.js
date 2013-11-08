SourceAndSew.Views.NotesIndex = Backbone.View.extend ({
  template: JST["notes/index"],
  
  render: function (){
	  var renderedContent = this.template({
		  factories: this.collection,
		  notes: this.collection.notes()
	  });
	  
	  this.$el.html(renderedContent);
	  return this;
  },
  

});