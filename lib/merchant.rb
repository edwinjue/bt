class Merchant

  attr_reader :name, :id

  def initialize(args)
    @name = args[:name]
    @id = args[:id].to_i
  end

  def items(se)
    se.items.find_all_by_merchant_id(id)
  end

end
