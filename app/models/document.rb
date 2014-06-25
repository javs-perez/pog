class Document < ActiveRecord::Base
	belongs_to :property
	# before_post_process :skip_for_pdf

	default_scope -> { order('created_at DESC')}
	has_attached_file :record
	validates_attachment :record, content_type: { content_type: "application/pdf" }
	validates :property_id, 	presence: true
	validates :toi, 					presence: true, length: { maximum: 5 }
	validates :date_recorded, presence: true
	validates :cfn, 					presence: true
	validates :county, 				presence: true

	after_save :update_property

	private

		def update_property
			self.property.touch
		end

		def skip_for_pdf
    ! %w(application/pdf).include?(record_content_type)
  	end
end
