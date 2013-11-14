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
		
		myPage = Backbone.history.fragment || 1;
		myPage = parseInt(myPage);

		prevURL = "/factories#/" + (myPage - 1).toString();	
		nextURL = "/factories#/" + (myPage + 1).toString();
    
    pagination = "page " + myPage.toString() + " of 5"
    
    this.$el.find(".page-nums").html(pagination);
		
		if(myPage > 1){
		  this.$el.find(".prev").attr("href", prevURL);
	    } else {
		  this.$el.find(".prev").hide();
		}
		
		if(myPage < 5) {
		  this.$el.find(".next").attr("href", nextURL);
	    } else {
	      this.$el.find(".next").hide();
	    }
		return this;
	},
	
});
