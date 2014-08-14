class Property < ActiveRecord::Base
	belongs_to :user
	has_many   :documents
	has_many :follows,:dependent => :destroy

	default_scope -> { order('updated_at DESC') }
	validates :user_id, presence: true
	# validates :address, uniqueness: true, presence: true, length: { maximum: 140 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, length: { maximum: 5 }
 	validates :folio, uniqueness: true, presence: true
  # validates :county, presence: true

	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
  
	def full_street_address
	  [address, city, state, zip].compact.join(', ')
	end

	
	def document_upload_notification(document)
	    follows.each do |follow|
		UserMailer.document_upload_notification(document,follow.user).deliver
		end
	end


end
