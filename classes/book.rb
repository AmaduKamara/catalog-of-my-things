class Book < Item
  attr_accessor :publisher, :cover_state, :items

  def initialize
    @publisher = publisher
    @cover_state = cover_state
    @items = []
    super
  end

  def add_item(publish_date, archived, label)
    Item.new(publish_date, archived, self, label)
  end

  def can_be_archived?(item)
    item.can_be_archived? == true || cover_state == 'bad'
  end
end
