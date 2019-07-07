# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
User.create!(name:  "atsuta",
             email: "jyoljyo05@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@jmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# lesson
20.times do |n|
  title  = "title#{n+1}"
  description1 = "description1"
  description2 = "description2"
  Lesson.create!(title: title,
                 description1: description1,
                 description2: description2)
end

# success
lessons = Lesson.all
user = User.first
lessons.each { |lesson| user.check(lesson) }
