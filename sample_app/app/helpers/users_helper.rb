module UsersHelper
  def gravatar_for(user, options= { size:80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatra_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatra_url, alt: user.name, class: "gravatar")
  end
end
