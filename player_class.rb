class Player
    attr_accessor :symbol, :taken_cells, :name
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @taken_cells = []
    end
end



