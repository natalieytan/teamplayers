Geocoder.configure(
  :use_https => true,
  :google=> {
  :api_key => ENV['GEOCODER_API']
  }  
)