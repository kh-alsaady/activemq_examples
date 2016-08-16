require 'stomp'
require 'json'

queue = "/queue/hello"

client = Stomp::Client.new "system", "manager", "localhost", 61613, true

client.subscribe(queue) do |msg|
  msg.to_json
  puts 'success subscribed'
  puts msg.inspect
end
