class Merchant

  attr_reader :name, :id

  def initialize(args)
    @name = args[:name]
    @id = args[:id].to_i
  end



end
