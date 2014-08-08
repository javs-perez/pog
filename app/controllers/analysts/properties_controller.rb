class Analysts::PropertiesController < ApplicationController
  before_action :authenticate_analyst!
  before_action :set_document,:only=>[:destroy_document,:download_document]


  def index
    @properties = Property.paginate(page: params[:page])
  end

  def show
    @property = Property.find(params[:id])
    @documents = @property.documents.paginate(page: params[:page])
    @document = Document.new
  end


  def upload_document
    @document = Document.new(document_params)
    if @document.save
      UserMailer.document_upload_notification(@document).deliver
      flash[:success] = "Document created!"
      redirect_to analysts_property_path(@document.property)
    else  
      redirect_to analysts_root_path
    end
  end

  def destroy_document
    property = @document.property 
    @document.destroy
    redirect_to analysts_property_path(property)
  end
  

  def download_document
    send_file @document.record.url
  end


private

  def set_document
    @document = Document.find(params[:id])
  end
 
  def document_params
    params.require(:document).permit!
  end

end