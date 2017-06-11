module LinksHelper

  def display_new_short_link(short_link)
    request.port.blank? ? request.host : "#{request.host}:#{request.port}/#{short_link}"
  end

end
