require 'sinatra'
require_relative 'limiters/bucket_limiter'

limiter = BucketLimiter.new

get '/frank-says' do
  "Put this in your pipe & smoke it!\n"
end

get '/' do
  p request.inspect
  return "denied" unless limiter.evaluate(request.ip, Time.now)

  "passed"
end
