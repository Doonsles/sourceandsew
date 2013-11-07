SourceAndSew.Models.Factory = Backbone.Model.extend ({
	urlRoot: "/factories",
	
	favorite: function () {
		var factory = this;
		
		$.ajax({
		  type: "POST",
		  url: "/factories/" + factory.id + "/favorite",
		  
		  success: function(data){
			  factory.set("favorited", true)
		  }	
		});
	},
	
	unfavorite: function () {
		var factory = this;
		
		$.ajax({
		  type: "DELETE",
		  url: 	"/factories/" + factory.id + "/favorite",
		  
		  success: function (data){
		    factory.set("favorited", false);
		}
		});
	}
});