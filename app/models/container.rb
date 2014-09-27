class Container
  include ActiveModel::Model
  include GlobalID::Identification

  attr_accessor :id, :name, :template, :autostart, :rootfs, :net_type, :net_hwaddr, :state, :ip_addresses

  delegate :start, :stop, :freeze, :unfreeze, :destroy, to: :lxc_container

  STATES = [:stopped, :frozen, :running]

  class << self

    def all
      container_list
    end

    def by_state
      container_list.sort_by { |item| [STATES.index(item.state), item.name] }
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

  def initialize(*args)
    super
    @name   ||= 'foo'
    @rootfs ||= '/var/lib/lxc/foo/rootfs'
  end

  def pid
    lxc_container.init_pid.to_i if running?
  end

  def hostname
    return File.readlines(hostname_file).first if File.exists?(hostname_file)
    "-"
  end

  def memory_usage
    return GetProcessMem.new(pid).bytes if running?
    0
  end

  def config_file_path
    [lxc_container.config_path, id, 'config'].join(File::SEPARATOR)
  end

  def config_file_content
    File.readlines(config_file_path).join
  end

  def rootfs_path
    lxc_container.config_item('lxc.rootfs')
  end

  def running?
    state == :running
  end

  def frozen?
    state == :frozen
  end

  def create
    lxc_container.create(template)
  end

  private

  def lxc_container
    @_lxc_container ||= LXC::Container.new(id)
  end

  def hostname_file
    [rootfs_path, 'etc', 'hostname'].join(File::SEPARATOR)
  end

end