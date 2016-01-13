#require 'math'
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
    sum/num_merchants
  end

  def average_items_per_merchant_standard_deviation
    Math.sqrt(items_variance)
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
    sum/(se.merchants.all.length - 1).to_f
  end








end
