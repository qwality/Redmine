# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

PASSWORD = 'password'

User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin.admin@admin.admin',
  password: PASSWORD,
  admin: true
)

10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
  User.create(
    email: email,
    first_name: first_name,
    last_name: last_name,
    password: PASSWORD
  )
end

10.times do |i|
  name = "#{Faker::Adjective.positive} #{Faker::IndustrySegments.industry}"
  description = "#{Faker::Company.catch_phrase}. #{Faker::Company.bs.capitalize}. This project focuses on #{Faker::IndustrySegments.sector} and uses newest technologies in #{Faker::ProgrammingLanguage.name}."
  Project.create(
    name: name,
    description: description
  )
end

10.times do |i|
  name = "#{Faker::Verb.base.capitalize} #{Faker::Commerce.product_name}"
  description = "This task #{Faker::Verb.base} a #{Faker::Science.element} analysis of #{Faker::Commerce.product_name} and focuses on enhancing #{Faker::Commerce.department}."
  Task.create(
    name: name,
    description: description,
    project_id: Project.all.sample.id,
    user_id: User.all.sample.id,
    state: Task.states.keys.sample
  )
end


