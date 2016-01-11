class Merchant

  attr_reader :name, :id

  def initialize(args, id = 3)
    @name = args[:name]
    @id = id.to_i
  end

  

end
