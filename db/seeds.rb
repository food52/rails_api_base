# frozen_string_literal: true

# This file is for seeding a database with data in order to produce an interactive application from cold start
# It is suggested to use Faker in loops with model methods in order to produce representative data

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
Setting.create_or_find_by!(key: 'min_version', value: '0.0')
