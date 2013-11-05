class Favorite < ActiveRecord::Base
  attr_accessible :factory_id, :user_id
  
  validates :factory_id, :user_id, :presence => true
  
  validates_uniqueness_of :factory_id, :scope => [:user_id]
  
  belongs_to :factory
  belongs_to :user
end
