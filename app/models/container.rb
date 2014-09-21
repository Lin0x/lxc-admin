class Container
  include ActiveModel::Model
  include GlobalID::Identification

  attr_accessor :id, :name, :state, :ip_addresses

  def self.all
    container_list
  end

  def self.by_state
    container_list.sort_by { |item| [item.state, item.name] }
  end

  def self.by_name
    container_list.sort_by(&:name)
  end

  def self.find(id)
    new_from_lxc(LXC::Container.new(id))
  end

  def hostname
    "todo"
  end

  def memory_usage
    "todo"
  end

  def start
    sleep(5)
    # TODO
  end

  def stop
    # TODO
  end

  def freeze
    # TODO
  end

  def unfreeze
    # TODO
  end

  def delete
    # TODO
  end

  private

  def self.container_list
    LXC.list_containers.map { |name| new_from_lxc(LXC::Container.new(name)) }
  end

  def self.new_from_lxc(container)
    new({
      id: container.name,
      name: container.name,
      state: container.state,
      ip_addresses: container.ip_addresses.any? ? container.ip_addresses.join("\n") : "-"
    })
  end

end