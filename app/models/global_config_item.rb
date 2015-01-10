class GlobalConfigItem < Resource
  schema do
    attribute :key,   :string
    attribute :value, :string
  end

  def self.find_by_key(key)
    find(key)
  end
end
