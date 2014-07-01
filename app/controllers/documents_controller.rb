class DocumentsController < ApplicationController
  before_action :signed_in_user_or_analyst
  before_action :admin_user,    only: :destroy

  def create
  	@document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document created!"
      redirect_to properties_path
    else
      redirect_to root_url
    end
  end

  def show
  	@property = current_user.properties.find_by(params[:id])
  end

  def destroy
    Document.find(params[:id]).destroy
    flash[:sucess] = "Document Deleted"
    redirect_to root_url
  end

  private

    def document_params
      params.require(:document).permit(:toi, :date_signed, :date_recorded, 
                                       :party1, :party2, :cfn, :county, 
                                       :amount, :property_id, :record)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
