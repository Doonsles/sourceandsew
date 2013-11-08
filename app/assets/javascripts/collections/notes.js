SourceAndSew.Collections.Notes = Backbone.Collection.extend({
  initialize: function(models, options){
    // this.factory = options.factory;
  },
  
  model: SourceAndSew.Models.Note,
  
  url: "/notes"	
});