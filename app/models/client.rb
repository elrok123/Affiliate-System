class Client < ActiveRecord::Base
	#This class is used to store details on client and contains the methods required to format the data correctly.
  	attr_accessible :email, :firstname, :surname, :address, :city, :postcode, :phone_number, :company
  	has_many :orders

  	#These attributes ensure that the data entered for each element is valid and present.
	validates_presence_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates_uniqueness_of :email
	validates_presence_of :firstname
	validates_presence_of :surname
	validates_presence_of :address
	validates_presence_of :city
	validates_presence_of :postcode
	validates_presence_of :phone_number
	validates_presence_of :company
end