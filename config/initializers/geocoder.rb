Geocoder.configure(
  :use_https => true,
  :units => :km,
  :google=> {
  :api_key => ENV['GEOCODER_API']
  }  
)