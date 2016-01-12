require 'test_helper'
require 'item_repository'


class ItemRepositoryTest <  Minitest::Test


  def test_it_can_load_data
    ir = ItemRepository.new
    ir.load_data("./data/items.csv")
    assert_equal 1367, ir.all.length
  end

  def test_can_find_by_ID
    ir = ItemRepository.new
    ir.load_data("./data/items.csv")
    item = ir.find_by_id(263395237)
    assert_equal 263395237, item.id
    assert_equal "510+ RealPush Icon Set", item.name
  end

  def test_returns_nil_if_id_not_in_items
    ir = ItemRepository.new
    ir.load_data("./data/items.csv")
    item = ir.find_by_id(102)
    assert_nil item
  end

  def test_can_find_item_by_name
    ir = ItemRepository.new
    ir.load_data("./data/items.csv")
    

end
