User.create!(
  name: 'テスト太郎',
  email: 'test@test.com',
  gender: 0,
  birthday: "1995-07-18",
  introduction: 'testtesttest',
  password: 'password1'
)

User.create!(
  name: 'AdminUser',
  email: 'admin@admin.com',
  gender: 2,
  birthday: "1999-11-11",
  introduction: 'I am admin user',
  password: 'password1',
  admin: true
)

10.times do |n|
  Post.create!(title: Faker::Color.color_name,#バリデーションの文字数に引っかからないと思われるfakerを使用
               area: 1,
               place: "初期データplace",
               description: "sample"*40,
               required_time: 30,
               user_id: 1)
end
