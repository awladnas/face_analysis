
class ProfileController < ApplicationController
  def index

  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    profile.save!
    redirect_to action: "index"
  end

  def destroy
  end

  def show
  end

  def profile_attachment
    @profile = Profile.find_by_name(params[:profile_name])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :attachment)
  end

end
