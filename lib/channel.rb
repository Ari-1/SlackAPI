class Channel
  def initialize(name, id)
    @id = id
    @name = name
  end

  def self.from_api(raw_channel)
    self.new(
      raw_channel["name"],
      raw_channel["id"]
    )
  end
end
