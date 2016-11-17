module ServicesHelper
  def services_json(services)
    Gmaps4rails.build_markers(services) do |service, marker|
      service_booking = link_to "Book TRIM", new_service_booking_path(service)
      marker.lat        service.latitude
      marker.lng        service.longitude
      marker.infowindow gmaps4rails_service_infowindow(service) + service_booking
    end
  end

  def gmaps4rails_service_infowindow(service)
    "<h4>#{service.name}</h4>" +
    "<h6>#{service.provider.user.first_name}</h6>" +
    "<p>Price: #{cost(service)}</p>"
  end

  def cost(service)
    number_to_currency(service.rate)
  end
end
