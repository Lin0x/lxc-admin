class Container < Resource
  include GlobalID::Identification

  class << self

    def by_state
      all(params: { sort: :state })
    end

    def by_name
      all(params: { sort: :name })
    end

  end

  def ip_addresses
    attributes['ip_addresses'].join("\n")
  end

  def state
    attributes['state'].to_sym
  end

  def start;    put(:start);    end
  def stop;     put(:stop);     end
  def freeze;   put(:freeze);   end
  def unfreeze; put(:unfreeze); end

end