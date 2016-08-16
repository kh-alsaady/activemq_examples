require 'stomp'
require 'json'

def publish (message, queue_name)
  queue = "/queue/#{queue_name}"
  message = message.to_json
  
  client = Stomp::Client.new "system", "manager", "localhost", 61613, true
  
  client.publish(queue, message, {
    :'content-type' => 'application/json',
    :persistent     => true
  })
  
  puts 'success publish'
  client.close
end

# message = 'hello guys'
message = {name: "Khalid", age: 27}
queue   = 'hello'

publish(message, queue)
