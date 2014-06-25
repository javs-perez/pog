class Document < ActiveRecord::Base
	belongs_to :property
	default_scope -> { order('created_at DESC')}

	validates :property_id, 	presence: true
	validates :toi, 					presence: true, length: { maximum: 5 }
	validates :date_recorded, presence: true
	validates :cfn, 					presence: true
	validates :county, 				presence: true
end
