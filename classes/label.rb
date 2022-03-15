class Label
  attr_accessor :title, :color, :items

  def initialize(id:, title:, color:)
    @id = id || Random.rand(1..500)
    @title = title
    @color = color
    @items = []
    super
  end

  def add_item(publish_date, archived, book)
    Item.new(publish_date, archived, book, self)
  end
end
