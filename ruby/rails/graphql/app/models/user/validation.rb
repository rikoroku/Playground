# frozen_string_literal: true

module User::Validation
  extend ActiveSupport::Concern

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  included do
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  end
end
