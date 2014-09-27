module HostSystem
  extend self

  def hostname
    Socket.gethostname
  end

  def ip_address
    Socket.ip_address_list.detect(&:ipv4_private?).try(:ip_address)
  end

  def os
    RUBY_PLATFORM
  end

  def lxc_version
    LXC.version
  end

end