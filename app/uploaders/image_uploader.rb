require "image_processing/mini_magick"
 
class ImageUploader < Shrine
  plugin :processing
  plugin :activerecord, validations: true
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :default_url

  Attacher.default_url do |options|
    ActionController::Base.helpers.asset_path 'defaultpic.png'
  end

  Attacher.validate do
    validate_max_size 1.megabytes, message: 'is too large (max is 1 MB)'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    validate_extension_inclusion %w[jpg jpeg png gif]
  end

  process(:store) do |io, context|

    original = io.download
    pipeline = ImageProcessing::MiniMagick.source(original)
    square = pipeline.resize_to_fill!(250, 250)
    size_800 = pipeline.resize_to_limit!(800, 800)
    size_500 = pipeline.resize_to_limit!(500, 500)
    size_300 = pipeline.resize_to_limit!(300, 300)

    original.close!

    { original: io, large: size_800, medium: size_500, small: size_300, square: square }
  end
end