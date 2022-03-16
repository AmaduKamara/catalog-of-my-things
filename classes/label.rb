class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(id: , title:, color:)
    @id = id || Random.rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
