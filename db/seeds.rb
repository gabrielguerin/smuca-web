# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

#   Character.create(name: "Luke", movie: movies.first)

# Use faker to seed

require 'faker'

# Seed from a CSV file

require 'csv'

# Require Rails Internationalization

require 'i18n'

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

users_csv = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))

users = CSV.parse(users_csv, headers: true, col_sep: ',', encoding: 'utf-8')

users.each do |row|
  puts row

  user = User.new

  user.first_name = row['first_name']

  user.last_name = row['last_name']

  user.job_title = row['job_title']

  user.email = I18n.transliterate(row['email'])

  user.description = row['description']

  user.phone = row['phone']

  user.role = 1

  user.password = row['password']

  user.password_confirmation = row['password_confirmation']

  avatar = Rails.root.join('app', 'assets', 'images', 'users', 'seeds', 'avatars', (row['avatar_filename']).to_s)

  if File.exist?(avatar)

    user.avatar.attach(
      io: File.open(avatar),

      filename: I18n.transliterate(row['avatar_filename']),

      content_type: row['content_type']
    )

  end

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

partners_csv = File.read(Rails.root.join('lib', 'seeds', 'partners.csv'), encoding: 'bom|utf-8')

partners = CSV.parse(partners_csv, headers: true, col_sep: ',')

partners.each do |row|
  partner = Partner.new

  partner.name = row['name']

  partner.logo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'partners', (row['logo_filename']).to_s)),

    filename: I18n.transliterate(row['logo_filename']),

    content_type: row['content_type']
  )

  partner.save!
end
