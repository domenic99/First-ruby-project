class CustomDataCollector
  def initialize(data)
    @data = data
  end
end

class CollectToDB<CustomDataCollector
  attr_reader :data
  def initialize(data)
    super
    @data['message'] = AESCrypt.encrypt(@data['message'], "p4ssw0rd")
    @data['link'] = LinkGenerator.new.generate
  end
end