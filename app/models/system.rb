module System
  extend self

  def hostname
    Socket.gethostname
  end

  def ip_address
    Socket.ip_address_list.detect { |iface| iface.ipv4_private? }.try(:ip_address)
  end

  def os
    RUBY_PLATFORM
  end

end