# frozen_string_literal: true

FactoryBot.define do
  sequence(:user_name) { |i| "Test User#{i}" }
  sequence(:email) { |i| "test#{i}@example.com" }
end
