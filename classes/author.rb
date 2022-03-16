class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(id:, first_name:, last_name:)
    @id = id || Random.rand(1..500)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
