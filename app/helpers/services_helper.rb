module ServicesHelper
  def services_json(services)
    Gmaps4rails.build_markers(services) do |service, marker|
      marker.lat        service.latitude
      marker.lng        service.longitude
      marker.infowindow service.name
    end
  end
end
