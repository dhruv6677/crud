class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @profiles = Profile.all
    @profiles = Profile.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @profile = Profile.find(params[:id])
    
   
  end

  def new
    @profile = Profile.new
    
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to profiles_path
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to profiles_path
    flash.alert = "User not found."

  end


  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@profile), notice: "Product was successfully destroyed." }
     
    
    end

  end
    private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone_no)
  end
end
