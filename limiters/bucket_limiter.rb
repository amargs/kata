class BucketLimiter
  INITIAL_QTY = 10

  attr_accessor :counter

  def initialize
    @counter = {}

    Thread.new do
      loop do
        sleep 60
        puts 'refreshing'
        counter.each do |key, value|
          counter[key] = min(value + INITIAL_QTY, INITIAL_QTY)
        end
      end
    end
  end

  def evaluate(ip, _timestamp)
    qty = counter.fetch(ip, INITIAL_QTY)
    counter[ip] = qty - 1
    p qty, counter
    qty >= 0
  end
end