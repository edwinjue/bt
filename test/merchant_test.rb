require 'test_helper'
require 'merchant'


class MerchantTest < Minitest::Test


  def test_can_get_name
    m = Merchant.new({:name => "Turing School"})
    assert_equal "Turing School", m.name
  end

  def test_can_get_id
    m = Merchant.new({:name => "Turing School",:id => 5})
    assert_equal 5, m.id
  end


end
