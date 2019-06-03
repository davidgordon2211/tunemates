class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave


  def default_url
    "https://res.cloudinary.com/dtbs7luvc/image/upload/v1559563021/noun_avatar_1901054_odfold.png"
  end

end
