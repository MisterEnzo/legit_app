module UsersHelper
  def gravatar(user)
    hash = Digest::MD5.hexdigest(user.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
