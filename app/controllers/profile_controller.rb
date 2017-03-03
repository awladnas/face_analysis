class ProfileController < ApplicationController
  include HTTParty
  def index
    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/detect", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :image_url => "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic6.jpg"
    } )
   render plain: "#{@face_info}"
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

  def detect_face
    res=  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/detect", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :image_url => "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic6.jpg"
    } )

    puts res.inspect
  end

  def serach_face
    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/search", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :face_token1 => "f3cb5356007a60eb8517dd961a5b5b0f",
        :outer_id => "1488448621,ca5eecd4-8e59-484e-9d50-4a72ce6be96a"
    } )

    puts res.inspect
  end

  def compare_face
    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/search", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :face_token1 => "f3cb5356007a60eb8517dd961a5b5b0f",
        :face_token2 => "f3cb5356007a60eb8517dd961a5b5b0f"
    } )

    puts res.inspect
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :attachment)
  end

end
