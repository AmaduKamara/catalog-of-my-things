class Label < Item
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
    super
  end

  def add_item(publish_date, archived, book)
    Item.new(publish_date, archived, book, self)
  end
end
