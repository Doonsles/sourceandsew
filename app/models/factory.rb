class Factory < ActiveRecord::Base
  attr_accessible :description, :location, :phone, :name, :photo
  
  has_attached_file :photo, :styles => {
    :big => "250x200>"
    # :small => "50x50#"
  }
  
  attr_accessor :favorited

  validates :phone, :name, :presence => true
  validates :name, :phone, :uniqueness => true
  
  has_many :favorites
  has_many :notes

  def as_json(options = {})
    super(options.merge({:methods => [:favorited], :include => :notes}))
  end
end
