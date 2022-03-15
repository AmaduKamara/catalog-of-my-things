class Book < Item
  attr_accessor :publisher, :cover_state, :items

  def initialize(publisher:, cover_state:, publish_date:)
    @publisher = publisher
    @cover_state = cover_state
    @items = []
    super(id: nil, publish_date: publish_date)
  end

  def add_item(publish_date, archived, label)
    Item.new(publish_date, archived, self, label)
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
