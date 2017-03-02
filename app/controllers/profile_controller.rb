require "rubygems"
require "rest-client"
class ProfileController < ApplicationController
  def index
  url = 'https://api-us.faceplusplus.com/facepp/v3/detect'
  # img_url ="data:image/jpeg;base64,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"
  # res = RestClient.get("http://en.wikipedia.org/wiki")
   res = RestClient.post("https://api-us.faceplusplus.com/facepp/v3/detect", {:api_key=> "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h", :api_secret=> "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL" })
  puts res.code
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
