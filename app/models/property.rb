class Property < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('updated_at ASC') }
	validates :user_id, presence: true
	validates :address, presence: true, length: { maximum: 140 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, length: { maximum: 5 }
end
