require_relative './item'

class Author
  attr_accessor :id, :first_name, :last_name

  def initialize(id, first_name, last_name)
    # super(id:, publish_date:, archived: false)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  # item = Item.new()

  # def add_item(item)
  #   @items.push(item)
  # end
end

new_author = Author.new(2, 'Samuel', 'Amkam')
puts new_author.last_name
