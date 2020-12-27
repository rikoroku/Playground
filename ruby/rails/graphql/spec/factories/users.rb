# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { generate :user_name }
    email { generate :email }
    password { 'Passw0rd!' }
  end
end
