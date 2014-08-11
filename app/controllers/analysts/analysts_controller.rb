class Analysts::AnalystsController < ApplicationController
  before_action :authenticate_analyst!
  before_action :set_analyst, only: [:show,:destroy]
  before_action :set_current_analyst, only: [:edit_profile,:update,:profile]
  
  def index
    @analysts = Analyst.paginate(page: params[:page], :per_page => 10)
  end

  def show
  end

  def edit_profile
  end


  def update
    if @analyst.update(analyst_params)
      sign_in @analyst, :bypass => true
      flash[:success] = "Analyst was successfully updated."
      redirect_to [:analysts,@analyst]
    else
      render action: 'edit_profile'
    end
  end

  def destroy
    @analyst.destroy
    respond_to do |format|
      format.html { redirect_to analysts_analysts_url }
      format.json { head :no_content }
    end
  end

  def profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyst
      @analyst = Analyst.find(params[:id])
    end

    def set_current_analyst
      @analyst = current_analyst
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyst_params
      params.require(:analyst).permit(:name, :email, :analyst, :password, :password_confirmation)
    end

  end
