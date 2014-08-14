class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]


  def create
  
   @p =   Property.where(:address => params[:property][:address] , :city => params[:property][:city] , :state => params[:property][:state] , :zip => params[:property][:zip])
    if !@p.blank?
      Follow.create(:user_id => current_user.id , :property_id => @p.first.id)
      redirect_to root_url
    else
      @property = current_user.properties.build(property_params)
        if @property.save
          flash[:success] = "Property protected!"
          redirect_to root_url
          
        else
          @feed_items = []
          render 'static_pages/home'
        end
    end
  end

  def show
    @property = Property.find(params[:id])
    @documents = @property.documents.paginate(page: params[:page])
    @document =Document.new
  end


  def destroy
    @property.destroy
    redirect_to root_url
  end

      
  def download_document
    @document = Document.find(params[:id])
    data = open(@document.record.url)    
    send_data data.read, :type => data.content_type, :x_sendfile => true
  end
  

  private

    def property_params
      params.require(:property).permit(:address, :city, :state, :zip, :folio, :county)
    end

  def correct_user
    @property = current_user.properties.find_by(id: params[:id])
    redirect_to root_url if @property.nil?
  end
end