User.create! name: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1

User.create! name: "tuanh", email: "tuanhnt@gmail.com",
  password: "123123", password_confirmation: "123123"

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email,
    password: password, password_confirmation: password
end

user = User.first
user1 = User.last
50.times do |n|
  title = "Post #{n} praesent sapien massa, convallis a pellentesque nec, egestas non nisi."
  content = Faker::Lorem.sentence 100
  user.posts.create! title: title, content: content
  user1.posts.create! title: title, content: content
end
