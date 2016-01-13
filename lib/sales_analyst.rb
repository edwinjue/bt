#require 'math'
require 'pry'
require 'descriptive_statistics'
require "sales_engine"

class SalesAnalyst

  attr_reader :se

  def initialize(se)
    @se = se
  end

  def sales_engine
    @se
  end

  def average_items_per_merchant
    num_merchants = total_number_of_merchants
    sum = total_items_from_all_merchants
    sum/num_merchants.to_f
  end

  def average_items_per_merchant2
    merchant_items_count = []
    merchant_items_count = se.merchants.collect{ |m|
      m.items.length
    }
    merchant_items_count.mean
  end

  def average_items_per_merchant_standard_deviation
    Math.sqrt(items_variance)
  end

  def average_items_per_merchant_standard_deviation2
    merchant_items_count = []
    merchant_items_count = se.merchants.collect{ |m|
      m.items.length
    }
    merchant_items_count.standard_deviation
  end

  def total_number_of_merchants
    se.merchants.all.length
  end

  def total_items_from_all_merchants
    sum = 0
    se.merchants.all.each do |merchant|
      sum += merchant.items.length
    end
    sum
  end

  def items_variance
    m = average_items_per_merchant
    sum = se.merchants.all.inject(0){|accum, merchant| accum + (merchant.items.length-m)**2 }
    sum/(se.merchants.all.length).to_f
  end

  def average_item_price_for_merchant(merchant_id)
    merchant = se.merchants.find_by_id(merchant_id)
    items = merchant.items
    sum = items.reduce(0) do |total, item|
      total + item.unit_price
    end
    sum/items.length.to_f
  end

  def average_item_price_for_merchant2(merchant_id)
    merchant = se.merchants.find_by_id(merchant_id)
    items = merchant.items.collect {|i| i.unit_price }
    items.mean
  end

  def average_price_per_merchant
    total_merch =total_number_of_merchants
    merchants = se.merchants.all
    items =  merchants.map {|merchant| merchant.items}.flatten
    total_items_price = items.reduce(0) do |total, item|
      total + item.unit_price
    end
    total_items_price/total_merch
  end

  def average_price_per_merchant2
    merchant_avg_price_hash = {}
    se.merchants.each{ |m|
      sum = m.items.reduce(0){ |memo,i|
        memo += i.unit_price.to_f
      }
      
      merchant_avg_price_hash[m.id] = sum/m.items.length
    }
    merchant_avg_price_hash.mean
  end

  def prices_variance
    m = average_price_per_merchant
    sum = se.items.all.inject(0){|accum, item| accum + (item.unit_price-m)**2 }
    sum/(se.items.all.length).to_f
  end

  def prices_std_deviation
    Math.sqrt(prices_variance)
  end
  def golden_items
    #sudo

    #find golden items: unit_price > average + 2*std_deviations
    average = average_price_per_merchant
    std_dev = prices_std_deviation
    threshold = average + std_dev * 2
    items = se.items.all
    items.select {|item| item.unit_price > threshold}

    # go through each item, compare its unit_price to the threshold, and if it's greater than store it

  end

end

se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})

sa = SalesAnalyst.new(se)
#binding.pry
puts "average_item_price_for_merchant(12334105)"
puts sa.average_item_price_for_merchant(12334105).to_f
puts sa.average_item_price_for_merchant2(12334105)
puts "average_price_per_merchant"
puts sa.average_price_per_merchant.to_f
puts sa.average_price_per_merchant2
puts "average_items_per_merchant"
puts sa.average_items_per_merchant
puts sa.average_items_per_merchant2
puts "average_items_per_merchant_standard_deviation"
puts sa.average_items_per_merchant_standard_deviation
puts sa.average_items_per_merchant_standard_deviation2
