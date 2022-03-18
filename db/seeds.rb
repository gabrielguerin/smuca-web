# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Use faker to seed
require 'faker'

# Seed from a CSV file
# require 'csv'

# Delete everything
[Contact, Company, User, Partner].each(&:delete_all)

# Create companies
50.times do
  company = Company.new(
    name: Faker::Company.unique.name
  )
  company.save!
end

# Create users
20.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    job_title: Faker::Job.title,
    email: "#{first_name.parameterize(separator: '_')}.#{last_name.parameterize(separator: '_')}@smuca.fr",
    description: Faker::Lorem.paragraph,
    phone: Faker::Base.with_locale('fr') { Faker::PhoneNumber.cell_phone_with_country_code },
    password: 'password',
    password_confirmation: 'password'
  )
  user.save!
end

# Create contacts
200.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  contact = Contact.new(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name.parameterize(separator: '_')}@#{Faker::Internet.domain_name}",
    phone: Faker::Base.with_locale('fr') { Faker::PhoneNumber.cell_phone_with_country_code },
    company: Company.all.sample
  )
  contact.save!
end

# Create partners
5.times do
  partner = Partner.new(
    name: Faker::Company.unique.name
  )
  partner.save!
end
