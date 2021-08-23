class ProfilesController < ApplicationController
  def index
    #byebug
    if current_user.profile == nil || current_user.profile.dob == nil || current_user.profile.address == nil || current_user.profile.dp.attached? == false
      @profile= Profile.new
    else
      redirect_to notes_path
    end
  end

  def create
      #byebug
      @profile = Profile.new(profile_params)
      #byebug
        @profile.dp.attach(params[:profile][:dp])
        @profile.user_id=current_user.id
        if @profile.save
        redirect_to notes_path
      else
        flash[:notice] = "you must enter all details"
        redirect_to profiles_path
      end
  end

  def update
    #byebug
    @profile = Profile.find(current_user.profile.id)
    
    if @profile.update(profile_params)
      @profile.dp.attach(params[:profile][:dp])
      redirect_to notes_path
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:dob, :address, :dp)
    end
end
