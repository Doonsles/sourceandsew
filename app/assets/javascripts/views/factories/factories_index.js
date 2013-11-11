SourceAndSew.Views.FactoriesIndex = Backbone.View.extend({
	template: JST["factories/index"],
	
	initialize: function (options) {
		this.listenTo(this.collection, "add remove sync", this.render);
		
	},
	
	render: function (){
		var renderedContent = this.template({
		  title: "All Factories"	
		});
		
		this.$el.html(renderedContent);
		
		var $container = this.$el.find("#factories-index");
		
		this.collection.each (function (factory) {
			var showView = new SourceAndSew.Views.FactoryShow ({ model: factory });
			showView.render();
			$container.append(showView.$el);
		});
		
		return this;
	},
	
});
