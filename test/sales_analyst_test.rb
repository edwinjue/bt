require 'test_helper'
require 'sales_analyst'


class SalesAnalystTest < Minitest::Test

  def test_Analyst_has_a_SaleEngine
    se = SalesEngine.from_csv({:items =>
                  "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    sa = SalesAnalyst.new(se)
    assert_kind_of SalesEngine, sa.sales_engine
  end

  def test_average_items_per_merchant
    se = SalesEngine.from_csv({:items =>
                  "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    sa = SalesAnalyst.new(se)
    assert_equal 2, sa.average_items_per_merchant
  end

  def test_can_calculate_the_standard_deviation_of_items_per_merchant
    se = SalesEngine.from_csv({:items =>
                  "./data/items.csv",
                  :merchants => "./data/merchants.csv"})
    sa = SalesAnalyst.new(se)
    assert_equal 3.376, sa.average_items_per_merchant_standard_deviation.round(3)
  end

end
