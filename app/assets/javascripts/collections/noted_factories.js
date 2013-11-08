SourceAndSew.Collections.NotedFactories = Backbone.Collection.extend({
  initialize: function(models, options){
    // this.factory = options.factory;
  },
  
  model: SourceAndSew.Models.Factory,
  
  url: "/notes"	
});