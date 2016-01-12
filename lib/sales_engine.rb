class SalesEngine
  attr_reader :items, :merchants
  def initialize
    @items = ItemRepository.new
    @merchants = MerchantRepository.new
  end

  def load_data(args)
    items.load_data(args[:items])
    merchants.load_data(args[:merchants])
  end

end
