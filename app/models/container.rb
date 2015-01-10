class Container < Resource
  include GlobalID::Identification

  schema do
    attribute :name,      :string
    attribute :template,  :string
    attribute :rootfs,    :string
    attribute :autostart, :boolean
  end

  class << self

    def new_with_defaults
      new(name: generated_name, rootfs: [lxc_path, generated_name].join('/'))
    end

    def by_state
      all(params: { sort: :state })
    end

    def by_name
      all(params: { sort: :name })
    end

    private

    def lxc_path
      GlobalConfigItem.find_by_key('lxc.lxcpath').value
    end

    def generated_name
      "lxc-#{Time.now.to_i}"
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
