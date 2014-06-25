class Property < ActiveRecord::Base
	belongs_to :user
	has_many 	 :documents

	default_scope -> { order('updated_at DESC') }
	validates :user_id, presence: true
	validates :address, presence: true, length: { maximum: 140 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, length: { maximum: 5 }
end
