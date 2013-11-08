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
	  
	  this.collection.each(function (factory) {
		var showView = new SourceAndSew.Views.FactoryShow ({ model: factory });
		showView.render();
		$container.append(showView.$el);
	  });
	  
	  return this;
  }
});