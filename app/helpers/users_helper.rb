module UsersHelper

  #Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    # took out downcase method
    gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
end
