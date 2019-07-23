# frozen_string_literal: true

class Chat < ApplicationRecord
  before_validation :assign_number, on: :create
  belongs_to :application, counter_cache: true
  has_many :messages, dependent: :destroy
  validates :number, presence: true
  validates :number, uniqueness: { scope: :application_id }, on: :create

  private

  def assign_number
    application.with_lock do
      self.number = latest_number + 1
    end
  end

  def latest_number
    application.chats_count
  end
end
