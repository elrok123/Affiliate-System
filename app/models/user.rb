class User < ActiveRecord::Base
  #This class is used to hold data on a user of the system, it will also contain various methods in order to encrypt and format the data as required.
  
  #These accessors allow the controller and views to access the specified class elements.
  
  attr_accessible :email, :password, :password_confirmation, :firstname, :surname, :id
  
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_presence_of :firstname
  validates_presence_of :surname
  
  def self.authenticate(email, password)
    unless email == "Email" || email == "email" || email == ""
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end 
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end