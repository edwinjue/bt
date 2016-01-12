require_relative 'item_repository'
require_relative 'merchant_repository'
class SalesEngine
  attr_reader :items, :merchants
  def initialize
    @items = ItemRepository.new
    @merchants = MerchantRepository.new
  end

  def self.from_csv(args)
    se = SalesEngine.new
    se.items.load_data(args[:items])
    se.merchants.load_data(args[:merchants])
    se
  end

end
