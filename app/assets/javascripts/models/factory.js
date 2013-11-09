SourceAndSew.Models.Factory = Backbone.Model.extend ({
	urlRoot: "/factories",
	
	notes: function() {
	  if(!this._factoryNotes){
		  //this._factoryNotes  = new SourceAndSew.Collections.Notes([], { factory: this });
		  this._factoryNotes = new SourceAndSew.Models.Note();
	  }	
	  return this._factoryNotes;
	},
	
	deleteNotes: function (){
		console.log("notes deleted! for " + this.get("name"));
		this._factoryNotes.set({content: undefined});	
		console.log("the notes for this factory are " + this.notes().get("content"));
	},
	
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
	},
	
	parse: function(serverAttributes, options) {
		console.log("parsing");
		this.notes().set(serverAttributes.notes[0]);
		delete serverAttributes.notes
		return serverAttributes;
	},
	
	toJSON: function (){
		var json = _.extend({}, this.attributes);
		json.notes = this.notes().toJSON();
		delete json.favorited;
		
		return json;
	}
});