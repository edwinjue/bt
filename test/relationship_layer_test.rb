require 'test_helper'
require 'sales_engine'

class RelationshipLayerTest < Minitest::Test
  def test_can_get_all_items_of_a_specific_merchant
    se = SalesEngine.from_csv({
    :items     => "./data/items.csv",
    :merchants => "./data/merchants.csv",
    })
    merchant = se.merchants.find_by_id(12334185)
    glitter_merch_names = ["Glitter scrabble frames", "Disney scrabble frames", "Free standing Woden letters", "Scrabble frames baby boy girl", "Free standing glitter dogs", "Hair clip holder"]

    merchandise = merchant.items(se)
    merch_names = merchandise.map {|item| item.name}
    assert_equal glitter_merch_names.sort, merch_names.sort
    # => [<item>, <item>, <item>]
  end

  def test_can_get_merchant_from_a_specific_item
    se = SalesEngine.from_csv({
    :items     => "./data/items.csv",
    :merchants => "./data/merchants.csv",
    })
    item = se.items.find_by_id(263499920)
    assert_equal "Free standing glitter dogs", item.name
    merch = item.merchant(se)
    assert_kind_of Merchant, merch
    assert_equal "Madewithgitterxx", merch.name
  end


end
