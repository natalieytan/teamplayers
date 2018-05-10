module ApplicationHelper

  def marker_map(item)
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{item.latitude},#{item.longitude}&markers=#{item.latitude},#{item.longitude}&zoom=13&scale=1&size=600x300&maptype=roadmap&key=AIzaSyC_XGX34wBaJcGjRQ1PNHoJMSRqAheg7XU&format=jpg&visual_refresh=true", class: "map"
  end
end
