class Supplier < ActiveRecord::Base
	#This class is used to store details on a supplier and contains the methods required to format the data correctly.

	#This line ensures that the elements which are require to be accessed outwith the class itself are able to be accessed.
	attr_accessible :supplier_address, :supplier_email, :supplier_name, :supplier_phone_number, :supplier_postcode

	has_many :products
	
	#These attributes ensure that the data entered for each element is valid and present.
	validates_presence_of :supplier_email
	validates_format_of :supplier_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates_uniqueness_of :supplier_email
	validates_presence_of :supplier_name
	validates_presence_of :supplier_address
	validates_presence_of :supplier_phone_number
	validates_presence_of :supplier_postcode
end
