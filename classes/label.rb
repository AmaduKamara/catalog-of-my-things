class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title:, color:)
    @id = id || Random.rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_item(publish_date, archived, book)
    Item.new(publish_date, archived, book, self)
  end
end
