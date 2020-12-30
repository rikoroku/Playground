# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :votes
end
