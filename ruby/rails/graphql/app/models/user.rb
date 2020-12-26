# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  include User::Validation
end
