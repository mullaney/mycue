namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_scripts
  end
end

def make_users
  admin = User.create!(email: "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  99.times do |n|
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(email: email, password: password,
                 password_confirmation: password)
  end
end

def make_scripts
  users = User.all(limit: 6)
  9.times do
    title = Faker::Lorem.words(3).join(" ")
    users.each { |user| user.scripts.create!(title: title) }
  end
end