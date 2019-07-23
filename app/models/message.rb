# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat, counter_cache: true, dependent: :destroy
  before_validation :assign_number
  validates :number, presence: true
  validates :number, uniqueness: { scope: :chat_id }, on: :create

  private

  def assign_number
    with_lock do
      self.number = latest_number + 1
    end
  end

  def latest_number
    chat.messages_count
  end
end
