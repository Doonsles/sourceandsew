class Note < ActiveRecord::Base
  attr_accessible :content, :factory_id, :user_id

  validates :content, :factory_id, :user_id, :presence => true
  
  belongs_to :user
  belongs_to :factory
end
