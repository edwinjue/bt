class Item

  attr_reader :name, :description, :unit_price, :created_at, :updated_at, :id

  def initialize(args, id = 131234)
    @name = args[:name]
    @description = args[:description]
    @unit_price = args[:unit_price]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    @id = id
  end





end
