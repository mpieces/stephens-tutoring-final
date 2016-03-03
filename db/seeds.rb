# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(
  first_name: "Stephen",
  last_name: "Ramon",
  address: "4024 Bryn Mawr",
  city: "Dallas",
  zip: "75225",
  email: "sgr2ak@virginia.edu",
  phone: "999-999-9999",
  year: "H.S. Grad",
  password: "password",
  password_confirmation: "password",
  admin: true)

Testimonial.create!(
  feedback: "I highly recommend Stephen as a tutor. My daughter was really struggling with an AP course, but with his help, she was able to raise her grade significantly! I could see how having been a Highland Park student, he could relate to her teacher's style. Thanks so much.")
