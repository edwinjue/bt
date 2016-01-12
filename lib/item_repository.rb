class ItemRepository

  attr_reader :items

  def initialize
    @items = []
  end

  def load_data(filename)
    data = CSV.open filename, headers: true, header_converters: :symbol

    data.each do |row|
      items << Item.new({ :name => row[:name],
        :description => row[:description],
        :unit_price => row[:unit_price],
        :created_at => row[:created_at],
        :updated_at => row[:updated_at]
        },row[:id])
      end

  end

  def find_by_id(id_number)
    items.find do |item|
      item.id == id_number
    end

  end

  def all
    @items
  end


end
