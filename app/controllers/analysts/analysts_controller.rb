class Analysts::AnalystsController < ApplicationController
  before_action :set_analyst, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_analyst!, only: [:index, :edit, :update]
  before_action :correct_analyst, only: [:edit, :update]

  def index
    @analysts = Analyst.paginate(page: params[:page])
  end

  def show
  end

  def new
    @analyst = Analyst.new
  end

  def edit
  end

  def create
    @analyst = Analyst.new(analyst_params)

    if @analyst.save
      sign_in @analyst
      flash[:success] = "Start Protecting Properties"
      redirect_to @analyst
    else
      render action: 'new'
    end
  end

  def update
    if @analyst.update(analyst_params)
      flash[:success] = "Analyst was successfully updated."
      redirect_to @analyst
    else
      render action: 'edit'
    end
  end

  def destroy
    @analyst.destroy
    respond_to do |format|
      format.html { redirect_to analysts_analysts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyst
      @analyst = Analyst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyst_params
      params.require(:analyst).permit(:name, :email, :analyst, :password, :password_confirmation)
    end


    def correct_analyst
      @analyst = Analyst.find(params[:id])
      redirect_to(root_url) unless current_analyst.id= @analyst.id
    end
  end
