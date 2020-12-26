# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  include User::Validation

  delegate :authenticate, to: :authenticator, prefix: true

  def authenticator
    @authenticator ||= User::Delegation::Authenticator.new(self)
  end
end
