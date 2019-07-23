def seed_data
  return if Application.count.positive?
  puts "Creating some applications"
  2.times do |number|
    a = Application.create! name: "Hamada #{number}"
    3.times do
      puts "Creating some Chats"
      c = a.chats.create!
      5.times do |message_number|
        puts "Creating some messages"
        c.messages.create! body: "bla bla #{message_number}"
      end
    end
  end
end

def index_messages_body
  Message.__elasticsearch__.create_index!
  Message.import
end

seed_data
index_messages_body
