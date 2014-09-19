class Container
  include ActiveModel::Model

  attr_accessor :name, :state, :ip_addresses

  def self.all
    container_list
  end

  def self.by_state
    container_list.sort_by { |item| [item.state, item.name] }
  end

  def self.by_name
    container_list.sort_by(&:name)
  end

  def hostname
    "todo"
  end

  def memory_usage
    "todo"
  end

  private

  def self.container_list
    LXC.list_containers.map { |name| new_from_lxc(LXC::Container.new(name)) }
  end

  def self.new_from_lxc(container)
    new({
      name: container.name,
      state: container.state,
      ip_addresses: container.ip_addresses.any? ? container.ip_addresses.join("\n") : "-"
    })
  end

end