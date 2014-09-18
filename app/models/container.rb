class Container

  attr_accessor :index

  def self.all
    [3,6,2,5,1,4].map { |x| new(x) }
  end

  def initialize(index)
    self.index = index
  end

  def state
    [:running, :stopped, :frozen][index % 3]
  end

  def name
    "server#{index}"
  end

  def hostname
    "server#{index}"
  end

  def ip_address
    "10.11.12.#{index}"
  end

  def memory_usage
    "#{index * 100} MB"
  end

end