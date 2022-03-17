class Genre
  attr_accessor :items, :name, :id

  def initialize(name:)
    @id = id || Random.rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
