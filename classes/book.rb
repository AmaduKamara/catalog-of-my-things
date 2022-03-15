class Book < Item
  def initialize
    @publisher = publisher
    @cover_state = cover_state
    super
  end

  def can_be_archived?(item)
    item.can_be_archived? == true
  end
end
