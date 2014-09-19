require 'rails_helper'

describe Container do

  module LXC
    def self.list_containers
      %w(foo3 foo1 foo2)
    end

    class Container
      def self.new(name)
        case name.to_s
          when 'foo1' then OpenStruct.new(name: 'foo1', state: :running, ip_addresses: %w(1.2.3.4))
          when 'foo2' then OpenStruct.new(name: 'foo2', state: :stopped, ip_addresses: %w(1.2.3.4))
          when 'foo3' then OpenStruct.new(name: 'foo3', state: :running, ip_addresses: %w(1.2.3.4))
        end
      end
    end
  end

  describe '.all' do
    it 'returns all containers in the order provided by lxc' do
      expect(Container.all.map(&:name)).to eq %w(foo3 foo1 foo2)
    end
  end

  describe '.by_status' do
    it 'returns all containers sorted by their state' do
      expect(Container.by_state.map(&:name)).to eq %w(foo1 foo3 foo2)
    end
  end

  describe '.by_name' do
    it 'returns all containers sorted by their names' do
      expect(Container.by_name.map(&:name)).to eq %w(foo1 foo2 foo3)
    end
  end

end