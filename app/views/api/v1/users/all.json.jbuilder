# frozen_string_literal: true

json.users do
  json.array! @users, partial: 'info', as: :user
end
