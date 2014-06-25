class Document < ActiveRecord::Base
	belongs_to :property
	default_scope -> { order('created_at DESC')}
	has_attached_file :record, :style => { :medium => "300x300>", :thumb => "100x100>"},
														 :url => "/assets/documents/:id/:style/:basename.:extension",
														 :path => "rails_root/public/assets/documents/:id/:style/:basename.:extension" # 
	do_not_validate_attachment_file_type :record

	validates :property_id, 	presence: true
	validates :toi, 					presence: true, length: { maximum: 5 }
	validates :date_recorded, presence: true
	validates :cfn, 					presence: true
	validates :county, 				presence: true
end
