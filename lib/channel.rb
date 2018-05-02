class Channel
  def initialize(name)
    @name = name
  end

  def self.from_api(response)
    self.new(response["name"])
  end
end
