class Factory < ActiveRecord::Base
  attr_accessible :description, :location, :phone, :name
  
  validates :phone, :name, :presence => true
  validates :name, :phone, :uniqueness => true
  
  has_many :favorites
  has_many :notes
end
