class Analysts::PropertiesController < ApplicationController
  before_action :authenticate_analyst!


  def index
    @properties = Property.paginate(page: params[:page])
  end

  def show
    @property = Property.find(params[:id])
    @documents = @property.documents.paginate(page: params[:page])
    @document =Document.new
  end


  def upload_document
  end
end