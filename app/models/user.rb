class User < ActiveRecord::Base
  attr_accessible :username, :password
  
  validates :username, :session_token, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {:minimum => 6, :allow_nil => true}
  after_initialize :ensure_session_token
  
  has_many :favorites
  has_many :notes
  
  has_many :noted_factories, :through => :notes, :source => :factory
  
  def password=(password)
    @password = password
    self.encrypted_pass = BCrypt::Password.create(password);
  end
  
  def password
    @password
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.encrypted_pass).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    
    if(!user.nil? && user.is_password?(password))
      return user
    else
      return nil
    end
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
