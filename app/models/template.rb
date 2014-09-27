class Template
  include ActiveModel::Model

  attr_accessor :name

  DEFAULT = new(name: 'ubuntu')

  PATH = '/usr/share/lxc/templates'

  class << self
    def all
      Dir["#{PATH}/*"].collect do |file|
        new(name: file.gsub(/#{PATH}\/lxc-/, ''))
      end
    end
  end
end