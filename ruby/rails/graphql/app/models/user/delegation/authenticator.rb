# frozen_string_literal: true

class User::Delegation::Authenticator
  def initialize(user)
    @user = user
  end

  def authenticate(credentials)
    @user.authenticate(credentials[:password])

    # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    crypt.encrypt_and_sign("user-id:#{@user.id}")
  end
end
