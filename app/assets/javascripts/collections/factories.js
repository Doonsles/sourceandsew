SourceAndSew.Collections.Factories = Backbone.Collection.extend({
  model: SourceAndSew.Models.Factory,
  
  url: "/factories"	,
  
  //notes function added by Danielle
  notes: function (){
	  notes = {};
	  this.each (function (factory) {
		  if(factory.notes().attributes[0]) {
		    notes[factory.get("name")] = factory.notes().attributes[0].content;
		  }
		              
	  });  	
	  return notes;
  }
});