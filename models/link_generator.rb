class CustomGenerator
  def generate
  end
end

class LinkGenerator < CustomGenerator
  def generate
    link = SecureRandom.hex(10)
    return link
  end
end
