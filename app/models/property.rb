class Property < ActiveRecord::Base
	belongs_to :user
	has_many   :documents

	default_scope -> { order('updated_at DESC') }
	validates :user_id, presence: true
	validates :address, presence: true, length: { maximum: 140 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, length: { maximum: 5 }
  validates :folio, presence: true
  validates :country, presence: true

	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
  
	def full_street_address
	  [address, city, state, zip].compact.join(', ')
	end
end
