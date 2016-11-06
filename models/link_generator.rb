class CustomGenerator
  def generate
  end
end

class LinkGenerator<CustomGenerator
  def generate
    str = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    link = (0...50).map { str[rand(str.length)] }.join
    return link
  end
end