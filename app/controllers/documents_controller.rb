class DocumentsController < ApplicationController
  before_action :signed_in_user

  def create
  	@document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def show
  	@property = current_user.properties.find_by(params[:id])
  end

  def destroy
  end

  private

    def document_params
      params.require(:document).permit(:toi, :date_signed, :date_recorded, 
                                       :party1, :party2, :cfn, :county, 
                                       :amount, :property_id, :record)
    end
end
