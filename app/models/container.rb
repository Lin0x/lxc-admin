class Container
  include ActiveModel::Model
  include GlobalID::Identification

  attr_accessor :id, :name, :state, :ip_addresses

  delegate :start, :stop, :freeze, :unfreeze, :destroy, to: :lxc_container

  class << self

    def all
      container_list
    end

    def by_state
      container_list.sort_by { |item| [item.state, item.name] }
    end

    def by_name
      container_list.sort_by(&:name)
    end

    def find(id)
      new_from_lxc(LXC::Container.new(id))
    end

    private

    def container_list
      LXC.list_containers.map { |name| new_from_lxc(LXC::Container.new(name)) }
    end

    def new_from_lxc(container)
      new({
        id: container.name,
        name: container.name,
        state: container.state,
        ip_addresses: container.ip_addresses.any? ? container.ip_addresses.join("\n").encode : "-"
      })
    end

  end

  def hostname
    "todo"
  end

  def memory_usage
    "todo"
  end

  def frozen?
    state == :frozen
  end

  private

  def lxc_container
    @_lxc_container ||= LXC::Container.new(id)
  end

end