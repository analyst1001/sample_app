module UsersHelper
  def gravator_for(user, options = {size:40})
    gravator_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravator_url = "https://secure.gravator.com/avatar/#{gravator_id}?s=#{size}"
    image_tag(gravator_url, alt: user.name, class: "gravator")
  end
end
