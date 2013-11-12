SourceAndSew.Models.Factory = Backbone.Model.extend ({
	urlRoot: "/factories",
	
	notes: function() {
	  if(!this._factoryNotes || !this._factoryNotes.get("content")){
		  //this._factoryNotes  = new SourceAndSew.Collections.Notes([], { factory: this });
		  this._factoryNotes = new SourceAndSew.Models.Note();
	  }	
	  return this._factoryNotes;
	},
	
	deleteNotes: function (){
		this._factoryNotes.set({content: undefined});	
	},
	
	updateNotes: function (myString){
	  this._factoryNotes.set({content: myString});	
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