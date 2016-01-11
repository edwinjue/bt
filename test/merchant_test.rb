require 'minitest'
require './lib/merchant'


class MerchantTest < Minitest::Test


  def test_can_get_name
    m = Merchant.new({:name => "Turing School"})
    assert_equal "Turing School", m.name
  end

  def test_has_a_default_id
    m = Merchant.new({:name => "Turing School"})
    assert_equal 3, m.id
  end

  def test_can_set_specific_id
    m = Merchant.new({:name => "Turing School"},5)
    assert_equal 5, m.id
  end

  
end
