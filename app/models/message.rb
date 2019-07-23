# frozen_string_literal: true

require 'elasticsearch/model'

class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat, counter_cache: true, dependent: :destroy
  before_validation :assign_number, on: :create
  validates :number, :body, presence: true
  validates :number, uniqueness: { scope: :chat_id }, on: :create

  def self.search(query)
    __elasticsearch__.search(
      query: {
        multi_match: {
          query: query,
          fields: %w[body]
        }
      }
    )
  end

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
#
# Message.__elasticsearch__.create_index!
# Message.import
