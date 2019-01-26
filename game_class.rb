require './player_class.rb'

class Game
    attr_accessor :cells; :end_game

    def initialize
        @cells = [" "]*9
        @player_1 = Player.new("Player1", 'X')
        @player_2 = Player.new("Player2", 'O')
        @current_player = @player_1
        @end_game = false
    end 

    def draw_board
        puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]}"
        puts "-----------"
        puts "\n #{cells[3]} | #{cells[4]} | #{cells[5]}"
        puts "-----------"
        puts "\n #{cells[6]} | #{cells[7]} | #{cells[8]}"
    end

    def draw_legend
        puts "Legend: "
        puts "1|2|3"
        puts "4|5|6"
        puts "7|8|9"
        puts "\n"
    end 

    def switch_player
        if @current_player == @player_1
            @current_player = @player_2           
        else
            @current_player = @player_1
        end
    end

    def player_input
        puts "please input the number"
        input = gets.chomp.to_i
        if input.between?(1,9)
            return input
        else
            self.player_input
        end
    end

    #collect the number that the player has input
    def player_move
        move = player_input-1
        if cells[move] = " "
            cells[move] = @current_player.symbol
        else
            puts " please choose other number, this one taken"
            self.player_move
        end
        @current_player.taken_cells << move
    end
    
    #decide who wins the game or it is a draw
    def check_end_game
        if @player_1.taken_cells.size + @player_2.taken_cells.size == 9
            puts "it is a draw"
            return @end_game = true
        end
        conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        conditions.each do |condition|
            if @current_player.taken_cells == condition
                puts "#{@current_player} wins"
                return @end_game = true    
            end
        end
        return @end_game
    end

end





