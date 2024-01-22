# frozen_string_literal: true

require 'faker'

# This file is for seeding a database with data in order to produce an interactive application from cold start
# It is suggested to use Faker in loops with model methods in order to produce representative data

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
Setting.create_or_find_by!(key: 'min_version', value: '0.0')

########################
# Seed development data
########################

return unless Rails.env.development?

#
# Users
#
# rubocop:disable all
begin
  User.destroy_all

  100.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      created_at: Faker::Time.between(from: 1.year.ago, to: 2.months.ago),
      updated_at: Faker::Time.between(from: 4.weeks.ago, to: DateTime.now)
    )
  end

  puts "Created #{User.count} users"
rescue => e
  debugger
  puts e
end
# rubocop:enable all
