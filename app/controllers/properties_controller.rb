class PropertiesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      flash[:success] = "Property protected!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @property.destroy
    redirect_to root_url
  end

  def show
    @property = Property.find(params[:id])
    @documents = @property.documents.paginate(page: params[:page])
    @document = Document.new
  end


  private

    def property_params
      params.require(:property).permit(:address, :city, :state, :zip)
    end

    def correct_user
      @property = current_user.properties.find_by(id: params[:id])
      redirect_to root_url if @property.nil?
    end
end