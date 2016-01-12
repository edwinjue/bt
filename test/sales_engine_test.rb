require 'test_helper'
require 'sales_engine'

class SalesEngineTest < Minitest::Test
  def test_defaults_with_an_item_repository_and_a_merchant_repository
    se= SalesEngine.new
    assert_kind_of ItemRepository, se.items
    assert_kind_of MerchantRepository, se.merchants
  end

  def test_loads_all_items
    se = SalesEngine.from_csv({:items => "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    assert_equal 1367, se.items.all.length
  end

  def test_loads_all_merchants
    se= SalesEngine.from_csv({:items => "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    assert_equal 475, se.merchants.all.length
  end

  def test_can_find_a_specific_merchant
    se= SalesEngine.from_csv({:items => "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    merchant_name = "HeadyMamaCreations"
    assert_equal "HeadyMamaCreations", se.merchants.find_by_name(merchant_name).name
  end

  def test_can_find_an_item_by_merchant_id
    se= SalesEngine.from_csv({:items => "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    merchant_id = 12334235
    item = se.items.find_all_by_merchant_id(merchant_id)[0]
    assert_equal 8000, item.unit_price
    assert_equal 263397201, item.id
  end

end
