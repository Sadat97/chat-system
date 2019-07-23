class MessageSerializer < ActiveModel::Serializer
  attributes :message_number, :body
  has_one :chat
end
