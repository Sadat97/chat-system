class ChatSerializer < ActiveModel::Serializer
  attributes :chat_number, :messages_count
  has_many :messages
  has_one :application
end
