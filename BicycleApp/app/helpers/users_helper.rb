module UsersHelper
  require "date"
  # 誕生日から年齢を計算
  def CalAge(birthdayStr)
    if birthdayStr !~ /^[0-9]{8}$/
      return -1
    end
    return (Date.today.strftime("%Y%m%d").to_i - birthdayStr.to_i) / 10000
  end


  def gravatar_for(user, size: 80, cl: "gravatar")
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mp&?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: cl)
  end
end
