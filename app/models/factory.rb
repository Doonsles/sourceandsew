class Factory < ActiveRecord::Base
  attr_accessible :description, :location, :phone, :name

  attr_accessor :favorited, :note

  validates :phone, :name, :presence => true
  validates :name, :phone, :uniqueness => true
  
  has_many :favorites
  has_many :notes

  def as_json(options = {})
    super(options.merge({:methods => [:favorited], :include => :notes}))
  end
end
