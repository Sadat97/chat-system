# frozen_string_literal: true

class Chat < ApplicationRecord
  before_validation :assign_number
  belongs_to :application, counter_cache: true, dependent: :destroy
  has_many :messages
  validates :number, presence: true
  validates :number, uniqueness: { scope: :application_id }, on: :create

  private

  def assign_number
    with_lock do
      self.number = latest_number + 1
    end
  end

  def latest_number
    application.chats_count
  end
end
