class ProfileController < ApplicationController

  include HTTParty
  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    img_url = params["profile"]["attachment"]
    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/detect", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :image_url => img_url
    } )
    @face = Face.new
    @faces = @face_info["faces"]
    @faces.each do  |i|
        @face.img_token = i["face_token"]
        @face.img_url = img_url
        @face.save!
    end
    # render plain: "#{@face_info}"
  end

  def show
    @face = Face.new
  end

  def profile_attachment
    @profile = Profile.find_by_name(params[:profile_name])
  end

  def serach_face
    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/search", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :face_token1 => "f3cb5356007a60eb8517dd961a5b5b0f",
        :outer_id => "1488448621,ca5eecd4-8e59-484e-9d50-4a72ce6be96a"
    } )
    render plain: "#{@face_info}"
  end

  def compare_face

    img_url1 = params["profile"]["attachment"]
    img_url2 = params["profile"]["attachment_2"]

    @face_info =  HTTParty.post("https://api-us.faceplusplus.com/facepp/v3/compare", :body=> {
        :api_key => "0BPOcncjMOdVxsYce0K8eAAEDBvlT6_h",
        :api_secret => "r8L47AnUGN34VJL-5ftp6rHZ9UHDKcSL",
        :image_url1 => img_url1,
        :image_url2 => img_url2
    } )

    render plain: "#{@face_info}"
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :attachment)
  end

end
