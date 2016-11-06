class CustomDataCollector
  def initialize(data)
    @data = data
  end
end

class CollectToDB < CustomDataCollector
  attr_reader :data
  def initialize(data)
    super
    @data['message'] = encrypt
    @data['link'] = generate_link
  end

  private

  def encrypt
    AESCrypt.encrypt(@data['message'], "p4ssw0rd")
  end

  def generate_link
    LinkGenerator.new.generate
  end	
end
