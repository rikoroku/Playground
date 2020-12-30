# frozen_string_literal: true

class Link < ApplicationRecord
  validates :url, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }

  has_many :votes
end
