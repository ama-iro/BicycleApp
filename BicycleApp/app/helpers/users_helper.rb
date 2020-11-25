module UsersHelper
  require "date"
  # 誕生日から年齢を計算
  def CalAge(birthdayStr)
    if birthdayStr !~ /^[0-9]{8}$/
      return -1
    end
    return (Date.today.strftime("%Y%m%d").to_i - birthdayStr.to_i) / 10000
  end
end
