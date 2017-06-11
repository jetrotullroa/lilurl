module LinksHelper

  def display_new_short_link(short_link)
    request.local? ? "#{request.host}:#{request.port}/#{short_link}" : "#{request.host}/#{short_link}"
  end

end
