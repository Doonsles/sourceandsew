class Favorite < ActiveRecord::Base
  attr_accessible :factory_id, :user_id
  
  validates :factory_id, :user_id, :presence => true
  
  vvalidates_uniqueness_of :factory_id, :scope => [:user_id]
end
