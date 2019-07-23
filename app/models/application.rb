# frozen_string_literal: true

class Application < ApplicationRecord
  has_secure_token

  validates :name, presence: true
  validates :token, uniqueness: true

  has_many :chats
  private
end
