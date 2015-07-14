class HardwareDecorator < Draper::Decorator
  delegate_all

  def location_link
    location = object.location
    return '--' unless location
    h.link_to location.name, h.location_path(location)
  end
end
