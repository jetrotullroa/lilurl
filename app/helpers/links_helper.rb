module LinksHelper

  def display_new_short_link(short_link)
    request.local? ? "#{request.host}:#{request.port}/#{short_link}" : "#{request.host}/#{short_link}"
  end

  def get_creators_name(link)
    if link.user_id?
      user = User.find(link.user_id)
      "Created by #{user.username}"
    else
      "Created by an anonymous"
    end
  end

  def link_date(link)
    time_ago_in_words(link.created_at)
  end

end
