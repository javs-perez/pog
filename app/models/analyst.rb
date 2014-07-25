class Analyst < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable
  
	before_save { self.email = email.downcase }

	validates 	:name,  presence: true, length: { maximum: 50 }





end
