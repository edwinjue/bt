require 'test_helper'
require 'merchant_repository'


class MerchantRepositoryTest < Minitest::Test

  def test_loads_data
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    assert_equal 12334105, mr.all[0].id
    assert_equal "Shopin1901", mr.all[0].name
    assert_equal 475, mr.all.length
  end

  def test_find_by_matching_id
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchant = mr.find_by_id(12334442)
    assert_equal 12334442, merchant.id
    assert_equal "isincerely88", merchant.name

  end

  def test_will_return_nil_if_invalid_Merchant_id
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchant = mr.find_by_id(105)
    assert_nil merchant
  end

  def test_find_by_name
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchant = mr.find_by_name("JustReallyCoolStuff")
    assert_equal "JustReallyCoolStuff", merchant.name
    assert_equal 12334662, merchant.id
  end

  def test_will_return_nil_if_invalid_Merchant_name
    skip
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchant = mr.find_by_name("Amie")
    assert_nil merchant
  end

  def test_will_find_by_name_regardless_of_case
    skip
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchant = mr.find_by_name("SwaNIawski-cremin")
    assert_equal "Swaniawski-Cremin", merchant.name
    assert_equal 96, merchant.id
  end

  def test_will_find_all_Merchants_by_name
    skip
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchants = mr.find_all_by_name("son")
    assert_equal "Willms and Sons", merchants[0].name
    assert_equal 18, merchants.length
  end

  def test_will_find_all_Merchants_by_name_is_case_insensitive
    skip
    mr = MerchantRepository.new
    mr.load_data("./data/merchants.csv")
    merchants = mr.find_all_by_name("SON")
    assert_equal "Okuneva, Prohaska and Rolfson", merchants.last.name
    assert_equal 18, merchants.length
  end
end
