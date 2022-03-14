require './item'
attr_accessor: :on_spotify
class MusicAlbum < Item
    def initialize(id: nil, on_spotify: false)
        @id = id || Random.rand(1..500)
        @on_spotify = on_spotify
    end
end