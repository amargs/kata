require 'httparty'

loop do
  p HTTParty.get 'http://127.1:4567/'
  sleep(2)
end